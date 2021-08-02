



ENTRY(_start)


SECTIONS
{
    . = 0x00000;
    .text : { *(.text) *(.text.*)}

    . = 0x20000;
    .rodata : { *(.rodata .rodata.*) *(.srodata .srodata.*) }
    
    . = 0x30000;
    .data : { *(.data) *(.sdata)  }
    .bss  : { __bss_start = ALIGN(0x4);
              *(.bss)  *(.sbss)

              . = ALIGN(0x4);
              _end = .;
            }
    
}

