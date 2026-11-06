//same as OK_WRAP_ACC2 BUT:
//added the ok_done as output port + used the acc mem as the pipeout mem
//--------------------------------------------------------------------
`default_nettype none
`timescale 1ns / 1ps


// Definition
module cpu_top (
    input  wire [4:0]  okUH,
    output wire [2:0]  okHU,
    inout  wire [31:0] okUHU,
    inout  wire        okAA,
   
    input  wire        mmcm0_clk0,
	output wire [7:0]  led
	);


// Signals
// --OK Library
wire        okClk;
wire[112:0] okHE;
wire[64:0]  okEH;

// --Input wires and trigs
wire [31:0] WireIn11; //for reset div (OK)
wire [31:0] WireIn12; //for start_acc
wire [31:0] TrigIn40;

//Output wires (for registers)
wire [31:0] WireOut20; 
wire [31:0] WireOut21; 
wire [31:0] WireOut22; 
wire [31:0] WireOut23; 
wire [31:0] WireOut24; 
wire [31:0] WireOut25; 
wire [31:0] WireOut26; 
wire [31:0] WireOut27; 

wire [31:0] WireOut28; 
wire [31:0] WireOut29; 
wire [31:0] WireOut2a; 
wire [31:0] WireOut2b; 
wire [31:0] WireOut2c; 
wire [31:0] WireOut2d; 
wire [31:0] WireOut2e; 
wire [31:0] WireOut2f; 

wire [31:0] WireOut30; 
wire [31:0] WireOut31; 
wire [31:0] WireOut32; 
wire [31:0] WireOut33; 
wire [31:0] WireOut34; 
wire [31:0] WireOut35; 
wire [31:0] WireOut36; 
wire [31:0] WireOut37; 

wire [31:0] WireOut38; 
wire [31:0] WireOut39; 
wire [31:0] WireOut3a; 
wire [31:0] WireOut3b; 
wire [31:0] WireOut3c; 
wire [31:0] WireOut3d; 
wire [31:0] WireOut3e; 
wire [31:0] WireOut3f; 



// --Pipes
wire        pipeI_write;
wire        pipeO_read;
wire [31:0] pipeI_data;
wire [31:0] pipeO_data;

// --Buffers
reg  [31:0]  bufI_addr;
reg  [31:0]  bufO_addr;


//Inputs
wire reset_div;
wire buf_reset;
wire start_cpu;

assign reset_div  = WireIn11[0];
assign start_cpu  = WireIn12[0];
assign buf_reset  = TrigIn40[0];

//Registers  
localparam DATA_WIDTH = 32; // reg file
localparam ADDR_WIDTH = 5;
wire [DATA_WIDTH-1:0] regs_ok [0:2**ADDR_WIDTH-1];

assign WireOut20 = regs_ok[0]; 
assign WireOut21 = regs_ok[1]; 
assign WireOut22 = regs_ok[2]; 
assign WireOut23 = regs_ok[3];  
assign WireOut24 = regs_ok[4];  
assign WireOut25 = regs_ok[5];  
assign WireOut26 = regs_ok[6]; 
assign WireOut27 = regs_ok[7]; 

assign WireOut28 = regs_ok[8]; 
assign WireOut29 = regs_ok[9];  
assign WireOut2a = regs_ok[10]; 
assign WireOut2b = regs_ok[11];  
assign WireOut2c = regs_ok[12];  
assign WireOut2d = regs_ok[13];  
assign WireOut2e = regs_ok[14];  
assign WireOut2f = regs_ok[15]; 

assign WireOut30 = regs_ok[16];  
assign WireOut31 = regs_ok[17]; 
assign WireOut32 = regs_ok[18]; 
assign WireOut33 = regs_ok[19]; 
assign WireOut34 = regs_ok[20]; 
assign WireOut35 = regs_ok[21]; 
assign WireOut36 = regs_ok[22]; 
assign WireOut37 = regs_ok[23]; 

assign WireOut38 = regs_ok[24]; 
assign WireOut39 = regs_ok[25]; 
assign WireOut3a = regs_ok[26]; 
assign WireOut3b = regs_ok[27]; 
assign WireOut3c = regs_ok[28]; 
assign WireOut3d = regs_ok[29]; 
assign WireOut3e = regs_ok[30]; 
assign WireOut3f = regs_ok[31]; 



// --LED Handler
function [7:0] xem7310_led;
input [7:0] a;
integer i;
begin
	for(i=0; i<8; i=i+1) begin: u
		xem7310_led[i] = (a[i]==1'b1) ? (1'b0) : (1'bz);
	end
end
endfunction
assign led = xem7310_led(8'b0);



// Buffers addressing (word addressed, so increment address by 1 means we increment by 4 bytes)
always @(posedge okClk) begin
	if (buf_reset == 1'b1) begin
		bufI_addr <= 32'd0; 
		bufO_addr <= 32'd0; 
	end else begin
		if (pipeO_read == 1'b1) begin
			bufO_addr <= bufO_addr + 1; 
		end
		
		if (pipeI_write == 1'b1) begin
			bufI_addr <= bufI_addr + 1;
		end
	end
end


wire slow_clk;
CLK_DIV_OK clk_divider
(
    .clk_in(okClk),
    .rst(reset_div),
    .clk_out(slow_clk)
); 


logic wr_en;
logic [31:0] mem_addr, w_data, r_data;   
logic [31:0] instr;
logic wr_en_ram;
logic [31:0] addr_ram;
logic [31:0]w_data_ram;
logic [31:0] r_data_ram;
logic [31:0] io_addr;

assign io_addr = (pipeI_write) ? bufI_addr : bufO_addr;





// translate to physical memory
logic [31:0] mem_addr_in;

//assign mem_addr_in = (mem_addr >= `I_START_ADDRESS) ? (32'd4096 + mem_addr[9:0]): mem_addr;

assign mem_addr_in = (mem_addr >= `I_START_ADDRESS) ? (32'd1024 + mem_addr[11:2]): mem_addr[11:2];




blk_mem_gen_0 memory (
  //.clka(slow_clk),    // input wire clka
  //.ena(1'b1),      // input wire ena
  .clka(okClk),
  .ena(slow_clk & ~start_cpu),
  .wea(wr_en),      // input wire [0 : 0] wea
  .addra(mem_addr_in),  // input wire [9 : 0] addra
  .dina(w_data),    // input wire [31 : 0] dina
  .douta(r_data),  // output wire [31 : 0] douta
  
  
  .clkb(okClk),    // input wire clkb
  .enb(pipeI_write | pipeO_read),      // input wire enb
  .web(pipeI_write),      // input wire [0 : 0] web
  .addrb(pipeI_write? bufI_addr : bufO_addr),  // input wire [9 : 0] addrb
  .dinb(pipeI_data),    // input wire [31 : 0] dinb
  .doutb(pipeO_data)  // output wire [31 : 0] doutb
);

cpu cpu_unit 
(
    .clk(slow_clk),
    .clk_en(1'b1),
    .rst(start_cpu),
    .r_data(r_data),
    .wr_en(wr_en),
    .mem_addr(mem_addr),
    .w_data(w_data),
    
    .instr(instr),
    .regs_ok(regs_ok)
);


wire [65*34-1:0]  okEHx;

okHost okHI(
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE), 
	.okEH(okEH)
);


okWireOR # (.N(34)) wireOR (okEH, okEHx);


okTriggerIn  ep40 (.okHE(okHE),                             .ep_addr(8'h40), .ep_clk(okClk),         .ep_trigger(TrigIn40)); //for buf_reset
okWireIn     ep11 (.okHE(okHE),                             .ep_addr(8'h11), .ep_dataout(WireIn11)); //for reset_div
okWireIn     ep12 (.okHE(okHE),                             .ep_addr(8'h12), .ep_dataout(WireIn12)); //for start_cpu


okPipeIn     ep80 (.okHE(okHE), .okEH(okEHx[ 0*65 +: 65 ]), .ep_addr(8'h80), .ep_write(pipeI_write), .ep_dataout(pipeI_data));
okPipeOut    epA0 (.okHE(okHE), .okEH(okEHx[ 1*65 +: 65 ]), .ep_addr(8'ha0), .ep_read(pipeO_read),   .ep_datain(pipeO_data));

okWireOut    ep20 (.okHE(okHE), .okEH(okEHx[ 2*65 +: 65 ]), .ep_addr(8'h20), .ep_datain(WireOut20));
okWireOut    ep21 (.okHE(okHE), .okEH(okEHx[ 3*65 +: 65 ]), .ep_addr(8'h21), .ep_datain(WireOut21));
okWireOut    ep22 (.okHE(okHE), .okEH(okEHx[ 4*65 +: 65 ]), .ep_addr(8'h22), .ep_datain(WireOut22));
okWireOut    ep23 (.okHE(okHE), .okEH(okEHx[ 5*65 +: 65 ]), .ep_addr(8'h23), .ep_datain(WireOut23));
okWireOut    ep24 (.okHE(okHE), .okEH(okEHx[ 6*65 +: 65 ]), .ep_addr(8'h24), .ep_datain(WireOut24));
okWireOut    ep25 (.okHE(okHE), .okEH(okEHx[ 7*65 +: 65 ]), .ep_addr(8'h25), .ep_datain(WireOut25));
okWireOut    ep26 (.okHE(okHE), .okEH(okEHx[ 8*65 +: 65 ]), .ep_addr(8'h26), .ep_datain(WireOut26));
okWireOut    ep27 (.okHE(okHE), .okEH(okEHx[ 9*65 +: 65 ]), .ep_addr(8'h27), .ep_datain(WireOut27));

okWireOut    ep28 (.okHE(okHE), .okEH(okEHx[ 10*65 +: 65 ]), .ep_addr(8'h28), .ep_datain(WireOut28));
okWireOut    ep29 (.okHE(okHE), .okEH(okEHx[ 11*65 +: 65 ]), .ep_addr(8'h29), .ep_datain(WireOut29));
okWireOut    ep2a (.okHE(okHE), .okEH(okEHx[ 12*65 +: 65 ]), .ep_addr(8'h2a), .ep_datain(WireOut2a));
okWireOut    ep2b (.okHE(okHE), .okEH(okEHx[ 13*65 +: 65 ]), .ep_addr(8'h2b), .ep_datain(WireOut2b));
okWireOut    ep2c (.okHE(okHE), .okEH(okEHx[ 14*65 +: 65 ]), .ep_addr(8'h2c), .ep_datain(WireOut2c));
okWireOut    ep2d (.okHE(okHE), .okEH(okEHx[ 15*65 +: 65 ]), .ep_addr(8'h2d), .ep_datain(WireOut2d));
okWireOut    ep2e (.okHE(okHE), .okEH(okEHx[ 16*65 +: 65 ]), .ep_addr(8'h2e), .ep_datain(WireOut2e));
okWireOut    ep2f (.okHE(okHE), .okEH(okEHx[ 17*65 +: 65 ]), .ep_addr(8'h2f), .ep_datain(WireOut2f));

okWireOut    ep30 (.okHE(okHE), .okEH(okEHx[ 18*65 +: 65 ]), .ep_addr(8'h30), .ep_datain(WireOut30));
okWireOut    ep31 (.okHE(okHE), .okEH(okEHx[ 19*65 +: 65 ]), .ep_addr(8'h31), .ep_datain(WireOut31));
okWireOut    ep32 (.okHE(okHE), .okEH(okEHx[ 20*65 +: 65 ]), .ep_addr(8'h32), .ep_datain(WireOut32));
okWireOut    ep33 (.okHE(okHE), .okEH(okEHx[ 21*65 +: 65 ]), .ep_addr(8'h33), .ep_datain(WireOut33));
okWireOut    ep34 (.okHE(okHE), .okEH(okEHx[ 22*65 +: 65 ]), .ep_addr(8'h34), .ep_datain(WireOut34));
okWireOut    ep35 (.okHE(okHE), .okEH(okEHx[ 23*65 +: 65 ]), .ep_addr(8'h35), .ep_datain(WireOut35));
okWireOut    ep36 (.okHE(okHE), .okEH(okEHx[ 24*65 +: 65 ]), .ep_addr(8'h36), .ep_datain(WireOut36));
okWireOut    ep37 (.okHE(okHE), .okEH(okEHx[ 25*65 +: 65 ]), .ep_addr(8'h37), .ep_datain(WireOut37));

okWireOut    ep38 (.okHE(okHE), .okEH(okEHx[ 26*65 +: 65 ]), .ep_addr(8'h38), .ep_datain(WireOut38));
okWireOut    ep39 (.okHE(okHE), .okEH(okEHx[ 27*65 +: 65 ]), .ep_addr(8'h39), .ep_datain(WireOut39));
okWireOut    ep3a (.okHE(okHE), .okEH(okEHx[ 28*65 +: 65 ]), .ep_addr(8'h3a), .ep_datain(WireOut3a));
okWireOut    ep3b (.okHE(okHE), .okEH(okEHx[ 29*65 +: 65 ]), .ep_addr(8'h3b), .ep_datain(WireOut3b));
okWireOut    ep3c (.okHE(okHE), .okEH(okEHx[ 30*65 +: 65 ]), .ep_addr(8'h3c), .ep_datain(WireOut3c));
okWireOut    ep3d (.okHE(okHE), .okEH(okEHx[ 31*65 +: 65 ]), .ep_addr(8'h3d), .ep_datain(WireOut3d));
okWireOut    ep3e (.okHE(okHE), .okEH(okEHx[ 32*65 +: 65 ]), .ep_addr(8'h3e), .ep_datain(WireOut3e));
okWireOut    ep3f (.okHE(okHE), .okEH(okEHx[ 33*65 +: 65 ]), .ep_addr(8'h3f), .ep_datain(WireOut3f));


endmodule
