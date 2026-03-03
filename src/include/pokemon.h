/*
 * pokemon.h — Pokémon base stat constants and struct
 * Mirrors constants/pokedex_constants.asm + constants/pokemon_data_constants.asm
 */

#ifndef POKERED_POKEMON_H
#define POKERED_POKEMON_H

/* Pokedex IDs (constants/pokedex_constants.asm) */
#define DEX_BULBASAUR   1
#define DEX_IVYSAUR     2
#define DEX_VENUSAUR    3
#define DEX_CHARMANDER  4
#define DEX_CHARMELEON  5
#define DEX_CHARIZARD   6
#define DEX_SQUIRTLE    7
#define DEX_WARTORTLE   8
#define DEX_BLASTOISE   9
#define DEX_CATERPIE    10
#define DEX_METAPOD     11
#define DEX_BUTTERFREE  12
#define DEX_WEEDLE      13
#define DEX_KAKUNA      14
#define DEX_BEEDRILL    15
#define DEX_PIDGEY      16
#define DEX_PIDGEOTTO   17
#define DEX_PIDGEOT     18
#define DEX_RATTATA     19
#define DEX_RATICATE    20
#define DEX_SPEAROW     21
#define DEX_FEAROW      22
#define DEX_EKANS       23
#define DEX_ARBOK       24
#define DEX_PIKACHU     25
#define DEX_RAICHU      26
#define DEX_SANDSHREW   27
#define DEX_SANDSLASH   28
#define DEX_NIDORAN_F   29
#define DEX_NIDORINA    30
#define DEX_NIDOQUEEN   31
#define DEX_NIDORAN_M   32
#define DEX_NIDORINO    33
#define DEX_NIDOKING    34
#define DEX_CLEFAIRY    35
#define DEX_CLEFABLE    36
#define DEX_VULPIX      37
#define DEX_NINETALES   38
#define DEX_JIGGLYPUFF  39
#define DEX_WIGGLYTUFF  40
#define DEX_ZUBAT       41
#define DEX_GOLBAT      42
#define DEX_ODDISH      43
#define DEX_GLOOM       44
#define DEX_VILEPLUME   45
#define DEX_PARAS       46
#define DEX_PARASECT    47
#define DEX_VENONAT     48
#define DEX_VENOMOTH    49
#define DEX_DIGLETT     50
#define DEX_DUGTRIO     51
#define DEX_MEOWTH      52
#define DEX_PERSIAN     53
#define DEX_PSYDUCK     54
#define DEX_GOLDUCK     55
#define DEX_MANKEY      56
#define DEX_PRIMEAPE    57
#define DEX_GROWLITHE   58
#define DEX_ARCANINE    59
#define DEX_POLIWAG     60
#define DEX_POLIWHIRL   61
#define DEX_POLIWRATH   62
#define DEX_ABRA        63
#define DEX_KADABRA     64
#define DEX_ALAKAZAM    65
#define DEX_MACHOP      66
#define DEX_MACHOKE     67
#define DEX_MACHAMP     68
#define DEX_BELLSPROUT  69
#define DEX_WEEPINBELL  70
#define DEX_VICTREEBEL  71
#define DEX_TENTACOOL   72
#define DEX_TENTACRUEL  73
#define DEX_GEODUDE     74
#define DEX_GRAVELER    75
#define DEX_GOLEM       76
#define DEX_PONYTA      77
#define DEX_RAPIDASH    78
#define DEX_SLOWPOKE    79
#define DEX_SLOWBRO     80
#define DEX_MAGNEMITE   81
#define DEX_MAGNETON    82
#define DEX_FARFETCHD   83
#define DEX_DODUO       84
#define DEX_DODRIO      85
#define DEX_SEEL        86
#define DEX_DEWGONG     87
#define DEX_GRIMER      88
#define DEX_MUK         89
#define DEX_SHELLDER    90
#define DEX_CLOYSTER    91
#define DEX_GASTLY      92
#define DEX_HAUNTER     93
#define DEX_GENGAR      94
#define DEX_ONIX        95
#define DEX_DROWZEE     96
#define DEX_HYPNO       97
#define DEX_KRABBY      98
#define DEX_KINGLER     99
#define DEX_VOLTORB     100
#define DEX_ELECTRODE   101
#define DEX_EXEGGCUTE   102
#define DEX_EXEGGUTOR   103
#define DEX_CUBONE      104
#define DEX_MAROWAK     105
#define DEX_HITMONLEE   106
#define DEX_HITMONCHAN  107
#define DEX_LICKITUNG   108
#define DEX_KOFFING     109
#define DEX_WEEZING     110
#define DEX_RHYHORN     111
#define DEX_RHYDON      112
#define DEX_CHANSEY     113
#define DEX_TANGELA     114
#define DEX_KANGASKHAN  115
#define DEX_HORSEA      116
#define DEX_SEADRA      117
#define DEX_GOLDEEN     118
#define DEX_SEAKING     119
#define DEX_STARYU      120
#define DEX_STARMIE     121
#define DEX_MR_MIME     122
#define DEX_SCYTHER     123
#define DEX_JYNX        124
#define DEX_ELECTABUZZ  125
#define DEX_MAGMAR      126
#define DEX_PINSIR      127
#define DEX_TAUROS      128
#define DEX_MAGIKARP    129
#define DEX_GYARADOS    130
#define DEX_LAPRAS      131
#define DEX_DITTO       132
#define DEX_EEVEE       133
#define DEX_VAPOREON    134
#define DEX_JOLTEON     135
#define DEX_FLAREON     136
#define DEX_PORYGON     137
#define DEX_OMANYTE     138
#define DEX_OMASTAR     139
#define DEX_KABUTO      140
#define DEX_KABUTOPS    141
#define DEX_AERODACTYL  142
#define DEX_SNORLAX     143
#define DEX_ARTICUNO    144
#define DEX_ZAPDOS      145
#define DEX_MOLTRES     146
#define DEX_DRATINI     147
#define DEX_DRAGONAIR   148
#define DEX_DRAGONITE   149
#define DEX_MEWTWO      150
#define DEX_MEW         151

#define NUM_POKEMON     151

/* Growth rates (constants/pokemon_data_constants.asm) */
#define GROWTH_MEDIUM_FAST    0
#define GROWTH_SLIGHTLY_FAST  1
#define GROWTH_SLIGHTLY_SLOW  2
#define GROWTH_MEDIUM_SLOW    3
#define GROWTH_FAST           4
#define GROWTH_SLOW           5

#include <stdint.h>

/* Base stats struct */
typedef struct {
    uint8_t dex_id;
    uint8_t hp, atk, def_, spd, spc;
    uint8_t type1, type2;
    uint8_t catch_rate;
    uint8_t base_exp;
    uint8_t pic_dimensions;
    const void *pic_front;
    const void *pic_back;
    uint8_t move1, move2, move3, move4;
    uint8_t growth_rate;
    uint8_t tmhm[7];
    uint8_t padding;           /* 0 for all except Mew (0xFF) */
} BaseStats;

#endif /* POKERED_POKEMON_H */
