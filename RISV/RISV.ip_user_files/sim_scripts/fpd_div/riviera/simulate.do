onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+fpd_div -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fpd_div xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fpd_div.udo}

run -all

endsim

quit -force
