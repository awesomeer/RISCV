
#pragma once

#ifndef _DFPU_H_
#define _DFPU_H_

#include "device.h"

double dfpu_mul(double a, double b);
double dfpu_div(double a, double b);
double dfpu_add(double a, double b);
double dfpu_sub(double a, double b);
uint32_t dfpu_cmp(double a, double b);


#endif
