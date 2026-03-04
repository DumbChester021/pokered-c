#ifndef POKERED_FAR_CALL_H
#define POKERED_FAR_CALL_H

#include <stdint.h>

/**
 * Bank-Safe Bridge for C logic
 * 
 * Use these utilities to access data or call functions in different ROM banks
 * to avoid memory corruption and crashes.
 */

/* Returns the bank of a label (Transpiler will swap this for RGBDS BANK() operator) */
#define BANK(label) _BANK_##label

/* 
 * BankReadByte: Reads a single byte from a target bank safely.
 * @param bank: The ROM bank the data is in.
 * @param addr: Pointer to the data.
 */
uint8_t BankReadByte(uint8_t bank, const uint8_t *addr);

/* 
 * FarCall: Invokes a function in a different bank safely.
 * @param bank: The ROM bank the function is in.
 * @param func: Pointer to the function.
 */
void FarCall(uint8_t bank, void (*func)(void));

#endif // POKERED_FAR_CALL_H
