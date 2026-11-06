`include "cpu.svh"

module rw_ram
    #(
        parameter I_LENGTH = 512,
        parameter I_WIDTH = 9,
        parameter D_LENGTH = 1024,
        parameter D_WIDTH = 10
    )
    (
        input logic clk, clk_en,
        input logic wr_en,
        input logic [31:0] addr,
        input logic [31:0] w_data,
        output logic [31:0] r_data
    );

    logic [31:0] imem [0:I_LENGTH-1];
    logic [31:0] dmem [0:D_LENGTH-1];
    logic [31:0] data_reg;
    logic i, wr_i_en, wr_d_en;

    logic [I_WIDTH-1:0] phy_i_addr;
    logic [D_WIDTH-1:0] phy_d_addr;

    assign i = (addr >= `I_START_ADDRESS);
    assign wr_i_en = i & wr_en;
    assign wr_d_en = ~i & wr_en;

    assign phy_i_addr = addr[I_WIDTH+1:2];
    assign phy_d_addr = addr[D_WIDTH+1:2];

    initial begin
        $readmemh("data.mem", dmem);
        $readmemh("b_instr_2.mem", imem);
    end

    always_ff @(posedge clk) begin
        if (wr_d_en && clk_en)
            dmem[phy_d_addr] <= w_data;
    end

    always_ff @(posedge clk) begin
        if (wr_i_en && clk_en)
            imem[phy_i_addr] <= w_data;
    end

    assign r_data = i ? imem[phy_i_addr] : dmem[phy_d_addr];
endmodule
