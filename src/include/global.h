#ifndef GLOBAL_H
#define GLOBAL_H

/**
 * pokered-c Global Expansion Settings
 * 
 * Modeled after pokeemerald/include/global.h
 * Use this file to toggle major feature expansions on or off.
 */

// Toggle modern physical/special/status split for moves.
// Enable to use the categorized split instead of type-based split.
#define EXPANSION_PHYS_SPEC_SPLIT 0

// Example flag for future Fairy-type implementation
#define EXPANSION_FAIRY_TYPE 0

// Standard includes that every C file needs
#include "types.h"
#include "moves.h"
#include "items.h"
#include "pokemon.h"

#endif // GLOBAL_H
