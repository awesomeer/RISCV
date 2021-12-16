onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fpd_div_opt

do {wave.do}

view wave
view structure
view signals

do {fpd_div.udo}

run -all

quit -force
