`include "cpu.svh"

module cpu
    # ( parameter DATA_WIDTH = 32, 
        parameter ADDR_WIDTH = 5)
    (
        input logic clk, clk_en, rst,
        input logic [31:0] r_data,
        output logic wr_en,
        output logic [31:0] mem_addr, w_data,
        
        // current instruction for debugging / OK interface
        output logic [31:0]       instr,

        //OK regs
        output logic [DATA_WIDTH-1:0] regs_ok [0:2**ADDR_WIDTH-1]
    );


    /*

        You should split the CPU into one or more submodules. 
        We have provided modules for you to use inside the CPU. Please see the following files:
            reg_file.sv (register file)
            reg_en.sv (register with enable and reset),
            reg_reset.sv (register with only reset)
            alu.sv (ALU)

        Useful constants and opcodes are provided in cpu.svh, which is included 
        at the top of this file.

    */

    // Controls supplied by the controller.
    logic fetch_en;
    logic read_en;
    logic execute_en;
    logic writeback_en;

    // Values preserved between cycles.
    logic [31:0] pc;
    logic [31:0] operand_a, operand_b;
    logic [31:0] saved_result;

    // Register-file connections.
    logic [31:0] rs_value, rt_value;
    logic rf_write_en;

    // ALU connections.
    logic [31:0] alu_x, alu_y, alu_result;
    logic [3:0] alu_op, instruction_alu_op;
    logic alu_zero;

    // Instruction classification.
    logic supported_function;
    logic supported_instruction;
    logic shift_instruction;
    
    
    /* Datapath */
    /*
         
        The CPU interfaces with main memory which is enabled by the
        inputs and outputs of this module (r_data, wr_en, mem_addr, w_data)
        You should create the register file, flip flops, and logic implementing
        a simple datapath so that instructions can be loaded from main memory,
        executed, and the results can be inspected in the register file, or in
        main memory (once lw and sw are supported). 

    */
    // clk must be enabled, writeback stage only, destination cannot be $zero.
    assign rf_write_en = clk_en && !rst && writeback_en && (instr[15:11] != 5'd0);        

    reg_file #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) rf (
        .clk     (clk),
        .wr_en   (rf_write_en),
        .w_addr  (instr[15:11]),
        .r0_addr (instr[25:21]),
        .r1_addr (instr[20:16]),
        .w_data  (saved_result),
        .r0_data (rs_value),
        .r1_data (rt_value),
        .regs_ok (regs_ok)
    );

    // instantiate register files that "save" values:
    // PC, Instruction, Mem/Data, A/B, ALUResult
    reg_en #(
        .N(32),
        .INIT(`I_START_ADDRESS)
    ) pc_storage (
        .clk (clk),
        .rst (rst),
        .en  (clk_en && fetch_en),
        .d   (alu_result),
        .q   (pc)
    );

    reg_en #(
        .N(32),
        .INIT(0)
    ) instruction_storage (
        .clk (clk),
        .rst (rst),
        .en  (clk_en && fetch_en),
        .d   (r_data),
        .q   (instr)
    );

    reg_en #(
        .N(32),
        .INIT(0)
    ) a_storage (
        .clk (clk),
        .rst (rst),
        .en  (clk_en && read_en),
        .d   (rs_value),
        .q   (operand_a)
    );

    reg_en #(
        .N(32),
        .INIT(0)
    ) b_storage (
        .clk (clk),
        .rst (rst),
        .en  (clk_en && read_en),
        .d   (rt_value),
        .q   (operand_b)
    );

    reg_en #(
        .N(32),
        .INIT(0)
    ) result_storage (
        .clk (clk),
        .rst (rst),
        .en  (clk_en && execute_en),
        .d   (alu_result),
        .q   (saved_result)
    );
    
    
    // decode instructions!
    always_comb begin
        instruction_alu_op = `ALU_ADD;
        supported_function = 1'b1;
        shift_instruction  = 1'b0;

        // for R-type: gets the 6b funct code
        case (instr[5:0])
            `F_ADD: instruction_alu_op = `ALU_ADD;
            `F_SUB: instruction_alu_op = `ALU_SUB;
            `F_AND: instruction_alu_op = `ALU_AND;
            `F_OR:  instruction_alu_op = `ALU_OR;
            `F_XOR: instruction_alu_op = `ALU_XOR;
            `F_NOR: instruction_alu_op = `ALU_NOR;
            `F_SLT: instruction_alu_op = `ALU_SLT;

            `F_SLL: begin
                instruction_alu_op = `ALU_SLL;
                shift_instruction = 1'b1;
            end

            `F_SRL: begin
                instruction_alu_op = `ALU_SRL;
                shift_instruction = 1'b1;
            end

            `F_SRA: begin
                instruction_alu_op = `ALU_SRA;
                shift_instruction = 1'b1;
            end

            default: begin
                supported_function = 1'b0;
            end
        endcase
    end

    assign supported_instruction =
        (instr[31:26] == `OP_RTYPE) && supported_function;
        
        
    // decides how to use ALU: for actual instruction execution or PC+4 calculation
    always_comb begin
        // Ordinary R-type operation.
        alu_x  = operand_a;
        alu_y  = operand_b;
        alu_op = instruction_alu_op;

        if (fetch_en) begin
            // Fetch uses the same ALU to advance PC.
            alu_x  = pc;
            alu_y  = 32'd4;
            alu_op = `ALU_ADD;
        end
        else if (shift_instruction) begin
            // Fixed shifts use rt and the instruction's shamt field.
            alu_x = operand_b;
            alu_y = {27'b0, instr[10:6]};
        end
    end

    alu #(
        .N(32)
    ) execution_alu (
        .x    (alu_x),
        .y    (alu_y),
        .op   (alu_op),
        .z    (alu_result),
        .zero (alu_zero)
    );
    
    // for part b
    assign mem_addr = pc;
    assign w_data   = operand_b;
    assign wr_en    = 1'b0; // default

    /* Controller */
    /*

        You should also create a control FSM that controls the behavior of the 
        datapath depending on the instruction that is currently executing. 
        

    */
    cpu_controller controller (
        .clk                   (clk),
        .clk_en                (clk_en),
        .rst                   (rst),
        .supported_instruction (supported_instruction),
        .fetch_en              (fetch_en),
        .read_en               (read_en),
        .execute_en            (execute_en),
        .writeback_en          (writeback_en)
    );
    


endmodule

