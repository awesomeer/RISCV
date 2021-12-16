
#include "../inc/dfpu.h"


double dfpu_mul(double a, double b){

    DFPU->A = a;
    DFPU->B = b;
    DFPU->CTRL = (0b00 << DFPU_OP_POS) | DFPU_START_MSK;
    while(DFPU->CTRL & DFPU_BUSY_MSK);

    return DFPU->RESULT;
}

double dfpu_div(double a, double b){

    DFPU->A = a;
    DFPU->B = b;
    DFPU->CTRL = (0b01 << DFPU_OP_POS) | DFPU_START_MSK;
    while(DFPU->CTRL & DFPU_BUSY_MSK);

    return DFPU->RESULT;
}

double dfpu_add(double a, double b){

    DFPU->A = a;
    DFPU->B = b;
    DFPU->CTRL = (0b10 << DFPU_OP_POS) | DFPU_START_MSK;
    while(DFPU->CTRL & DFPU_BUSY_MSK);

    return DFPU->RESULT;
}

double dfpu_sub(double a, double b){

    uint64_t * uintb = (uint64_t *) &b;
    *uintb ^= (1ULL << 63);

    DFPU->A = a;
    DFPU->B = b;
    DFPU->CTRL = (0b10 << DFPU_OP_POS) | DFPU_START_MSK;
    while(DFPU->CTRL & DFPU_BUSY_MSK);

    return DFPU->RESULT;
}

uint32_t dfpu_cmp(double a, double b){

    DFPU->A = a;
    DFPU->B = b;

    DFPU->CTRL = ((0b11) << DFPU_OP_POS) | 1;
    while(DFPU->CTRL & 2);
    return * ((uint32_t *) &(DFPU->RESULT));
}