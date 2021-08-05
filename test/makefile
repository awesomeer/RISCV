SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, %.o, $(SRC))

VER = riscv32-unknown-elf

CC = $(VER)-gcc
LD = $(VER)-ld

#LIB_PATH = 	-L"/opt/riscvim/lib" \
			-L"/opt/riscvim/lib/gcc/riscv32-unknown-elf/11.1.0" \
			-L"/opt/riscvim/riscv32-unknown-elf/lib"

CCFLAGS = -g -c -ffreestanding -nostartfiles -O1
LIB_ARG = -Wl,-T lnks.ld -lm -lnosys -lriscv


main: entry.o $(OBJ)
	$(CC) -o main entry.o $(OBJ) -g -O1 -ffreestanding -nostartfiles $(LIB_ARG)
	$(VER)-objdump -S -d main > obj.txt

	$(VER)-readelf main -x 1 > hex.txt
	python3 rom.py hex.txt > /media/sf_share/memrom.txt

	$(VER)-readelf main -x 2 > hex.txt
	python3 rom.py hex.txt > /media/sf_share/datarom.txt

	$(VER)-readelf main -x 4 > hex.txt
	python3 ram.py hex.txt > /media/sf_share/ram.coe

entry.o: entry.c
	$(CC) $(CCFLAGS) -o $@ $<

$(OBJ): $(SRC)
	$(CC) $(CCFLAGS) -o $@ $(patsubst %.o, src/%.c, $@)


clean:
	rm *.txt *.o main