
#define FCPU (50000000U)
//#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include "../inc/genann.h"
#include <stdlib.h>
#include "../inc/riscv.h"
//uint8_t buff[32];

uint8_t buff[256];


typedef struct
{
    char a;
    float b;
} b_t;

typedef struct
{
    float a;
    char b;
} s_t;


void main(void)
{
    printf("GENANN example 1.\n");
    printf("Train a small ANN to the XOR function using backpropagation.\n");

    /* This will make the neural network initialize differently each run. */
    /* If you don't get a good result, try again for a different result. */
    //srand(time(0));

    /* Input and expected out data for the XOR function. */
    const double input[4][2] = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
    const double output[4] = {0, 1, 1, 0};
    int i;

    /* New network with 2 inputs,riscv32-unknown-elf-gcc
     * 1 hidden layer of 2 neurons,
     * and 1 output. */
    genann *ann = genann_init(2, 1, 2, 1);

    /* Train on the four labeled data points many times. */
    uint64_t time = TICK;
    for (i = 0; i < 10000; ++i) {
        //printf("Loop index = %d\n", i);
        //uart_send_stringn("Loop index = "); uart_send_uint32(i); uart_send_char('\n');
        //segs_display(i);
        genann_train(ann, input[0], output + 0, 3);
        genann_train(ann, input[1], output + 1, 3);
        genann_train(ann, input[2], output + 2, 3);
        genann_train(ann, input[3], output + 3, 3);
    }

    double sec = ((double) (TICK - time)) / 50000000.0;
    printf("Time = %fs\n", sec);

    uint32_t pos = log10f(sec);
    while(sec < 1000)
        sec *= 10;
    segs_display(sec);
    SEGS &= ~(1 << (31 - pos*8));

    /* Run the network and see what it predicts. */
    printf("Output for [%f, %f] is %f.\n", input[0][0], input[0][1], *genann_run(ann, input[0]));
    printf("Output for [%f, %f] is %f.\n", input[1][0], input[1][1], *genann_run(ann, input[1]));
    printf("Output for [%f, %f] is %f.\n", input[2][0], input[2][1], *genann_run(ann, input[2]));
    printf("Output for [%f, %f] is %f.\n", input[3][0], input[3][1], *genann_run(ann, input[3]));

    genann_free(ann);
    return;
}



// uint32_t global = 231241;
// void main(void){

//     uint16_t count = 0;
//     printf("Global num: %d\n\r", global);
//     while(1){
        
//         uint64_t tick = TICK;

//         segs_display(count);
//         printf("Count = %d\n\r", count++);
//         count %= 10000;

//         LEDS ^= -1;

//         while( (TICK-tick) < FCPU);
//     }
// }riscv32-unknown-elf-gcc


// void main(void){

//     while(1){

//         uart_send_stringn("\033[2J");
//         for(char i = 0; i < 25; i++){
//             for(char j = 0x30; j < 127; j++){
//                 uart_send_char(j);
//             }
//             uart_send_stringn("\n\r");
//         }

//         //uint64_t tick = TICK;
//         //while( (TICK-tick) < FCPU );
//     }
// }



// void main(void){



//     uint32_t count = 0;
//     uart_send_stringn("\033[2J\033[48;2;0;0;0m"); //Set black background color


//     while(1){
//         uint32_t tick = TICK;
//         uart_send_stringn("\033[1;1H"); //Clear screen and set cursor top left

//         uint32_t sw = SW;
//         //uint32_t r = (sw >> 16);
//         uint32_t g = (sw >> 8) & 0xff;
//         uint32_t b = sw & 0xff;

        
//         uint32_t r = 127.0F * (cosf((2.0F*M_PI*count++) / 500.0F) + 1.0F);

//         printf("\033[38;2;%d;%d;%dm", r,g,b);
//         //for(uint8_t i = 0x30; i < 0x7f; i++)
//             //uart_send_char(i);
//         printf("\n\rIPC: %f\n\rBPA: %f\n\r", ((double)IPC) / ((double)TICK), ((double)(BPCC*100)) / ((double)BPC) );
//         printf("count: %d %d   ", count, r);

//         while( (TICK-tick) < (FCPU/100) );
//     }

// }

// void main(void){

//     int32_t x = 0;
//     while(1){

//         uint64_t tick = TICK;

//         if(SW & 1)
//             x = (x+1) % 80;
//         else
//             x = (x <= 0) ? 79 : x-1;

//         uint32_t y = (SW >> 8) & 0xff;
//         printf("\033[2J\033[%d;%dH@", y, x+1);


        
//         while( (TICK - tick) < (FCPU/100) );
//     }
// }

// void s(){
//     uart_send_stringn("\033[1;1H"); //Clear screen and set cursor top left
// }

// void main(void){

//     uint32_t prime = 1;
//     while(1){

//         con:
//         prime++;
//         for(uint32_t i = 2; i <= prime/2; i++){
//             if(prime % i == 0)
//                 goto con;
//         }
//         LEDS = prime;

//         uint32_t ipc = (IPC *10000) / (TICK);
//         uint32_t bpc = (BPCC*10000) / (BPC);

//         //s();//uart_send_stringn("\033[1;1H"); //Clear screen and set cursor top left
//         //printf("%d %f %f\n\r", prime, ipc, bpc);
//     }

// }