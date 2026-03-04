SECTION "Test Data Bank B", ROMX, BANK[$10]
TestData_BankB::
    db $AA

SECTION "Test Data Bank C", ROMX, BANK[$11]
TestData_BankC::
    db $55

SECTION "Test Target Bank A", ROMX, BANK[$12]
TestTarget_BankA::
    ; Verify nested far call back to a C function or another ASM function
    ; For simplicity, we'll just set a flag to prove we got here safely
    ld a, 1
    ld [gTestResult_NestedCall], a
    ret
