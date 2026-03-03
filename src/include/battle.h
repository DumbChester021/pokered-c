#ifndef POKERED_BATTLE_H
#define POKERED_BATTLE_H

#include <stdint.h>

extern volatile uint8_t wPlayerMoveEffect;
extern volatile uint8_t wEnemyMoveEffect;
extern volatile uint8_t wDamage[2]; // Big-endian: wDamage (High), wDamage + 1 (Low)
extern volatile uint8_t wMoveMissed; // 0=Hit, 1=Miss

extern volatile uint8_t wPlayerMoveType;
extern volatile uint8_t wEnemyMoveType;
extern volatile uint8_t wMoveType;
extern volatile uint8_t wTypeEffectiveness;

// wDamageMultipliers:
// bits 0-6: Effectiveness ($0=immune, $5=NVE, $a=neutral, $14=SE)
// bit 7: STAB
extern volatile uint8_t wDamageMultipliers;

// Type variables
extern volatile uint8_t wBattleMonType1;
extern volatile uint8_t wBattleMonType2;
extern volatile uint8_t wEnemyMonType1;
extern volatile uint8_t wEnemyMonType2;

extern const uint8_t TypeEffects[];

// Helper function references we will need from assembly
extern void JumpMoveEffect(void);

#endif // POKERED_BATTLE_H
