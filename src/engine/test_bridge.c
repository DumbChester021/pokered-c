#include <stdint.h>
#include "../include/far_call.h"

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
extern const uint8_t TestData_BankB;
extern const uint8_t TestData_BankC;

// Global result trackers
volatile uint8_t gTestResult_BankRead;
volatile uint8_t gTestResult_NestedCall;

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
}
