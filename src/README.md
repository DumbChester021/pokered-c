# C Source Modules (`src/`)

This directory contains C source files as the pokered codebase is incrementally migrated from RGBDS assembly to C.

## Status: Phase 2 — Data Tables ✅ Complete

All four data tables have been migrated from hand-written ASM to C source with auto-generation:

| Module | C Source | Generated ASM | Status |
|--------|----------|---------------|--------|
| Type effectiveness | `src/data/type_matchups.c` | `data/types/type_matchups.asm` | ✅ Verified |
| Move data (165 moves) | `src/data/moves.c` | `data/moves/moves.asm` | ✅ Verified |
| Growth rates (6 entries) | `src/data/growth_rates.c` | `data/growth_rates.asm` | ✅ Verified |
| Item prices (97 + 14 floors) | `src/data/item_prices.c` | `data/items/prices.asm` | ✅ Verified |

## How It Works

1. **Author data in C** — structured arrays in `src/data/*.c` using constants from `src/include/*.h`
2. **Generate ASM** — `tools/c2asm.py` reads the C files and emits RGBDS-compatible `.asm`
3. **Build normally** — the Makefile auto-generates ASM when C sources change
4. **Verify** — `make compare` checks SHA1 hashes to ensure byte-identical ROMs

```bash
# Regenerate all ASM data files from C sources
make generate

# Full build + SHA1 verification
make red && make compare
```

## Toolchain

This project uses a **C → generated ASM** pipeline that keeps the RGBDS build chain intact.
[GBDK-2020](https://github.com/gbdk/gbdk-2020) is planned for future phases (engine + core migration).

### Code Generation Directives

C data files use `@asm_*` comment directives to control the generated output:

```c
/* @asm_label TypeEffects */          // Label name
/* @asm_comment  attacker, defender */  // Comment header
/* @asm_macro move */                 // Use macro instead of db
/* @asm_table_width MOVE_LENGTH */    // table_width directive
/* @asm_assert assert_table_length NUM_ATTACKS */  // assertion
/* @asm_terminator db -1 ; end */     // table terminator
/* @asm_preamble MACRO move */        // raw preamble lines
/* @asm_mode bcd3 */                  // specialized output mode
```

## Migration Order

1. ~~**Data tables** — type charts, move data, growth rates, item prices~~ ✅ Done
2. **Data tables (remaining)** — base stats (151 files, needs ASM pass-through)
3. **Utility functions** — string handling, math, RNG
4. **Engine subsystems** — menu system, overworld, battle engine
5. **Core** — main loop, interrupt handlers

Each migrated module must produce a byte-identical ROM (verified via `make compare`).

For full documentation, see [docs/MIGRATION_GUIDE.md](../docs/MIGRATION_GUIDE.md).
