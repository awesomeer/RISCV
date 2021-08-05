SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, %.o, $(SRC))

VER = riscv32-unknown-elf

CC = $(VER)-gcc
LD = $(VER)-ld

CCFLAGS = -g -c -ffreestanding -nostartfiles -O1
LIB_ARG = -Wl,-T lnks.ld -lm -lnosys


libriscv.a: $(OBJ)
	$(VER)-ar rcs libriscv.a $(OBJ)
	cp libriscv.a /opt/riscvim/riscv32-unknown-elf/lib/

$(OBJ): $(SRC)
	$(CC) $(CCFLAGS) -o $@ $(patsubst %.o, src/%.c, $@)


clean:
	rm *.o libriscv.a