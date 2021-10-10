onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+buttons_vio -L xil_defaultlib -L secureip -O5 xil_defaultlib.buttons_vio

do {wave.do}

view wave
view structure

do {buttons_vio.udo}

run -all

endsim

quit -force
