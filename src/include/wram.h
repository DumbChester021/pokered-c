#ifndef POKERED_WRAM_H
#define POKERED_WRAM_H

#include <stdint.h>

// BIT_GAME_TIMER_COUNTING (0)
// BIT_UNKNOWN_5_1 (1)
// BIT_UNKNOWN_5_2 (2)
// BIT_DISABLE_JOYPAD (5)
#define BIT_GAME_TIMER_COUNTING 0
#define BIT_UNKNOWN_5_1 1
#define BIT_UNKNOWN_5_2 2
#define BIT_DISABLE_JOYPAD 5

extern volatile uint8_t wStatusFlags5;
extern volatile uint8_t wStatusFlags6;

extern volatile uint8_t wIgnoreInputCounter;
extern volatile uint8_t wPlayTimeFrames;
extern volatile uint8_t wPlayTimeSeconds;
extern volatile uint8_t wPlayTimeMinutes;
extern volatile uint8_t wPlayTimeHours;
extern volatile uint8_t wPlayTimeMaxed;

#endif // POKERED_WRAM_H
