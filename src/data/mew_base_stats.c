/*
 * mew_base_stats.c — Mew base stats
 */

#include "../include/pokemon.h"
#include "../include/types.h"
#include "../include/moves.h"

extern const void MewPicFront;
extern const void MewPicBack;

const BaseStats mew_base_stats =     { DEX_MEW, 100, 100, 100, 100, 100, PSYCHIC_TYPE, PSYCHIC_TYPE, 45, 64, 0x55, &MewPicFront, &MewPicBack, POUND, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F }, 0xFF };
