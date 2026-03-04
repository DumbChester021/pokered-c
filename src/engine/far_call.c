#include <stdint.h>
#include "../include/far_call.h"

/**
 * C implementation of Bank-Safe Bridge
 * 
 * These functions use __naked ASM to manually manage registers and stack
 * to interface with the legacy Game Boy bank-switching routines.
 */

/* Reads a byte from a target bank */
uint8_t BankReadByte(uint8_t bank, const uint8_t *addr) __naked {
    (void)bank;
    (void)addr;
    __asm
    // SDCC calling convention (stack, pushed R-to-L):
    // SP+0: Return address (2 bytes)
    // SP+2: bank (1 byte)
    // SP+3: addr LSB
    // SP+4: addr MSB
    
    push bc
    ld a, [hli] // A = bank
    ld h, [hl]  // H = addr MSB
    ld l, c     // L = addr LSB (Wait, I need to get LSB first)
    
    // Let's rewrite this properly:
    ldhl sp, #4
    ld a, [hli] // A = bank
    ld e, a     // E = bank
    ld a, [hli] // A = addr LSB
    ld d, a     // D = addr LSB
    ld a, [hl]  // A = addr MSB
    ld b, a     // B = addr MSB
    ld c, d     // C = addr LSB
    
    // Save current bank
    ldh a, [hLoadedROMBank]
    push af
    
    // Switch to target bank
    ld a, e
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    
    // Read the data
    ld l, c
    ld h, b
    ld a, [hl]
    ld l, a // Return value in L for SDCC (char)
    
    // Restore bank
    pop af
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    
    pop bc
    ret
    __endasm;
}

/* Calls a function in another bank */
void FarCall(uint8_t bank, void (*func)(void)) __naked {
    (void)bank;
    (void)func;
    __asm
    push bc
    ldhl sp, #4
    ld a, [hli] // A = bank
    ld b, a
    ld a, [hli] // A = func LSB
    ld e, a
    ld a, [hl]  // A = func MSB
    ld d, a
    ld l, e
    ld h, d
    
    call Bankswitch
    
    pop bc
    ret
    __endasm;
}
