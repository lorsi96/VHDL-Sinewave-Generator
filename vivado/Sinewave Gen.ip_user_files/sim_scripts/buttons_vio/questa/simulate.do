onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib buttons_vio_opt

do {wave.do}

view wave
view structure
view signals

do {buttons_vio.udo}

run -all

quit -force
