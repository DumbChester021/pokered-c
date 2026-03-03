#ifndef POKERED_HRAM_H
#define POKERED_HRAM_H

#include <stdint.h>

// Hardware Registers
extern volatile uint8_t rDIV;

// Math / Random RAM Variables (HRAM)
extern volatile uint8_t hRandomAdd;
extern volatile uint8_t hRandomSub;

// Multiply
extern volatile uint8_t hMultiplier;
extern volatile uint8_t hMultiplicand[3]; // Big endian
extern volatile uint8_t hProduct[4]; // Big endian
extern volatile uint8_t hMultiplyBuffer[4]; // Big endian

// Divide
extern volatile uint8_t hDivisor;
extern volatile uint8_t hDividend[4]; // Big endian
extern volatile uint8_t hQuotient[4]; // Big endian
extern volatile uint8_t hRemainder;
extern volatile uint8_t hDivideBuffer[5]; // Big endian

#endif // POKERED_HRAM_H
