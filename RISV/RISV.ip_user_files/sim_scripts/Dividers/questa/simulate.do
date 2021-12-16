onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib Dividers_opt

do {wave.do}

view wave
view structure
view signals

do {Dividers.udo}

run -all

quit -force
