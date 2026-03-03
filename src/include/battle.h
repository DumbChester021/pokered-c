#ifndef POKERED_BATTLE_H
#define POKERED_BATTLE_H

#include <stdint.h>

extern volatile uint8_t wPlayerMoveEffect;
extern volatile uint8_t wEnemyMoveEffect;
extern volatile uint8_t wDamage[2]; // Big-endian: wDamage (High), wDamage + 1 (Low)
extern volatile uint8_t wMoveMissed; // 0=Hit, 1=Miss

// Helper function references we will need from assembly
extern void JumpMoveEffect(void);

#endif // POKERED_BATTLE_H
