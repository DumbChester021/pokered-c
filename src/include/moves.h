/*
 * moves.h — Move IDs and effect constants
 * Mirrors constants/move_constants.asm and constants/move_effect_constants.asm
 */

#ifndef POKERED_MOVES_H
#define POKERED_MOVES_H

#include <stdint.h>

/* ---- Move IDs (constants/move_constants.asm) ---- */

#define NO_MOVE       0x00
#define POUND         0x01
#define KARATE_CHOP   0x02
#define DOUBLESLAP    0x03
#define COMET_PUNCH   0x04
#define MEGA_PUNCH    0x05
#define PAY_DAY       0x06
#define FIRE_PUNCH    0x07
#define ICE_PUNCH     0x08
#define THUNDERPUNCH  0x09
#define SCRATCH       0x0A
#define VICEGRIP      0x0B
#define GUILLOTINE    0x0C
#define RAZOR_WIND    0x0D
#define SWORDS_DANCE  0x0E
#define CUT           0x0F
#define GUST          0x10
#define WING_ATTACK   0x11
#define WHIRLWIND     0x12
#define FLY           0x13
#define BIND          0x14
#define SLAM          0x15
#define VINE_WHIP     0x16
#define STOMP         0x17
#define DOUBLE_KICK   0x18
#define MEGA_KICK     0x19
#define JUMP_KICK     0x1A
#define ROLLING_KICK  0x1B
#define SAND_ATTACK   0x1C
#define HEADBUTT      0x1D
#define HORN_ATTACK   0x1E
#define FURY_ATTACK   0x1F
#define HORN_DRILL    0x20
#define TACKLE        0x21
#define BODY_SLAM     0x22
#define WRAP          0x23
#define TAKE_DOWN     0x24
#define THRASH        0x25
#define DOUBLE_EDGE   0x26
#define TAIL_WHIP     0x27
#define POISON_STING  0x28
#define TWINEEDLE     0x29
#define PIN_MISSILE   0x2A
#define LEER          0x2B
#define BITE          0x2C
#define GROWL         0x2D
#define ROAR          0x2E
#define SING          0x2F
#define SUPERSONIC    0x30
#define SONICBOOM     0x31
#define DISABLE       0x32
#define ACID          0x33
#define EMBER         0x34
#define FLAMETHROWER  0x35
#define MIST          0x36
#define WATER_GUN     0x37
#define HYDRO_PUMP    0x38
#define SURF          0x39
#define ICE_BEAM      0x3A
#define BLIZZARD      0x3B
#define PSYBEAM       0x3C
#define BUBBLEBEAM    0x3D
#define AURORA_BEAM   0x3E
#define HYPER_BEAM    0x3F
#define PECK          0x40
#define DRILL_PECK    0x41
#define SUBMISSION    0x42
#define LOW_KICK      0x43
#define COUNTER       0x44
#define SEISMIC_TOSS  0x45
#define STRENGTH      0x46
#define ABSORB        0x47
#define MEGA_DRAIN    0x48
#define LEECH_SEED    0x49
#define GROWTH        0x4A
#define RAZOR_LEAF    0x4B
#define SOLARBEAM     0x4C
#define POISONPOWDER  0x4D
#define STUN_SPORE    0x4E
#define SLEEP_POWDER  0x4F
#define PETAL_DANCE   0x50
#define STRING_SHOT   0x51
#define DRAGON_RAGE   0x52
#define FIRE_SPIN     0x53
#define THUNDERSHOCK  0x54
#define THUNDERBOLT   0x55
#define THUNDER_WAVE  0x56
#define THUNDER       0x57
#define ROCK_THROW    0x58
#define EARTHQUAKE    0x59
#define FISSURE       0x5A
#define DIG           0x5B
#define TOXIC         0x5C
#define CONFUSION     0x5D
#define PSYCHIC_M     0x5E
#define HYPNOSIS      0x5F
#define MEDITATE      0x60
#define AGILITY       0x61
#define QUICK_ATTACK  0x62
#define RAGE          0x63
#define TELEPORT      0x64
#define NIGHT_SHADE   0x65
#define MIMIC         0x66
#define SCREECH       0x67
#define DOUBLE_TEAM   0x68
#define RECOVER       0x69
#define HARDEN        0x6A
#define MINIMIZE      0x6B
#define SMOKESCREEN   0x6C
#define CONFUSE_RAY   0x6D
#define WITHDRAW      0x6E
#define DEFENSE_CURL  0x6F
#define BARRIER       0x70
#define LIGHT_SCREEN  0x71
#define HAZE          0x72
#define REFLECT       0x73
#define FOCUS_ENERGY  0x74
#define BIDE          0x75
#define METRONOME     0x76
#define MIRROR_MOVE   0x77
#define SELFDESTRUCT  0x78
#define EGG_BOMB      0x79
#define LICK          0x7A
#define SMOG          0x7B
#define SLUDGE        0x7C
#define BONE_CLUB     0x7D
#define FIRE_BLAST    0x7E
#define WATERFALL     0x7F
#define CLAMP         0x80
#define SWIFT         0x81
#define SKULL_BASH    0x82
#define SPIKE_CANNON  0x83
#define CONSTRICT     0x84
#define AMNESIA       0x85
#define KINESIS       0x86
#define SOFTBOILED    0x87
#define HI_JUMP_KICK  0x88
#define GLARE         0x89
#define DREAM_EATER   0x8A
#define POISON_GAS    0x8B
#define BARRAGE       0x8C
#define LEECH_LIFE    0x8D
#define LOVELY_KISS   0x8E
#define SKY_ATTACK    0x8F
#define TRANSFORM     0x90
#define BUBBLE        0x91
#define DIZZY_PUNCH   0x92
#define SPORE         0x93
#define FLASH         0x94
#define PSYWAVE       0x95
#define SPLASH        0x96
#define ACID_ARMOR    0x97
#define CRABHAMMER    0x98
#define EXPLOSION     0x99
#define FURY_SWIPES   0x9A
#define BONEMERANG    0x9B
#define REST          0x9C
#define ROCK_SLIDE    0x9D
#define HYPER_FANG    0x9E
#define SHARPEN       0x9F
#define CONVERSION    0xA0
#define TRI_ATTACK    0xA1
#define SUPER_FANG    0xA2
#define SLASH         0xA3
#define SUBSTITUTE    0xA4
#define STRUGGLE      0xA5

#define NUM_ATTACKS   0xA5

/* ---- Move effect IDs (constants/move_effect_constants.asm) ---- */

#define NO_ADDITIONAL_EFFECT        0x00
#define POISON_SIDE_EFFECT1         0x02
#define DRAIN_HP_EFFECT             0x03
#define BURN_SIDE_EFFECT1           0x04
#define FREEZE_SIDE_EFFECT1         0x05
#define PARALYZE_SIDE_EFFECT1       0x06
#define EXPLODE_EFFECT              0x07
#define DREAM_EATER_EFFECT          0x08
#define MIRROR_MOVE_EFFECT          0x09
#define ATTACK_UP1_EFFECT           0x0A
#define DEFENSE_UP1_EFFECT          0x0B
#define SPEED_UP1_EFFECT            0x0C
#define SPECIAL_UP1_EFFECT          0x0D
#define ACCURACY_UP1_EFFECT         0x0E
#define EVASION_UP1_EFFECT          0x0F
#define PAY_DAY_EFFECT              0x10
#define SWIFT_EFFECT                0x11
#define ATTACK_DOWN1_EFFECT         0x12
#define DEFENSE_DOWN1_EFFECT        0x13
#define SPEED_DOWN1_EFFECT          0x14
#define SPECIAL_DOWN1_EFFECT        0x15
#define ACCURACY_DOWN1_EFFECT       0x16
#define EVASION_DOWN1_EFFECT        0x17
#define CONVERSION_EFFECT           0x18
#define HAZE_EFFECT                 0x19
#define BIDE_EFFECT                 0x1A
#define THRASH_PETAL_DANCE_EFFECT   0x1B
#define SWITCH_AND_TELEPORT_EFFECT  0x1C
#define TWO_TO_FIVE_ATTACKS_EFFECT  0x1D
#define FLINCH_SIDE_EFFECT1         0x1F
#define SLEEP_EFFECT                0x20
#define POISON_SIDE_EFFECT2         0x21
#define BURN_SIDE_EFFECT2           0x22
#define PARALYZE_SIDE_EFFECT2       0x24
#define FLINCH_SIDE_EFFECT2         0x25
#define OHKO_EFFECT                 0x26
#define CHARGE_EFFECT               0x27
#define SUPER_FANG_EFFECT           0x28
#define SPECIAL_DAMAGE_EFFECT       0x29
#define TRAPPING_EFFECT             0x2A
#define FLY_EFFECT                  0x2B
#define ATTACK_TWICE_EFFECT         0x2C
#define JUMP_KICK_EFFECT            0x2D
#define MIST_EFFECT                 0x2E
#define FOCUS_ENERGY_EFFECT         0x2F
#define RECOIL_EFFECT               0x30
#define CONFUSION_EFFECT            0x31
#define ATTACK_UP2_EFFECT           0x32
#define DEFENSE_UP2_EFFECT          0x33
#define SPEED_UP2_EFFECT            0x34
#define SPECIAL_UP2_EFFECT          0x35
#define HEAL_EFFECT                 0x38
#define TRANSFORM_EFFECT            0x39
#define ATTACK_DOWN_SIDE_EFFECT     0x44
#define DEFENSE_DOWN_SIDE_EFFECT    0x45
#define SPEED_DOWN_SIDE_EFFECT      0x46
#define SPECIAL_DOWN_SIDE_EFFECT    0x47
#define CONFUSION_SIDE_EFFECT       0x4C
#define TWINEEDLE_EFFECT            0x4D
#define SUBSTITUTE_EFFECT           0x4F
#define HYPER_BEAM_EFFECT           0x50
#define RAGE_EFFECT                 0x51
#define MIMIC_EFFECT                0x52
#define METRONOME_EFFECT            0x53
#define LEECH_SEED_EFFECT           0x54
#define SPLASH_EFFECT               0x55
#define DISABLE_EFFECT              0x56
#define LIGHT_SCREEN_EFFECT         0x40
#define REFLECT_EFFECT              0x41
#define POISON_EFFECT               0x42
#define PARALYZE_EFFECT             0x43
#define DEFENSE_DOWN2_EFFECT        0x3B
#define EVASION_UP2_EFFECT          0x37
#define ACCURACY_DOWN2_EFFECT       0x3E

/* ---- Move data struct (6 bytes, matches MOVE_LENGTH) ---- */

/* Categories */
#define PHYSICAL 0
#define SPECIAL  1
#define STATUS   2

typedef struct {
    uint8_t animation;  /* interchangeable with move ID */
    uint8_t effect;
    uint8_t power;
    uint8_t type;
    uint8_t category; /* 0=Physical, 1=Special, 2=Status */
    uint8_t accuracy;   /* percentage (0–100, stored as-is * 256/100 is NOT done) */
    uint8_t pp;
} MoveData;

#define MOVE_LENGTH 7

#endif /* POKERED_MOVES_H */
