



ENTRY(reset)

MEMORY
{
  ROM (RX)  : org = 0x00000000, l = 64K
  RAM (WX)  : org = 0x80000000, l = 64K
}

SECTIONS
{

    .text : ALIGN(4) 
    { 
      *(.text.reset)
      *(.text.startup)
      *(.text) 
      *(.text.*)
      *(.rodata .rodata.*) 
      *(.srodata .srodata.*)

      . = ALIGN(4);
      _etext = .;
    } > ROM
    
    
    .data : ALIGN(4)
    {
      . = ALIGN(4);
      _sdata = .;

      *(.data) 
      *(.sdata)

      . = ALIGN(4);
      _edata = .;
    } > RAM AT > ROM

    .bss (NOLOAD) : ALIGN(4)
    {
      . = ALIGN(4);
      _sbss = .;

      *(.bss)
      *(.sbss)

      . = ALIGN(4);
      _ebss = .;
    } > RAM
    
}

