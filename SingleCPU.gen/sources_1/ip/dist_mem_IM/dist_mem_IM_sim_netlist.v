// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Nov 25 14:19:06 2025
// Host        : LAPTOP-ACVVA4LQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_projects/CPUlessons/SingleCPU/SingleCPU.gen/sources_1/ip/dist_mem_IM/dist_mem_IM_sim_netlist.v
// Design      : dist_mem_IM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dist_mem_IM,dist_mem_gen_v8_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_17,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module dist_mem_IM
   (a,
    spo);
  input [6:0]a;
  output [31:0]spo;

  wire [6:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "7" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "128" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "dist_mem_IM.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  dist_mem_IM_dist_mem_gen_v8_0_17 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FdZ29m26W1vj+Cs/DLJCoTOUz/m7+OJG3sHOgt5s8NEPQ5FHtOFz4fRgqTgyrNzvNq21lk0VjpX9
UMVEbSXbJrC40crYnx5XneHRwr6z9uk6MXgKoH1FHcznnKhevagwuCchTCpQ6oqoMbhzWd2QHx/v
Pkor8V47KvEBnEHja7Q=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DgywwNcpeS8jND8bxEa71yZJ3FJdVEzcLynb64dnb2TzUo3pKSGFBfaFrgTZF3YNHGzuUJ2QQktc
gOS5J0CcVw+n+aerigILzjTclkLc9eUIulkdUapbmj6Staw/UyV8tYP4SZZ8/c285RLhOXD7yU47
aByWm7LmxxWjooRAz26ybpmdt7lpHBQaNTc1Ljp9oCyvtSqxXf5Fzr6NwE9wCWHGozsMntKGlBWq
/Ld4jJ9UVtrIM3FKdUF21rHccua0AApkyY92z4umdT7kj4mZxPKTdC7zYiKWRUq2hGAlbh1z47nC
oAaSpPvOVZY7BQppznHPyLPhJ+OgKj6/rfTVMA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
TpTqgO7LVAmk2RI9B8mgZrp5H21SnS0bmTRlpg9WONkWIeKkOMiqYzKXNi+GTasTvmpRPk/h3m9P
wkWG5aX3dHNZUb1oSMhjGbyAcJpO+SX7mcsmzpt+efdEtPDukAHegpQfvEWKkx2SrrkkgD0X++Oj
CaqCq5FvcRl9RjvTxK4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sckknZF7xLyHpnPIcxIFLiAYqXW1FY2CS9FWi2Hqz5vcUlh7by0h8yYiwSXxIUNrBJPATd3AyESC
487cvtya2VioL8riKucCJWyqQBG7eDyT0O7JtdZYcpo9uNh6dkN86IV7J1BLYVlk/Z2uc+LRdLiA
I2w8Z4wc+UHp3wx4497iJfYpHaKSPNO+8A8WV/JJ1mzSLBI14cO9CDFly9KlHktwr4HKutMId1R2
VPSy/znW8qx9XUnd0EN31c/9LJnfU1yhBPG9Wx8Hd96IBwI9D/WgN7ZQyH8bSZCcHX+SYoIGPwXn
K5ZKQy1K7ELwUBUUPbGlR+ir3yvvGjob1CTeMg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T6BTO2RUQcpX9TpJR2JO50hT+cXyiDyIjrO2Ps17SKTmMhVBfSGD2AUMwzKJINBU1/wI4nqsnk0R
B5YRLWXrZfCSjSapre9CmGTRvLCDEK4mm3l4Jo9Ij9iBFg2OvLFfyBLP/fZtLtzCPHtMlTmKn7C3
9Ert7v3yDGnFF+1Msw/UpTjpdSZ4dNE8UGUe5ymCwpDVeCcYuoCTBe5o7BDlcM6cbXMfHvxQkBDH
BQkO5txX5aV2qeKOYfWQucZe9q7aoq4zcNG3roo8G4OrO31xnxdwAQU8tvOCztoGHXLSPEwLy86h
lybMIS19uovvmz2FF0BKAfQmf2zT2kdhs/0E/g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qFdGo2cl1WGkQBqlM3e3YM1+NstrsuheqspzsHjhiEdsfZE7cNV3QtgmcPm0sQ6Ur85Vr+VLP+qi
kfkSBZv/cp96m2VbdU3wKRoyTYzTU2jPpW7sGFFNzWS9+RUl8sTVLht5d4t2CNOGni/aTPg72L/m
EMDSFNr5zmZHrz9ZfvCDtOuBIV7kMLfZPmDdxV5IwsKMxabGnoXOJGz+hfjGo4fS3o0ORBwIVK+l
mvU1GZj8rJVgjjtXmyh6mIw/6PchaANzWFqpNusTs0IG2f3q7OE0VBOM5Am+iaDdeW6TlD3NJO83
Fu/vCJwu/i0r7tthiRGj94Azl8RnEN2KK7tBlA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g77N+3QvAPAYw+4OcZm63AqmcCkwUoxBBbPDHeq2Nfprvo7Bj7LixjYXj3xyrnR8haey/83rTRib
U8uD29Fgb15vpUc0WthyXJ59GM2fKf1KCeTQtG6TwZDLuOLNJNaeGFe+JU6iYvvLnOQZ3aPsmfcT
4GCJv1sKrMCf5d2VkK5yqBhV9Xik8ugmxG6gW1xkr0ULwrG4CYrZAEPhwUoiL+6RLajwaMyW0fhu
TihpJjKW17O8yAizfvC4zdrTR7abBHMBRX51n0fYXfSNTJZH84wlEZ/uaRGrT3tziopYXWPsmWSq
JJ5Q30ZViY8s/kqmcILk7jzkE5iBk7FfRk2AHw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
KCCTN2ufL/SeejpVpXJmjN/FwrAflQw79fl4pWJPTrncXR+h72Z53BIfG+PPQuyFWo2dT+31hFh2
sUjBKcBwHP9yjxsmRjhWVA4YtsuTiFCa3GwHalwHMC9EJN8EOmcee6T0DD8eKj13S7DJ+LDuhg0a
CAhAdS+Z3c57AAFhfKZ64/xN+dwK+7T+oXbmBDtxKw+D7VXMZLVjJ7ozXveIocAFo9MLpyq0mXPL
m47fmY77h7JdJ8BnZ0qXpublK3I9ahjB6+iTR7hAu417IqmFRnmc0ICovANVgmMBsOU54gzqFRS1
4jIQ7pPGSuMMJ5F+bWiKn1kahxg2JXS+3rf9r5Jyc2Ht4bO62YYec93HOrFxzErn9LzUFSvXe8JC
M/OAkWw+gqiiLbQsh+1Hfn4j9JSiL/n8yCkGXAr8x/vdfzkIBv4QpsSo5rGTuXS2x27KOAsuV7X7
maV86bXDbpBaMN1hZLtFkWNpTJE03j5Hq7cTDh+EySOe2NSwB0potFkw

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DB5hKjvS9FmG+/wPMbBeHe5M88req0CpR1ooQpQHlIx5dQoUMI8l84F0JQ8hAkUaWLkU1VXXMNmW
eRJoUf6rnT4CbNo5SFwNWSXohTyDSupMazp2OYDlVlTgfUyyJ+lVIViRHiC3vIbi1J7fLoZ1Bt9F
cr98l0aF9q+NPMPI9Xs8X4XYYXL9FyHNyb3bAoEI1OPmH5ywFB+fJ73hp3aEXHx9pcl2RKryf1m/
Q98GVV/ZXzQmgGNEdveABCSK3XNXC0Ro6IHFjACUVo3VTsjMMx1k2n+MWq7Zbp5l8ZcvX+F+NHY6
q/Cm8B96kJQ4bGZ0qnzIYoKDGY7YEGWVJFoWQg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18304)
`pragma protect data_block
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
IcW5U9CWoQ==
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
