/*
 * growth_rates.c — EXP growth rate formulas
 * Source of truth for data/growth_rates.asm
 *
 * Run: python3 tools/c2asm.py src/data/growth_rates.c > data/growth_rates.asm
 *
 * Formula: [a]/[b]*n^3 + [c]*n^2 + [d]*n - [e]
 * The generator emits growth_rate macro calls.
 */

/* @asm_mode growth_rate */
/* @asm_label GrowthRateTable */
/* @asm_label_comment ; entries correspond to GROWTH_* (see constants/pokemon_data_constants.asm) */
/* @asm_table_width 4 */
/* @asm_assert assert_table_length NUM_GROWTH_RATES */

typedef struct {
    int a, b, c, d, e;
    const char *name;
} GrowthRate;

const GrowthRate growth_rates[] = {
    /* a  b    c    d    e     name */
    { 1, 1,   0,   0,   0, "Medium Fast" },
    { 3, 4,  10,   0,  30, "Slightly Fast" },
    { 3, 4,  20,   0,  70, "Slightly Slow" },
    { 6, 5, -15, 100, 140, "Medium Slow" },
    { 4, 5,   0,   0,   0, "Fast" },
    { 5, 4,   0,   0,   0, "Slow" },
};
