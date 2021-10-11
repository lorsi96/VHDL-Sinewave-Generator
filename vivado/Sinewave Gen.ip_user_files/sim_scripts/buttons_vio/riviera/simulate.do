onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+buttons_vio -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.buttons_vio xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {buttons_vio.udo}

run -all

endsim

quit -force
