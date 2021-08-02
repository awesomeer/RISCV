




.global _start

_start:

    xor a0, a0, a0
    xor a1, a1, a1

    li a0, 1

loop:
    addi a0, a0, 1
    li a1, 2

    srli s0, a0, 1

for_loop:
    bltu s0, a1, out

    remu s1, a0, a1
    beqz s1, loop
    addi a1, a1, 1
    j for_loop



out:
    sw a0, 4(zero)
    j loop
