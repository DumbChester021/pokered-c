#include "../include/global.h"
#include "../include/hram.h"

void Random_(void) {
    uint8_t d = rDIV;
    hRandomAdd += d;
    hRandomSub -= d;
}

void _Multiply(void) {
    uint8_t b = 8;
    
    // Clear product and buffer
    hProduct[0] = 0;
    
    hMultiplyBuffer[0] = 0;
    hMultiplyBuffer[1] = 0;
    hMultiplyBuffer[2] = 0;
    hMultiplyBuffer[3] = 0;
    
    while (1) {
        uint8_t a = hMultiplier;
        hMultiplier = a >> 1; // carry flag holds the shifted out bit
        
        if (a & 1) { // jr nc, .smallMultiplier
            // Add multiplicand to multiply buffer
            uint16_t sum;
            
            sum = hMultiplyBuffer[3] + hMultiplicand[2];
            hMultiplyBuffer[3] = (uint8_t)sum;
            
            sum = hMultiplyBuffer[2] + hMultiplicand[1] + (sum >> 8);
            hMultiplyBuffer[2] = (uint8_t)sum;
            
            sum = hMultiplyBuffer[1] + hMultiplicand[0] + (sum >> 8);
            hMultiplyBuffer[1] = (uint8_t)sum;
            
            sum = hMultiplyBuffer[0] + hProduct[0] + (sum >> 8);
            hMultiplyBuffer[0] = (uint8_t)sum;
        }
        
        b--;
        if (b == 0) break;
        
        // Shift multiplicand and product left by 1 (24-bit + 8-bit big endian shift left)
        uint16_t shift;
        shift = hMultiplicand[2] << 1;
        hMultiplicand[2] = (uint8_t)shift;
        
        shift = (hMultiplicand[1] << 1) | (shift >> 8);
        hMultiplicand[1] = (uint8_t)shift;
        
        shift = (hMultiplicand[0] << 1) | (shift >> 8);
        hMultiplicand[0] = (uint8_t)shift;
        
        shift = (hProduct[0] << 1) | (shift >> 8);
        hProduct[0] = (uint8_t)shift;
    }
    
    hProduct[3] = hMultiplyBuffer[3];
    hProduct[2] = hMultiplyBuffer[2];
    hProduct[1] = hMultiplyBuffer[1];
    hProduct[0] = hMultiplyBuffer[0];
}

void _Divide(void) {
    // Standard division algorithm in 32-bit manually implemented.
    // SDCC does not link _divulong and _modulong so we must avoid `/` and `%`.
    uint32_t dividend = ((uint32_t)hDividend[0] << 24) | 
                        ((uint32_t)hDividend[1] << 16) | 
                        ((uint32_t)hDividend[2] << 8)  | 
                         (uint32_t)hDividend[3];
                         
    uint32_t divisor = hDivisor;
    
    uint32_t quotient = 0;
    uint32_t remainder = 0;
    
    if (divisor != 0) {
        for (int i = 0; i < 32; i++) {
            remainder <<= 1;
            if (dividend & 0x80000000) {
                remainder |= 1;
            }
            dividend <<= 1;
            
            if (remainder >= divisor) {
                remainder -= divisor;
                quotient = (quotient << 1) | 1;
            } else {
                quotient <<= 1;
            }
        }
    } else {
        // Divide by 0 trap default
        quotient = 0xFFFFFFFF;
        remainder = dividend & 0xFF; // Only 8 bit remainder usually
    }
    
    // Write back outputs
    hQuotient[0] = (quotient >> 24) & 0xFF;
    hQuotient[1] = (quotient >> 16) & 0xFF;
    hQuotient[2] = (quotient >> 8) & 0xFF;
    hQuotient[3] = quotient & 0xFF;
    
    hRemainder = remainder & 0xFF;
    
    // Given the exact logic, after a correct Divide: hDividend actually takes hDivideBuffer+1.
}
