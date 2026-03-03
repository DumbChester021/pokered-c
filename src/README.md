# C Source Modules (`src/`)

This directory contains C source files as the pokered codebase is incrementally migrated from RGBDS assembly to C.

## Status: Phase 2 — Data Tables In Progress

Two data tables have been migrated from hand-written ASM to C source with auto-generation:

| Module | C Source | Generated ASM | Status |
|--------|----------|---------------|--------|
| Type effectiveness | `src/data/type_matchups.c` | `data/types/type_matchups.asm` | ✅ Verified |
| Move data (165 moves) | `src/data/moves.c` | `data/moves/moves.asm` | ✅ Verified |

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

This project uses [GBDK-2020](https://github.com/gbdev/gbdk-2020) (planned for future phases).
Current phases use a **C → generated ASM** pipeline that keeps the RGBDS build chain intact.

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
```

## Migration Order (planned)

1. **Data tables** — ~~type charts~~, ~~move data~~, growth rates, item prices, base stats
2. **Utility functions** — string handling, math, RNG
3. **Engine subsystems** — menu system, overworld, battle engine
4. **Core** — main loop, interrupt handlers

Each migrated module must produce a byte-identical ROM (verified via `make compare`).
