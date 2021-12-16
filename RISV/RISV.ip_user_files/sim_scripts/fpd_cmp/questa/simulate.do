onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fpd_cmp_opt

do {wave.do}

view wave
view structure
view signals

do {fpd_cmp.udo}

run -all

quit -force
