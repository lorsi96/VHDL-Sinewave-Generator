vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl/verilog" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl/verilog" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/sim/buttons_vio.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

