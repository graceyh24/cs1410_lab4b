`timescale 1 ns / 10 ps
`include "cpu.svh"
// For this project the SystemVerilog testbench is
// provided, you do not need to modify it (much).
//
// You will have to write one or multiple MIPS programs
// that test the functionality of your CPU, and assemble
// them using your assembler from project 4, or the provided
// assembler. Then you can run this testbench and observe
// the results in the waveform viewer.


module cpu_tb();
    localparam DATA_WIDTH = 32; // reg file
    localparam ADDR_WIDTH = 5;

    logic clk = 0;
    logic clk_en, rst;

    logic wr_en;
    logic [31:0] mem_addr, w_data, r_data;
    logic [31:0] instr;

    logic [DATA_WIDTH-1:0] regs_ok [0:2**ADDR_WIDTH-1];

    rw_ram ram_unit 
    (
        .clk(clk),
        //.clk_en(clk_en),
        .clk_en(1'b1),
        .wr_en(wr_en),
        .addr(mem_addr),
        .w_data(w_data),
        .r_data(r_data)
    );
    
    //blk_mem_gen_0 bram ( .clk(clk), .clk_en(1'b1), .wr_en, .addr(mem_addr), .w_data, .r_data);
   
    cpu cpu_unit 
    (
        .clk(clk),
        .clk_en(1'b1),
        .rst(rst),
        .r_data(r_data),
        .wr_en(wr_en),
        .mem_addr(mem_addr),
        .w_data(w_data),
        
        .instr(instr),
        .regs_ok(regs_ok)
    );

    always #1 clk = ~clk;

    initial begin
	# 1000; // NOTE: increase this for simulation to run longer.
	$finish;
    end


    initial begin
        rst <= 1;
        # 22;
        rst <= 0;
    end

    always begin
        // clock does not need to be
        // divided for simulation
        clk_en <= 1;
        #5;
        clk_en <= 0;
        #5;
    end
    final begin
        $writememh("ram_dump.hex", ram_unit.dmem);
        $writememh("reg_dump.hex", regs_ok);
    end
endmodule
