onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+fpd_cmp -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fpd_cmp xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fpd_cmp.udo}

run -all

endsim

quit -force
