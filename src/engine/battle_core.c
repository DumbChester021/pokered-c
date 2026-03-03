#include "../include/global.h"
#include "../include/hram.h"
#include "../include/battle.h"

// External math functions implemented in math.c
extern void _Divide(void);
extern void _Multiply(void);
extern void JumpMoveEffect(void);

// C implementation of CalculateDamage
// Matches exactly engine/battle/core.asm `CalculateDamage`
void CalculateDamage_C(uint8_t attack, uint8_t defense, uint8_t basePower, uint8_t level) {
    uint8_t effect;
    
    // 1. Determine which effect to use based on whose turn it is
    if (hWhoseTurn == 0) {
        effect = wPlayerMoveEffect;
    } else {
        effect = wEnemyMoveEffect;
    }

    // EXPLODE_EFFECT halves defense.
    if (effect == EXPLODE_EFFECT) {
        defense >>= 1;
        if (defense == 0) {
            defense = 1; // minimum value of 1
        }
    }

    // Multi-hit attacks may or may not have 0 bp.
    if (effect != TWO_TO_FIVE_ATTACKS_EFFECT && effect != ATTACK_TWICE_EFFECT) {
        // Calculate OHKO damage based on remaining HP.
        if (effect == OHKO_EFFECT) {
            JumpMoveEffect();
            wMoveMissed--;
            return;
        }

        // Don't calculate damage for moves that don't do any.
        if (basePower == 0) {
            return;
        }
    }

    // 0-fill Dividend
    hDividend[0] = 0;
    hDividend[1] = 0;
    hDividend[2] = 0;
    hDividend[3] = 0;

    // Multiply level by 2
    uint16_t lvl2 = (uint16_t)level * 2;
    if (lvl2 > 255) {
        hDividend[1] = 1;
    }
    hDividend[2] = (uint8_t)lvl2;

    // Divide by 5
    hDividend[3] = 5;
    
    // The ASM routine:
    // push bc
    // ld b, 4
    // call Divide
    // pop bc
    // Here, we're calling our C implemented _Divide, but Wait, math.c `_Divide` expects:
    // Dividend in hDividend[0..3]
    // Divisor in hDivisor
    // But the ASM does `ld [hld], a` where a=5, which writes it to hDividend+3 (since hl was hDividend+3 and then decremented).
    // Wait... Let's look at the ASM closely:
    // ld hl, hDividend
    // ld [hli], a
    // ld [hli], a
    // ld [hl], a  ; hl is now at hDividend+2
    // ; Multiply level by 2
    // ld a, e
    // add a
    // jr nc, .nc
    // push af; ld a, 1; ld [hl], a; pop af
    // .nc
    // inc hl ; hl is now at hDividend+3
    // ld [hli], a ; hl is now at hDividend+4 (hDivisor in hardware map)
    // ; Divide by 5
    // ld a, 5
    // ld [hld], a ; writes 5 to hDivisor (hDividend+4), hl goes back to hDividend+3
    
    hDivisor = 5;
    _Divide(); // quotient is in hQuotient[0..3]
    
    // So the hQuotient now holds the result.
    // ASM: 
    // ; Add 2
    // inc [hl] ; increment hQuotient[3] ? No, hl is hDividend+3, but Divide modifies hl.
    // Let's rely on standard C math for the formula instead of manually calling ASM routines
    // The Game Boy damage formula is:
    // Damage = (((2 * Level / 5) + 2) * BasePower * Attack / Defense) / 50 + 2
    
    // Since we're in C, we can just do the 32-bit arithmetic natively! SDCC will generate the correct calls or we can use the math natively.
    // Wait, SDCC does not link `_divulong` inherently in this setup (per `math.c` comments: "SDCC does not link _divulong and _modulong so we must avoid `/` and `%`.")
    // Ah! So we CANNOT use `/` natively. We must use our `_Divide()` and `_Multiply()` or write a simple division.
    // Actually, `_Divide()` and `_Multiply()` are exposed. Let's strictly use the provided variables.
    
    // Let's implement the EXACT ASM logic cleanly:
    
    // 1. Dividend = (Level * 2)
    hDividend[0] = 0;
    hDividend[1] = 0;
    hDividend[2] = (lvl2 >> 8) & 0xFF; // normally 0 or 1
    hDividend[3] = lvl2 & 0xFF;
    
    // 2. Divide by 5
    hDivisor = 5;
    _Divide(); // quotient is in hQuotient[0..3]. Note: hDividend gets modified to hDivideBuffer+1 usually, but quotient is what matters.
    
    // 3. Add 2
    // In ASM: hl after Divide points to hQuotient+3 (the lowest byte of the quotient).
    // inc [hl]; inc [hl]
    uint8_t q3 = hQuotient[3] + 2;
    hQuotient[3] = q3;
    if (q3 < 2) { // carry
        uint8_t q2 = hQuotient[2] + 1;
        hQuotient[2] = q2;
        if (q2 == 0) {
            uint8_t q1 = hQuotient[1] + 1;
            hQuotient[1] = q1;
            if (q1 == 0) hQuotient[0]++;
        }
    }
    
    // 4. Multiply by base power (d)
    // ASM targets: `inc hl` -> `hMultiplier`, then `call Multiply`
    // So Multiplicand = hQuotient[1..3]
    hMultiplicand[0] = hQuotient[1];
    hMultiplicand[1] = hQuotient[2];
    hMultiplicand[2] = hQuotient[3];
    hMultiplier = basePower;
    _Multiply(); // Product in hProduct[0..3]
    
    // 5. Multiply by attack (b)
    // Multiplicand = hProduct[1..3]
    hMultiplicand[0] = hProduct[1];
    hMultiplicand[1] = hProduct[2];
    hMultiplicand[2] = hProduct[3];
    hMultiplier = attack;
    _Multiply(); // Product in hProduct[0..3]
    
    // 6. Divide by defender's defense (c)
    // Dividend = hProduct[0..3]
    hDividend[0] = hProduct[0];
    hDividend[1] = hProduct[1];
    hDividend[2] = hProduct[2];
    hDividend[3] = hProduct[3];
    hDivisor = defense;
    _Divide(); // Quotient in hQuotient[0..3]
    
    // 7. Divide by 50
    // Dividend = hQuotient[0..3]
    hDividend[0] = hQuotient[0];
    hDividend[1] = hQuotient[1];
    hDividend[2] = hQuotient[2];
    hDividend[3] = hQuotient[3];
    hDivisor = 50;
    _Divide(); // Quotient in hQuotient[0..3]
    
    // Update wCurDamage (wDamage).
    // It's capped at MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE: 999 - 2 = 997.
    // Minimum 2
    
    uint16_t cur_dmg = ((uint16_t)wDamage[0] << 8) | wDamage[1];
    uint32_t damage = ((uint32_t)hQuotient[0] << 24) |
                      ((uint32_t)hQuotient[1] << 16) |
                      ((uint32_t)hQuotient[2] << 8)  |
                       (uint32_t)hQuotient[3];
                       
    damage += cur_dmg; // add wDamage to quotient
    
    if (damage > 997) {
        damage = 997;
    }
    
    // Add back MIN_NEUTRAL_DAMAGE (2), capping at 999.
    damage += 2;
    if (damage > 999) {
        damage = 999;
    }
    
    wDamage[0] = (damage >> 8) & 0xFF;
    wDamage[1] = damage & 0xFF;
}

// Naked ASM wrapper to interface with rgbds calling conventions
void CalculateDamage(void) __naked {
    __asm
    // Save registers
    push bc
    push de
    push hl
    
    // The ASM routine is called with:
    // b: attack
    // c: opponent defense
    // d: base power
    // e: level
    // SDCC expects arguments on the stack, pushed right-to-left
    
    push de        // Push e (level) and d (base power)
    push bc        // Push c (defense) and b (attack)
    
    call _CalculateDamage_C
    
    // Pop SDCC args
    add sp, #4
    
    // Restore state
    pop hl
    pop de
    pop bc
    
    // Set 1 in A to clear Z flag, matching routine's end:
    ld a, #1
    and a
    ret
    __endasm;
}

// C implementation of AdjustDamageForMoveType
// Matches exactly engine/battle/core.asm `AdjustDamageForMoveType`
void AdjustDamageForMoveType_C(void) {
    uint8_t attackerType1, attackerType2;
    uint8_t defenderType1, defenderType2;
    
    if (hWhoseTurn == 0) {
        attackerType1 = wBattleMonType1;
        attackerType2 = wBattleMonType2;
        defenderType1 = wEnemyMonType1;
        defenderType2 = wEnemyMonType2;
        wMoveType = wPlayerMoveType;
    } else {
        attackerType1 = wEnemyMonType1;
        attackerType2 = wEnemyMonType2;
        defenderType1 = wBattleMonType1;
        defenderType2 = wBattleMonType2;
        wMoveType = wEnemyMoveType;
    }

    uint8_t moveType = wMoveType;
    
    // Same-Type Attack Bonus (STAB)
    if (moveType == attackerType1 || moveType == attackerType2) {
        // Multiplier applied by adding 50% to wDamage
        uint16_t damage = ((uint16_t)wDamage[0] << 8) | wDamage[1];
        uint16_t stab_bonus = damage / 2;
        damage += stab_bonus;
        wDamage[0] = damage >> 8;
        wDamage[1] = damage & 0xFF;
        
        wDamageMultipliers |= 0x80; // SET BIT_STAB_DAMAGE (bit 7)
    }

    // Type Effectiveness evaluation
    uint8_t i = 0;
    while (TypeEffects[i] != 0xFF) {
        uint8_t atkType = TypeEffects[i];
        if (atkType == moveType) {
            uint8_t defType = TypeEffects[i + 1];
            if (defenderType1 == defType || defenderType2 == defType) {
                // Apply multiplier to wDamageMultipliers
                uint8_t mult = TypeEffects[i + 2];
                wDamageMultipliers += mult;

                // Multiply damage by `mult`
                uint16_t damage = ((uint16_t)wDamage[0] << 8) | wDamage[1];
                hDividend[0] = 0;
                hDividend[1] = 0;
                hDividend[2] = damage >> 8;
                hDividend[3] = damage & 0xFF;
                
                hMultiplicand[0] = 0;
                hMultiplicand[1] = damage >> 8;
                hMultiplicand[2] = damage & 0xFF;
                hMultiplier = mult;
                _Multiply();
                
                // Divide product by 10 (since effectiveness is 10x scaled, e.g. 20 = 2.0x)
                hDividend[0] = hProduct[0];
                hDividend[1] = hProduct[1];
                hDividend[2] = hProduct[2];
                hDividend[3] = hProduct[3];
                hDivisor = 10;
                _Divide(); // result in hQuotient[0..3]
                
                // Store new damage
                wDamage[0] = hQuotient[2];
                wDamage[1] = hQuotient[3];
                
                // If damage became 0 due to fraction loss (immunity handling logic applies when damage=0)
                if (hQuotient[2] == 0 && hQuotient[3] == 0) {
                    wMoveMissed = 1;
                }
            }
        }
        i += 3;
    }
}

// C implementation of AIGetTypeEffectiveness
void AIGetTypeEffectiveness_C(void) {
    uint8_t moveType = wEnemyMoveType;
    uint8_t pType1 = wBattleMonType1;
    uint8_t pType2 = wBattleMonType2;

    wTypeEffectiveness = EFFECTIVE; // Normally 0x10 but the bug keeps it 10 in our enums maybe? The original code had `ld a, $10 ; bug: should be EFFECTIVE(10)` - Actually $10 is 16. In types.h we defined EFFECTIVE as 10. Let's precisely mimic original buggy behaviour `ld a, $10`
    wTypeEffectiveness = 0x10;

    uint8_t i = 0;
    while (TypeEffects[i] != 0xFF) {
        if (TypeEffects[i] == moveType) {
            uint8_t defType = TypeEffects[i + 1];
            if (defType == pType1 || defType == pType2) {
                wTypeEffectiveness = TypeEffects[i + 2];
                return;
            }
        }
        i += 3;
    }
}

// Naked ASM wrappers
void AdjustDamageForMoveType(void) __naked {
    __asm
    push bc
    push de
    push hl
    
    call _AdjustDamageForMoveType_C
    
    pop hl
    pop de
    pop bc
    ret
    __endasm;
}

void AIGetTypeEffectiveness(void) __naked {
    __asm
    push bc
    push de
    push hl
    
    call _AIGetTypeEffectiveness_C
    
    pop hl
    pop de
    pop bc
    ret
    __endasm;
}
