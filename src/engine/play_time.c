#include "../include/global.h"
#include "../include/wram.h"

// Note on sdcc2rgbasm.py requirements:
// hJoyPressed/hJoyHeld are in HRAM but we don't have them in hram.h yet. Let's declare them here.
extern volatile uint8_t hJoyPressed;
extern volatile uint8_t hJoyHeld;

void CountDownIgnoreInputBitReset(void) {
    if (wIgnoreInputCounter != 0) {
        wIgnoreInputCounter--;
    } else {
        wIgnoreInputCounter = 0xFF; // Fallthrough logic from ASM
    }
    
    if (wIgnoreInputCounter != 0) {
        return;
    }
    
    // res BIT_UNKNOWN_5_1, a
    // res BIT_UNKNOWN_5_2, a
    wStatusFlags5 &= ~((1 << BIT_UNKNOWN_5_1) | (1 << BIT_UNKNOWN_5_2));
    
    // bit BIT_DISABLE_JOYPAD, a
    if (wStatusFlags5 & (1 << BIT_DISABLE_JOYPAD)) {
        // res BIT_DISABLE_JOYPAD, a
        wStatusFlags5 &= ~(1 << BIT_DISABLE_JOYPAD);
        
        // ret z logic: The ASM does bit test, resets it, then updates RAM.
        // It then does `ret z`, meaning if the bit WAS zero before, it returns.
        // Since we are inside `if (bit was set)`, we ONLY execute the remaining if it was set.
        hJoyPressed = 0;
        hJoyHeld = 0;
    }
}

void TrackPlayTime(void) {
    CountDownIgnoreInputBitReset();
    
    if (!(wStatusFlags6 & (1 << BIT_GAME_TIMER_COUNTING))) {
        return;
    }
    
    if (wPlayTimeMaxed != 0) {
        return;
    }
    
    wPlayTimeFrames++;
    if (wPlayTimeFrames < 60) {
        return;
    }
    
    wPlayTimeFrames = 0;
    wPlayTimeSeconds++;
    if (wPlayTimeSeconds < 60) {
        return;
    }
    
    wPlayTimeSeconds = 0;
    wPlayTimeMinutes++;
    if (wPlayTimeMinutes < 60) {
        return;
    }
    
    wPlayTimeMinutes = 0;
    wPlayTimeHours++;
    if (wPlayTimeHours < 0xFF) {
        return;
    }
    
    wPlayTimeHours = 0xFF;
    wPlayTimeMaxed = 0xFF;
}
