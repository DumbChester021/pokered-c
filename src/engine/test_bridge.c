#include <stdint.h>
#include "../include/far_call.h"
#include "../include/hram.h"

// External references to test symbols defined in ASM
// Define the _BANK_ macros for test labels so the compiler doesn't error.
// The transpiler will replace these with RGBDS BANK() operator.
#ifndef _BANK_TestTarget_BankA
#define _BANK_TestTarget_BankA 0
#endif
#ifndef _BANK_TestData_BankB
#define _BANK_TestData_BankB 0
#endif
#ifndef _BANK_TestData_BankC
#define _BANK_TestData_BankC 0
#endif

extern void TestTarget_BankA(void); 
#ifndef _BANK_Random_
#define _BANK_Random_ 0
#endif

extern void Random_(void); // Original ASM
extern const uint8_t TestData_BankB;
extern const uint8_t TestData_BankC;

// Global result trackers
volatile uint8_t gTestResult_BankRead;
volatile uint8_t gTestResult_NestedCall;
volatile uint8_t gTestResult_RandomParity;

/**
 * C-Implementation of Random_ for parity testing.
 * Matches the ASM logic in engine/math/random.asm exactly.
 */
void Random_C(void) {
    uint8_t div = rDIV;
    uint16_t add_temp = (uint16_t)hRandomAdd + div; // Assume carry 0 for start
    hRandomAdd = (uint8_t)add_temp;
    uint8_t cy = (add_temp > 0xFF) ? 1 : 0;
    
    // sbc b uses the carry from previous adc
    int16_t sub_temp = (int16_t)hRandomSub - div - cy;
    hRandomSub = (uint8_t)sub_temp;
}

/**
 * Logic-Matching Test: Compares C Random vs ASM Random
 */
void VerifyRandomParity(void) {
    // 1. Run ASM version
    hRandomAdd = 0x12;
    hRandomSub = 0x34;
    rDIV = 0; // Reset DIV for determinism
    Random_();
    uint8_t resAdd_ASM = hRandomAdd;
    uint8_t resSub_ASM = hRandomSub;

    // 2. Run C version
    hRandomAdd = 0x12;
    hRandomSub = 0x34;
    rDIV = 0; // Reset DIV again
    Random_C();
    uint8_t resAdd_C = hRandomAdd;
    uint8_t resSub_C = hRandomSub;

    if (resAdd_ASM == resAdd_C && resSub_ASM == resSub_C) {
        gTestResult_RandomParity = 1; // Success
    } else {
        gTestResult_RandomParity = 0xFE; // Failure
    }
}

/**
 * Robustness Test Suite
 */
void RunBridgeTests(void) {
    // 1. Test BankReadByte from different Banks
    uint8_t valB = BankReadByte(BANK(TestData_BankB), &TestData_BankB);
    uint8_t valC = BankReadByte(BANK(TestData_BankC), &TestData_BankC);
    
    if (valB == 0xAA && valC == 0x55) {
        gTestResult_BankRead = 1; // Success
    } else {
        gTestResult_BankRead = 0xFE; // Failure
    }

    // 2. Test FarCall with nesting
    // This calls Bank A, which we'll have call Bank B in ASM to test stack depth
    FarCall(BANK(TestTarget_BankA), TestTarget_BankA);

    // 3. Logic-Matching Test
    VerifyRandomParity();
}
