SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, %.o, $(SRC))

VER = riscv32-unknown-elf

CC = $(VER)-gcc
LD = $(VER)-ld

CCFLAGS = -g -c -ffreestanding -nostartfiles -Os -ffunction-sections
LIB_ARG = -Wl,-T lnks.ld -lm -lnosys


libriscv.a: $(OBJ)
	$(VER)-gcc -g -c -ffreestanding -nostartfiles -Os -ffunction-sections -o entry.o src/entry.s
	$(VER)-ar rcs libriscv.a $(OBJ) entry.o
	cp libriscv.a /opt/riscvim/riscv32-unknown-elf/lib/

$(OBJ): $(SRC)
	$(CC) $(CCFLAGS) -o $@ $(patsubst %.o, src/%.c, $@)


clean:
	@echo $(OBJ)
	rm *.o libriscv.a



test:
	@echo $(SRC)
	@echo $(OBJ)