/*
 * type_matchups.c — Type effectiveness chart
 * Source of truth for data/types/type_matchups.asm
 *
 * Run: python3 tools/c2asm.py src/data/type_matchups.c > data/types/type_matchups.asm
 *
 * Each entry is {attacker_type, defender_type, effectiveness}.
 * Table is terminated by 0xFF.
 */

#include "../include/types.h"






typedef struct {
    unsigned char attacker;
    unsigned char defender;
    unsigned char effectiveness;
} TypeMatchup;

const TypeMatchup type_matchups[] = {
    /* attacker,     defender,     effectiveness */
    { WATER,        FIRE,         SUPER_EFFECTIVE },
    { FIRE,         GRASS,        SUPER_EFFECTIVE },
    { FIRE,         ICE,          SUPER_EFFECTIVE },
    { GRASS,        WATER,        SUPER_EFFECTIVE },
    { ELECTRIC,     WATER,        SUPER_EFFECTIVE },
    { WATER,        ROCK,         SUPER_EFFECTIVE },
    { GROUND,       FLYING,       NO_EFFECT },
    { WATER,        WATER,        NOT_VERY_EFFECTIVE },
    { FIRE,         FIRE,         NOT_VERY_EFFECTIVE },
    { ELECTRIC,     ELECTRIC,     NOT_VERY_EFFECTIVE },
    { ICE,          ICE,          NOT_VERY_EFFECTIVE },
    { GRASS,        GRASS,        NOT_VERY_EFFECTIVE },
    { PSYCHIC_TYPE, PSYCHIC_TYPE, NOT_VERY_EFFECTIVE },
    { FIRE,         WATER,        NOT_VERY_EFFECTIVE },
    { GRASS,        FIRE,         NOT_VERY_EFFECTIVE },
    { WATER,        GRASS,        NOT_VERY_EFFECTIVE },
    { ELECTRIC,     GRASS,        NOT_VERY_EFFECTIVE },
    { NORMAL,       ROCK,         NOT_VERY_EFFECTIVE },
    { NORMAL,       GHOST,        NO_EFFECT },
    { GHOST,        GHOST,        SUPER_EFFECTIVE },
    { FIRE,         BUG,          SUPER_EFFECTIVE },
    { FIRE,         ROCK,         NOT_VERY_EFFECTIVE },
    { WATER,        GROUND,       SUPER_EFFECTIVE },
    { ELECTRIC,     GROUND,       NO_EFFECT },
    { ELECTRIC,     FLYING,       SUPER_EFFECTIVE },
    { GRASS,        GROUND,       SUPER_EFFECTIVE },
    { GRASS,        BUG,          NOT_VERY_EFFECTIVE },
    { GRASS,        POISON,       NOT_VERY_EFFECTIVE },
    { GRASS,        ROCK,         SUPER_EFFECTIVE },
    { GRASS,        FLYING,       NOT_VERY_EFFECTIVE },
    { ICE,          WATER,        NOT_VERY_EFFECTIVE },
    { ICE,          GRASS,        SUPER_EFFECTIVE },
    { ICE,          GROUND,       SUPER_EFFECTIVE },
    { ICE,          FLYING,       SUPER_EFFECTIVE },
    { FIGHTING,     NORMAL,       SUPER_EFFECTIVE },
    { FIGHTING,     POISON,       NOT_VERY_EFFECTIVE },
    { FIGHTING,     FLYING,       NOT_VERY_EFFECTIVE },
    { FIGHTING,     PSYCHIC_TYPE, NOT_VERY_EFFECTIVE },
    { FIGHTING,     BUG,          NOT_VERY_EFFECTIVE },
    { FIGHTING,     ROCK,         SUPER_EFFECTIVE },
    { FIGHTING,     ICE,          SUPER_EFFECTIVE },
    { FIGHTING,     GHOST,        NO_EFFECT },
    { POISON,       GRASS,        SUPER_EFFECTIVE },
    { POISON,       POISON,       NOT_VERY_EFFECTIVE },
    { POISON,       GROUND,       NOT_VERY_EFFECTIVE },
    { POISON,       BUG,          SUPER_EFFECTIVE },
    { POISON,       ROCK,         NOT_VERY_EFFECTIVE },
    { POISON,       GHOST,        NOT_VERY_EFFECTIVE },
    { GROUND,       FIRE,         SUPER_EFFECTIVE },
    { GROUND,       ELECTRIC,     SUPER_EFFECTIVE },
    { GROUND,       GRASS,        NOT_VERY_EFFECTIVE },
    { GROUND,       BUG,          NOT_VERY_EFFECTIVE },
    { GROUND,       ROCK,         SUPER_EFFECTIVE },
    { GROUND,       POISON,       SUPER_EFFECTIVE },
    { FLYING,       ELECTRIC,     NOT_VERY_EFFECTIVE },
    { FLYING,       FIGHTING,     SUPER_EFFECTIVE },
    { FLYING,       BUG,          SUPER_EFFECTIVE },
    { FLYING,       GRASS,        SUPER_EFFECTIVE },
    { FLYING,       ROCK,         NOT_VERY_EFFECTIVE },
    { PSYCHIC_TYPE, FIGHTING,     SUPER_EFFECTIVE },
    { PSYCHIC_TYPE, POISON,       SUPER_EFFECTIVE },
    { BUG,          FIRE,         NOT_VERY_EFFECTIVE },
    { BUG,          GRASS,        SUPER_EFFECTIVE },
    { BUG,          FIGHTING,     NOT_VERY_EFFECTIVE },
    { BUG,          FLYING,       NOT_VERY_EFFECTIVE },
    { BUG,          PSYCHIC_TYPE, SUPER_EFFECTIVE },
    { BUG,          GHOST,        NOT_VERY_EFFECTIVE },
    { BUG,          POISON,       SUPER_EFFECTIVE },
    { ROCK,         FIRE,         SUPER_EFFECTIVE },
    { ROCK,         FIGHTING,     NOT_VERY_EFFECTIVE },
    { ROCK,         GROUND,       NOT_VERY_EFFECTIVE },
    { ROCK,         FLYING,       SUPER_EFFECTIVE },
    { ROCK,         BUG,          SUPER_EFFECTIVE },
    { ROCK,         ICE,          SUPER_EFFECTIVE },
    { GHOST,        NORMAL,       NO_EFFECT },
    { GHOST,        PSYCHIC_TYPE, NO_EFFECT },
    { FIRE,         DRAGON,       NOT_VERY_EFFECTIVE },
    { WATER,        DRAGON,       NOT_VERY_EFFECTIVE },
    { ELECTRIC,     DRAGON,       NOT_VERY_EFFECTIVE },
    { GRASS,        DRAGON,       NOT_VERY_EFFECTIVE },
    { ICE,          DRAGON,       SUPER_EFFECTIVE },
    { DRAGON,       DRAGON,       SUPER_EFFECTIVE },
    { (unsigned char)-1, (unsigned char)0, (unsigned char)0 }, // Terminator
};

#define NUM_TYPE_MATCHUPS ((sizeof(type_matchups) / sizeof(type_matchups[0])) - 1)
