

//#include <stdio.h>
#include <stdint.h>

#include <stdlib.h>
#include "../inc/riscv.h"
#include "../inc/uart.h"
#include "../inc/printf.h"
//uint8_t buff[32];

void main(void){

    uint64_t c = sizeof(uint64_t);
    while(1){
        LEDS = c++;
        printf_("%llu %llu %llu\n\r", c, (IPC*10000)/TICK, (BPCC*10000)/(BPC+1));
    }
}


// int main(void)
// {
//   int i, j, n;
  
//   for (i = 0; i < 11; i++) {
//     for (j = 0; j < 10; j++) {
//       n = 10*i + j;
//       if (n > 108) break;
//       printf("\033[%dm %3d\033[m", n, n);
//     }
//     printf("\n");
//   }
//   return 0;
// }


// void main(void){

//     // uart_send_stringn("Hello World\n");
//     // uart_send_uint32(2342);
//     // while(1);

//     uint32_t prime = 1;
//     while(1){

//         con:
//         prime++;
//         for(uint32_t i = 2; i <= prime/2; i++){
//             if(prime % i == 0)
//                 goto con;
//         }
//         LEDS = prime;        

//         uint64_t ipc = (IPC  * 10000) / TICK;
//         uint64_t bpc = (BPCC * 10000) / BPC;

        
//         //printf_("%d %d %d\n", prime, (uint32_t) ipc, (uint32_t) bpc);

//         // int s = sprintf_(buff, "%d %d %d\n", prime, (uint32_t) ipc, (uint32_t) bpc);
//         // uart_send_string(buff, s);

//         uart_send_uint32(prime); uart_send_char(' ');
//         uart_send_uint32( (uint32_t) ipc); uart_send_char(' ');
//         uart_send_uint32( (uint32_t) bpc); uart_send_char('\n'); uart_send_char('\r');
        
//     }

// }