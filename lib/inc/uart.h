#pragma once

#ifndef _UART_H_
#define _UART_H_



#include "device.h"




void uart_send_char(uint8_t num);
void uart_send_string(uint8_t * str, uint32_t len);
void uart_send_stringn(uint8_t * str);
void uart_send_uint32(uint32_t num);


typedef enum {
    UART_OKAY = 0,
    UART_TIMEOUT
} uartErr_t;

uartErr_t uart_recv_char(uint8_t * data, int32_t timeout);
uartErr_t uart_recv_buff(uint8_t * buff, uint32_t len, int32_t timeout);
uartErr_t uart_recv_str(uint8_t * str, int32_t timeout);

#endif