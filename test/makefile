SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, %.o, $(SRC))

VER = riscv32-unknown-elf

CC = $(VER)-gcc
LD = $(VER)-ld

CCFLAGS = -g -c -ffreestanding -nostartfiles -O1 -ffunction-sections

CC_ARG  = -g -O1 -ffreestanding -nostartfiles
LIB_ARG = -Wl,-T lnks.ld -lm -lnosys -lriscv


main: $(OBJ)
	$(CC) -o main $(OBJ) $(CC_ARG) $(LIB_ARG)
	$(VER)-objdump -S -d main > obj.txt

	$(VER)-readelf main -x 1 > text.txt
	$(VER)-readelf main -x 3 > data.txt
	python3 rom.py text.txt data.txt > /media/sf_share/memrom.txt


$(OBJ): $(SRC)
	$(CC) $(CCFLAGS) -o $@ $(patsubst %.o, src/%.c, $@)


clean:
	rm *.txt *.o main