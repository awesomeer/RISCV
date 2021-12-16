#include <stdint.h>

extern char _etext;

extern char _sdata;
extern char _edata;

extern char _sbss;
extern char _ebss;

extern void main();

void startup(){

    {
        uint32_t * etext = (uint32_t *) &_etext;
        uint32_t * sdata = (uint32_t *) &_sdata;
        uint32_t * edata = (uint32_t *) &_edata;

        while( sdata < edata){
            *sdata++ = *etext++;
        }

        uint32_t * sbss = (uint32_t *) &_sbss;
        uint32_t * ebss = (uint32_t *) &_ebss;
        while(sbss < ebss){
            *sbss++ = 0;
        }

    }

    main();
    while(1);
}