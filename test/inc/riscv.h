#pragma once

#ifndef _RISCV_H_
#define _RISCV_H_


#include <stdint.h>

#define SEGS    (*( (volatile uint32_t *) 0x00000000))
#define LEDS    (*( (volatile uint32_t *) 0x00000004))
#define SW      (*( (volatile uint32_t *) 0x00000008))

#define BPCC    (*( (volatile uint64_t *) 0x00000010))
#define BPC     (*( (volatile uint64_t *) 0x00000018))

#define IPC     (*( (volatile uint64_t *) 0x00000020))
#define TICK    (*( (volatile uint64_t *) 0x00000028))

typedef struct
{
    uint32_t CTRL;
    uint32_t DATA;
} uart_t;

#define UART0   ((volatile  uart_t *) 0x00000030)


#endif