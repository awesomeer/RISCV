#include "../inc/uart.h"

void uart_send_char(uint8_t num){
    while(UART0->CTRL & 2);
    UART0->DATA = num;
}

void uart_send_string(uint8_t * str, uint32_t len){
    for(uint32_t i = 0; i < len; i++){
        uart_send_char(str[i]);
    }
}

void uart_send_stringn(uint8_t * str){

    while(*str){
        uart_send_char(*str++);
    }
}

void uart_send_uint32(uint32_t num){
    uint8_t buff[11];

    uint8_t * str = &buff[10];
    *str = 0;
    do{
        *(--str) = (num % 10) + 0x30;
        num /= 10;
    }while(num);
    
    uart_send_stringn(str);
}


uartErr_t uart_recv_char(uint8_t * data, int32_t timeout){

    uint64_t exittime = TICK + timeout;
    do{
        if(UART0->CTRL & UART_RD_MSK){
            *data = UART0->DATA;
            return UART_OKAY;
        }
    }while(timeout == -1 || (exittime > TICK));

    return UART_TIMEOUT;
}



uartErr_t uart_recv_buff(uint8_t * buff, uint32_t len, int32_t timeout){

    uint8_t c;
    for(uint32_t i = 0; i < len; i++){
        
        if(uart_recv_char(&c, timeout) == UART_TIMEOUT)
            return UART_TIMEOUT;
        
        buff[i] = c;
    }

    return UART_OKAY;
}


uartErr_t uart_recv_str(uint8_t * str, int32_t timeout){

    uint8_t c;
    while(uart_recv_char(&c, timeout) == UART_OKAY){
        if(c == 0xD){
            *str = 0;
            return UART_OKAY;
        }

        *str = c;
        str++;        
    }

    return UART_TIMEOUT;
}