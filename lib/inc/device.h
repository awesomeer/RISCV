#pragma once

#ifndef _DEVICE_H_
#define _DEVICE_H_


#include <stdint.h>

#define SEGS    (*( (volatile uint32_t *) 0xFFFFFF00))
#define LEDS    (*( (volatile uint32_t *) 0xFFFFFF04))
#define SW      (*( (volatile uint32_t *) 0xFFFFFF08))

#define BPCC    (*( (volatile uint64_t *) 0xFFFFFF10))
#define BPC     (*( (volatile uint64_t *) 0xFFFFFF18))

#define IPC     (*( (volatile uint64_t *) 0xFFFFFF20))
#define TICK    (*( (volatile uint64_t *) 0xFFFFFF28))




/*****

    UART REGISTER

*****/


typedef struct
{
    uint32_t CTRL;
    uint32_t DATA;
} uart_t;

#define UART0   ((volatile  uart_t *) 0xFFFFFF30)
#define UART1   ((volatile  uart_t *) 0xFFFFFF38)
#define UART2   ((volatile  uart_t *) 0xFFFFFF40)
#define UART3   ((volatile  uart_t *) 0xFFFFFF48)

//Data can be sent : 1 - no space; 0 - data free
#define UART_WR_POS 1
#define UART_WR_MSK (1 << UART_WR_POS)


//Data is avail to be read : 1 - data; 0 - no data
#define UART_RD_POS 2
#define UART_RD_MSK (1 << UART_RD_POS)


/*****

    64-bit Hardware floating point

*****/

typedef struct
{
    double A;
    double B;
    double RESULT;
    uint32_t CTRL;
} dfpu_t;

#define DFPU_START_POS 0
#define DFPU_START_MSK (1 << DFPU_START_POS)

#define DFPU_BUSY_POS 1
#define DFPU_BUSY_MSK (1 << DFPU_BUSY_POS)

#define DFPU_OP_POS 2
#define DFPU_OP_MSK (0b11 << DFPU_OP_MSK)

#define DFPU_CMP_EQ_POS 0
#define DFPU_CMP_EQ_MSK (1 << DFPU_CMP_EQ_POS)
#define DFPU_CMP_LT_POS 1
#define DFPU_CMP_LT_MSK (1 << DFPU_CMP_LT_POS)
#define DFPU_CMP_GT_POS 2
#define DFPU_CMP_GT_MSK (1 << DFPU_CMP_GT_POS)
#define DFPU_CMP_NAN_POS 3
#define DFPU_CMP_NAN_MSK (1 << DFPU_CMP_NAN_POS)

#define DFPU    ((volatile dfpu_t *) 0xFFFFFF60)



/*****

    32-bit Hardware floating point (NOT IMPLEMENTED, JUST GONNA USE DFPU)

*****/
/*
typedef struct
{
    float A;
    float B;
    float RESULT;
    uint32_t CTRL;
} sfpu_t;

#define SFPU_START_POS 0
#define SFPU_START_MSK (1 << SFPU_START_POS)

#define SFPU_BUSY_POS 1
#define SFPU_BUSY_MSK (1 << SFPU_BUSY_POS)

#define SFPU_OP_POS 2
#define SFPU_OP_MSK (0b11 << SFPU_OP_MSK)

#define SFPU    ((volatile sfpu_t *) 0xFFFFFF80)

*/

#endif