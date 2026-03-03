/*
 * growth_rates.c — EXP growth rate formulas
 * Source of truth for data/growth_rates.asm
 *
 * Run: python3 tools/c2asm.py src/data/growth_rates.c > data/growth_rates.asm
 *
 * Formula: [a]/[b]*n^3 + [c]*n^2 + [d]*n - [e]
 * The generator emits growth_rate macro calls.
 */







#include <stdint.h>

#define PERCENT * 0xff / 100

// Macro mapped to asm
// [a]/[b]*n^3 + [c]*n^2 + [d]*n - [e]
// but SDCC will just output bytes so we need to match the struct size to what growth_rate macro expects exactly.
/*
MACRO? growth_rate
	; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 < 0
		db -\3 | $80 ; signed magnitude
	else
		db \3
	endc
	db \4, \5
ENDM
*/
typedef struct {
    uint8_t a_b; // a<<4 | b
    uint8_t c;   // sign-magnitude
    uint8_t d;
    uint8_t e;
} GrowthRate;

#define GROWTH_RATE(a, b, c, d, e) { \
    ((a) << 4) | (b), \
    (c) < 0 ? (-(c) | 0x80) : (c), \
    (d), \
    (e) \
}

const GrowthRate growth_rates[] = {
    GROWTH_RATE(1, 1,   0,   0,   0), // "Medium Fast"
    GROWTH_RATE(3, 4,  10,   0,  30), // "Slightly Fast"
    GROWTH_RATE(3, 4,  20,   0,  70), // "Slightly Slow"
    GROWTH_RATE(6, 5, -15, 100, 140), // "Medium Slow"
    GROWTH_RATE(4, 5,   0,   0,   0), // "Fast"
    GROWTH_RATE(5, 4,   0,   0,   0), // "Slow"
};
