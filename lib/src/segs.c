
#include "../inc/segs.h"


static uint8_t seg_encode(uint8_t num){

    switch (num){

    case 0:     return 0b01000000;
    case 1:     return 0b01111001;
    case 2:     return 0b00100100;
    case 3:     return 0b00110000;
    case 4:     return 0b00011001;
    case 5:     return 0b00010010;
    case 6:     return 0b00000010;
    case 7:     return 0b01111000;

    case 8:     return 0b00000000;
    case 9:     return 0b00011000;
    case 10:    return 0b00001000;
    case 11:    return 0b00000011;
    case 12:    return 0b01000110;
    case 13:    return 0b00100001;
    case 14:    return 0b00000110;
    case 15:    return 0b00001110;
    
    default:    return 0xFF;
    
    }


}


void segs_display(uint32_t num){

    uint32_t encode = 0;

    for(uint32_t i = 0; i < 4; i++){

        encode >>= 8;
        encode |= seg_encode(num % 10) << 24;
        encode |= 0x80000000;
        num /= 10;
    }

    SEGS = encode;
}