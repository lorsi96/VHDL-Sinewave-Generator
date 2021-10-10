vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../Sinewave Gen.srcs/sources_1/ip/buttons_vio/sim/buttons_vio.vhd" \


