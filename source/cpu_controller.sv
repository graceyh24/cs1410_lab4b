module cpu_controller (
    input  logic clk,
    input  logic clk_en,
    input  logic rst,
    input  logic supported_instruction,

    output logic fetch_en,
    output logic read_en,
    output logic execute_en,
    output logic writeback_en
);

    typedef enum logic [2:0] {
        MEMORY_WAIT,
        FETCH,
        READ_REGS,
        EXECUTE,
        WRITEBACK
    } state_t;

    state_t state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= MEMORY_WAIT;
        else if (clk_en)
            state <= next_state;
    end

    always_comb begin
        // Safe defaults: no storage changes requested.
        fetch_en     = 1'b0;
        read_en      = 1'b0;
        execute_en   = 1'b0;
        writeback_en = 1'b0;
        next_state   = MEMORY_WAIT;

        case (state)
            MEMORY_WAIT: begin
                next_state = FETCH;
            end

            FETCH: begin
                fetch_en   = 1'b1;
                next_state = READ_REGS;
            end

            READ_REGS: begin
                read_en = 1'b1;

                if (supported_instruction)
                    next_state = EXECUTE;
                else
                    next_state = MEMORY_WAIT;
            end

            EXECUTE: begin
                execute_en = 1'b1;
                next_state = WRITEBACK;
            end

            WRITEBACK: begin
                writeback_en = 1'b1;
                next_state   = MEMORY_WAIT;
            end

            default: begin
                next_state = MEMORY_WAIT;
            end
        endcase
    end

endmodule