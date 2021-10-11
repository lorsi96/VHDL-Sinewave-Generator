vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl/verilog" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl/verilog" "+incdir+../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/hdl" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/sim/buttons_vio.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

