// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sat Oct  9 16:46:00 2021
// Host        : lorsi-ThinkPad-T490 running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire CLK;
  wire [15:0]Q;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_12 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_12
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [15:0]L;
  output THRESH0;
  output [15:0]Q;

  wire CLK;
  wire [15:0]Q;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_12_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
HXV4h5+M0Gyv7vvpLcg9doICq0dE9GVjJBO+hNdPTJvgX0VGA4ugqBKlkEqGuOyKztRGzLB27s8X
6i5leC2InQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dAxa0GFtAgoazxeRmxSl0Yps/nJ8Rpb3lCs3dkGXEdmxjp4N5EFfyS7U0FLTPNVV4xnePCr4q647
L4KcUzdGFlWPqo/QF8lyz6PEdU6dW8BktZKhrZHQ5uhG7d/Bf0EOVUn0mzfj8sgbaKWZYTEDERK6
pLNcwS3fMTcRzexShzE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qFA2Sas20o42qyLKUfSMJZGJ7FMOuYDRWyURzBBH3n2Qkaa75HLaliBCTs00LUZYplObnmj1+ZAf
80sKN7qGXguQ1PwKDYYHAVh9l9yGVlyNwObLOec7nrtHIPRPZ1Am330sVZYMipFnG9PAZanD2fe4
zBKk26jw4HdRQmG3vM1SWF3vXt1VR+UBS5eMUwG6haQqtGIZWHz48uyl4zc44Tqr2H4sR+yo0gE9
bXUY7Oc0GQvnczTzBftbc9jGOvnoi8sVcybTki5B/gTVWkBqcYl+Bx+SSOCo+FyQZGBqrUAFnf1m
pKFCRJnXqs4g3cmrmEG2RflwrWfJCOs3QdUjPQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EHIPCw3tqvASBeRc846RSvWMIU/QBgZYfNTkmzG9OlWqwIA3ukwCJx+dEAZCMyg/i7GW815EkwKE
ar/FOnRiTLMQpurIVTi3As1Sl6c1DkXq90HBljZSq18EFjvlH8nsGa0654mVCFQN3PiQfUfggiqD
LwP079R222U916zaDIMw6ZgRcbfM7bBAp73emqe6OC5mrt4mMGZ9AbQkGRU4iJeWX5x5zM0ev20/
2HCVT3rThYEK/hMu/29O6ZYpOwhKqVFUV8jaodAIgDRiYY0qd/CTZK9mvOgSUj0t6cJN4/Q/wVKt
mcOTr4F5A5rnCTva3pM2/SBekXOwQb01/rlfUQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L4GJr0S0dl+C4k+rj1r/KaqPKn7XGNysYQlDBTRHxj0Zgto0TejuU3cSjQJkMo/IlhkL5vx3hSMx
8DXh0KGY4W7Mmk5SffBJgti7D1pd1YP3w0zgDKIAkTLpoXaZECn77Jp9JWvdxrSHUb44QeC0VkRr
TT67tMIjtV+eqkCUfUiCSGq39iRyI7EpdVInAevmPCNIG5K4rHLTX0aJWAbgDwBRaTpw7W4wOBUe
Kag07iTsJYfG9TBJdRao3h4g2IyFjrcf4tdYFjQEIGB4Vfxhy6K9JjnkkfxGJQ4A0VrJVKlHsJFv
1+MmwN5+h/oRYCFJgcCtGfttJc2/AOQ8JKB8cw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gW6aOcJbrDMK7JqUnzFxAaYM2DL8EnxF345IOLkdfKxGnLCsw0mROpfP26LD91CJidCf9vaqLHsN
jwsLktZ7qUykkQzv9vOvGkB2KoLh32fPvZjhbcdDei3fy9cH8haCHJCiSghwIIOfzcXDyQO7+mpH
LfBUho9v0PmfLkeqSuE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YOgS+O+OWj8gVxfmdd2e+iTOOA4l1LloRJHtygw6wsU5a/FGoLxtLFOm39pCwOesAIo5cgP1cY7j
GMsvnPuTgP6YVNEPrLenO+0bM+rFgEpkVPDLGiQdrj+9tlcVifFJGGcDEFMtdjPm7SvdpsEh2Fzk
ZyTciJbc1vOSbmNUfL7f5SyT4X8NVQCnr4aIhzmrObrl+d/HXH5pWY0/wveklgGbBxwN3pI0aNdn
cY/a3XotdDTVTgdYnz9zaxscNhKuVHf6BpyCfI+XDdopSBDa7E47+Tot6Ck17VwjOOAKkqSNjD7+
HzzA77lmBhIrUxZnuOejS1O/VD/gmpze9ZPaeA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nU5CDmGef3xBnZXeWFNaLXnGijTF4PTCXLWXT3fvsKndFMEnZBHLAWci1fgeB+CNFTy3/c7HKFMX
aA+sHRJvDUumWAMBxSH2rhEixYdNxCRV2U6RVeKMwrhrCRWw6DaM74bgauXyVWtlDL5VFrG0HTmf
c+SQjTM/Ah4nrYJO5cEF20dZrPg1WPVRL0tjFi490B4OXbpMcBQAVJzC3iOprSBkZ3U8a+9C9T90
x+xKzjAGZ38s/wPsyHlC88txfQE3m0is4HbntkD36u6zwTQCLydb/7EzSIyB3rFYDBsS/C/g152g
IOMpS7/81NNGTJk0b4AimS8wVyfPGQIoZr3Ltw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eNTRCTMG3X0KMm71l8/Nk+Hw//XrINkHeaPFSf8OLFTpyMn+OKF89ysIn6mAXTlXA4EageNgjsp5
ax0pEaZFxmIbWJkrT/L5UpvuCJA5Fzy41byrqPrLHT3orab31v9c/ptU4Eqw41UAQa8iS1INOtZC
Nin0utzpuBL0+LOfZe6vzVm+3hRvHhlDGZWJ/VnwKpWuzCvauOCwdKOOIUxsTy6SkUVAU8YdY/4f
aCffKYWcE1eKB2m9X+QsJLRlwlMGD+cf5EDlNp9yJiwQpKi6u/KLy39WD/S2qqrIMOgjmkMc1OFQ
kJo3uVpVyuGtLY3SNnqLRb62eOh/7I6qsHNTVA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8672)
`pragma protect data_block
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
PtOMa1/OqLs=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
