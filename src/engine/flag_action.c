#include "../include/global.h"

// The ASM routine is heavily called via a standard `call FlagAction` sequence 
// with arguments in specific CPU registers. We use a proxy here to push those args 
// into standard SDCC stack convention before jumping to the C logic.
// b: action (0: reset, 1: set, 2: read)
// c: bit
// hl: bitfield pointer
uint8_t _C_FlagAction(uint8_t bit, uint8_t action, uint8_t* ptr) {
    uint8_t mask = 1 << (bit & 7);
    ptr += (bit >> 3);

    if (action == 0) { // FLAG_RESET
        *ptr &= ~mask;
    } else if (action == 1) { // FLAG_SET
        *ptr |= mask;
    }
    
    // FLAG_TEST (2) or any other fallthrough just reads.
    return (*ptr & mask) ? 1 : 0;
}

void FlagAction_Proxy(void) __naked {
    __asm
FlagActionPredef::
    call GetPredefRegisters
FlagAction::
    push de
    
    ; Setup arguments for _C_FlagAction
    ; SP + 0: de
    ; SP + 2: return address
    
    push hl   ; arg 3: ptr
    push bc   ; arg 1 (c) & arg 2 (b)
    
    call __C_FlagAction
    
    ; restore stack
    pop bc
    pop hl
    
    ; return value is in a. legacy expects it in c too.
    ld c, a
    pop de
    ret
    __endasm;
}
