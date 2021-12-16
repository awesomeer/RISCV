
.extern startup
.global reset

.section .text.reset, "ax"

reset:

    xor x1, x1, x1
    la sp, STACK_BOTTOM
    xor x3, x3, x3
    xor x4, x4, x4
    xor x5, x5, x5
    xor x6, x6, x6
    xor x7, x7, x7
    xor x8, x8, x8
    xor x9, x9, x9
    xor x10, x10, x10
    xor x11, x11, x11
    xor x12, x12, x12
    xor x13, x13, x13
    xor x14, x14, x14
    xor x15, x15, x15
    xor x16, x16, x16
    xor x17, x17, x17
    xor x18, x18, x18
    xor x19, x19, x19
    xor x20, x20, x20
    xor x21, x21, x21
    xor x22, x22, x22
    xor x23, x23, x23
    xor x24, x24, x24
    xor x25, x25, x25
    xor x26, x26, x26
    xor x27, x27, x27
    xor x28, x28, x28
    xor x29, x29, x29
    xor x30, x30, x30
    xor x31, x31, x31

    j startup 

.equ STACK_BOTTOM, 0x8000FFF0
