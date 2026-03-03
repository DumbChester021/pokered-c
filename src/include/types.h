/*
 * types.h — Pokémon type constants
 * Mirrors constants/type_constants.asm
 *
 * Physical types: 0x00–0x08
 * Special types:  0x14–0x1A
 * Gap at 0x09–0x13 matches the original ROM layout.
 */

#ifndef POKERED_TYPES_H
#define POKERED_TYPES_H

/* Physical types */
#define NORMAL       0x00
#define FIGHTING     0x01
#define FLYING       0x02
#define POISON       0x03
#define GROUND       0x04
#define ROCK         0x05
#define BIRD         0x06  /* unused/glitch type */
#define BUG          0x07
#define GHOST        0x08

/* Special types (start at 0x14) */
#define FIRE         0x14
#define WATER        0x15
#define GRASS        0x16
#define ELECTRIC     0x17
#define PSYCHIC_TYPE 0x18
#define ICE          0x19
#define DRAGON       0x1A

/* Type effectiveness multipliers (scaled by 10) */
#define SUPER_EFFECTIVE     20
#define MORE_EFFECTIVE      15
#define EFFECTIVE           10
#define NOT_VERY_EFFECTIVE   5
#define NO_EFFECT            0

#endif /* POKERED_TYPES_H */
