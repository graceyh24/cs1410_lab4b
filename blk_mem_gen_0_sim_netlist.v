// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Mon Nov  3 18:48:37 2025
// Host        : sec-academic-1.int.seas.harvard.edu running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/kevinkim/cs1410_lab/lab4_STAFF/lab4/lab4_server/project_1.gen/sources_1/ip/blk_mem_gen_0_2/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.698 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1536" *) 
  (* C_READ_DEPTH_B = "1536" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1536" *) 
  (* C_WRITE_DEPTH_B = "1536" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48384)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
