// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Thu Oct  7 09:13:08 2021
// Host        : lorsi-ThinkPad-T490 running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               {/home/lorsi/Documents/CESE/CLP/VHDL-Sinewave-Generator/vivado/Sinewave
//               Gen.srcs/sources_1/ip/ila_sine/ila_sine_stub.v}
// Design      : ila_sine
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2018.1" *)
module ila_sine(clk, probe0, probe1, probe2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[7:0],probe1[0:0],probe2[7:0]" */;
  input clk;
  input [7:0]probe0;
  input [0:0]probe1;
  input [7:0]probe2;
endmodule
