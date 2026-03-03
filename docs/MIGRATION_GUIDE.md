# Pokémon Red/Blue — Assembly → C Migration Guide

> **What is this?** This repository is a fork of [pret/pokered](https://github.com/pret/pokered) — a complete disassembly of Pokémon Red and Blue for the original Game Boy. We are **incrementally migrating the codebase from RGBDS assembly to C** using a code-generation pipeline. The private repo lives at [DumbChester021/pokered-c](https://github.com/DumbChester021/pokered-c).

---

## Table of Contents

1. [Project Goal](#project-goal)
2. [Architecture Overview](#architecture-overview)
3. [What Has Been Done](#what-has-been-done)
4. [What Needs To Be Done](#what-needs-to-be-done)
5. [What You Should NOT Do](#what-you-should-not-do)
6. [How The Build System Works](#how-the-build-system-works)
7. [How The Code Generation Pipeline Works](#how-the-code-generation-pipeline-works)
8. [Key Files Reference](#key-files-reference)
9. [ROM Bank Layout](#rom-bank-layout)
10. [Verification Process](#verification-process)
11. [Known Challenges](#known-challenges)

---

## Project Goal

**Make the Pokémon Red/Blue codebase maintainable and extensible by migrating it from Game Boy assembly to C**, one module at a time. Every intermediate step must produce a **byte-identical ROM** — same SHA1 as the original. This is not a rewrite; it is a faithful translation.

The migration follows this phased order:
1. **Data tables** — pure data with no logic (easiest, lowest risk)
2. **Utility functions** — self-contained math/string helpers
3. **Engine subsystems** — menus, overworld, battle
4. **Core** — main loop, interrupts (last, everything depends on them)

---

## Architecture Overview

```
pokered-c/
├── src/                    # ← NEW: C source files (our additions)
│   ├── include/            #   C headers mirroring ASM constants
│   │   ├── types.h         #   Type constants (NORMAL, FIRE, etc.)
│   │   └── moves.h         #   Move IDs, effects, MoveData struct
│   └── data/               #   C data tables (source of truth)
│       ├── type_matchups.c #   Type effectiveness chart
│       └── moves.c         #   165 move data entries
├── tools/
│   ├── c2asm.py            # ← NEW: C→ASM code generator
│   └── mapusage.py         # ← NEW: ROM/RAM space report
├── data/                   #   ASM data files (some now auto-generated)
│   ├── types/type_matchups.asm   # ← GENERATED from src/data/type_matchups.c
│   ├── moves/moves.asm           # ← GENERATED from src/data/moves.c
│   ├── pokemon/base_stats/       #   151 individual Pokémon stat files
│   ├── items/prices.asm          #   Item prices (BCD-encoded)
│   └── growth_rates.asm          #   EXP growth rate formulas
├── constants/              #   ASM constant definitions (the canonical reference)
├── engine/                 #   ASM game engine code
├── home/                   #   ASM code in ROM bank 0 (always accessible)
├── Makefile                #   Build system (extended with C→ASM rules)
├── layout.link             #   ROM bank assignments
└── main.asm                #   Top-level section/include map
```

### The Critical Constraint: Toolchain Incompatibility

- **RGBDS** (current assembler/linker) produces `.o` files with its own format
- **SDCC/GBDK-2020** (C compiler for Game Boy) produces `.rel` files
- **These are incompatible** — you CANNOT link RGBDS `.o` with SDCC `.rel`

This is why we use a **code-generation approach** for early phases: write data in C, generate ASM, keep building with RGBDS. A full SDCC migration is a future milestone.

---

## What Has Been Done

### Phase 1: Infrastructure ✅

| Item | File | Status |
|------|------|--------|
| Type constants header | `src/include/types.h` | ✅ Done |
| Move constants header | `src/include/moves.h` | ✅ Done |
| Code generator | `tools/c2asm.py` | ✅ Done |
| Makefile integration | `Makefile` (generate target) | ✅ Done |
| ROM space reporter | `tools/mapusage.py` | ✅ Done (previous session) |

### Phase 2: Data Tables ✅

| Table | C Source | Generated ASM | Entries | Verified |
|-------|----------|---------------|---------|----------|
| Type effectiveness | `src/data/type_matchups.c` | `data/types/type_matchups.asm` | 82 matchups | ✅ SHA1 match |
| Move data | `src/data/moves.c` | `data/moves/moves.asm` | 165 moves | ✅ SHA1 match |
| Growth rates | `src/data/growth_rates.c` | `data/growth_rates.asm` | 6 entries | ✅ SHA1 match |
| Item prices | `src/data/item_prices.c` | `data/items/prices.asm` | 97 items + floors | ✅ SHA1 match |

**Verification results (all pass):**
- `pokered.gbc` — `ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- `pokeblue.gbc` — `d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- `pokeblue_debug.gbc` — `5b1456177671b79b263c614ea0e7cc9ac542e9c4`

---

## What Needs To Be Done

### Phase 2 (remaining data tables)

| Table | File | Difficulty | Blocker |
|-------|------|------------|----------|
| **Base stats** | `data/pokemon/base_stats/*.asm` | Hard | 151 individual files. Each has `INCBIN` for sprite dimensions, `dw` for pic pointers, `tmhm` bitfield macro. These can't be expressed in pure C — need ASM pass-through support in the generator. |

### Phase 3: Utility Functions (future)

Migrate self-contained helpers that don't touch hardware registers:
- `home/math.asm` — multiply/divide
- `home/random.asm` — RNG (LFSR)
- `engine/math/bcd.asm` — BCD arithmetic
- `home/copy_string.asm`, `home/compare.asm`

**Strategy decision needed:** either extend `c2asm.py` to handle function bodies, or use SDCC with a `sdcc2rgbds` post-processor.

### Phase 4–5: Engine + Core (far future)

These require switching the entire linker from `rgblink` to `sdldgb` (SDCC's linker). This is a **one-way gate** — all remaining ASM must be converted to SDCC assembly syntax at that point.

---

## What You Should NOT Do

> **These are critical constraints. Violating them will break the build or produce wrong ROMs.**

1. **Do NOT change the ROM bank layout.** Every section in `layout.link` has a fixed bank assignment. Data must stay in the same bank or the game crashes (code does `ld a, BANK(Label)` to switch banks).

2. **Do NOT mix RGBDS and SDCC object files.** They use incompatible formats. Until the full linker migration (Phase 4+), all code must go through the RGBDS assembler.

3. **Do NOT modify generated ASM files by hand.** If you need to change data, edit the C source in `src/data/` and run `make generate`. Hand edits will be overwritten.

4. **Do NOT skip `make compare` after any change.** The SHA1 check is the ultimate correctness gate. If it fails, your change altered the ROM output.

5. **Do NOT add new C files without Makefile rules.** Each new `src/data/*.c` file needs a corresponding generation rule in the Makefile and an entry in the `generate` target.

6. **Do NOT use GBDK-2020 library functions yet.** We're only using the C→ASM generation pipeline. GBDK runtime/library calls would require the full linker migration.

7. **Do NOT change the `move` MACRO definition.** It's embedded in the generated `moves.asm` via `@asm_preamble` directives. If you need to change it, edit `src/data/moves.c`.

8. **Do NOT assume whitespace in ASM doesn't matter.** While the assembler ignores extra whitespace, `make compare` won't care, but `c2asm.py --diff` mode does character-level comparison for development sanity checks.

---

## How The Build System Works

```bash
# Standard build (assembles all .asm files, links ROM, runs space report)
make red          # builds pokered.gbc
make blue         # builds pokeblue.gbc

# Regenerate ASM data files from C sources
make generate     # runs c2asm.py for each registered data module

# Verify byte-identical ROMs (THE critical test)
make compare      # sha1sum -c roms.sha1

# Space report
make usage        # per-bank ROM/RAM fill percentages

# Full clean rebuild + verification
make clean && make red && make compare
```

### Make dependency chain

```
src/data/*.c + src/include/*.h + tools/c2asm.py
       │
       ▼  (make generate)
data/**/*.asm  (generated)
       │
       ▼  (rgbasm)
*.o files
       │
       ▼  (rgblink + rgbfix)
pokered.gbc / pokeblue.gbc
       │
       ▼  (make compare)
SHA1 verification against roms.sha1
```

---

## How The Code Generation Pipeline Works

### `tools/c2asm.py`

Reads a C source file containing a `const` array of structs, parses `@asm_*` comment directives, and emits RGBDS-compatible assembly.

### Supported directives (placed in C comments)

| Directive | Purpose | Example |
|-----------|---------|---------|
| `@asm_label` | Output label name | `TypeEffects` |
| `@asm_comment` | Comment line after label | `attacker, defender, *=` |
| `@asm_label_comment` | Comment on its own line after label | `; Characteristics of each move.` |
| `@asm_macro` | Use named macro instead of `db` | `move` |
| `@asm_table_width` | Emit `table_width X` | `MOVE_LENGTH` |
| `@asm_assert` | Emit assertion after data | `assert_table_length NUM_ATTACKS` |
| `@asm_assert2` | Second assertion (e.g. after floor entries) | `assert_table_length NUM_ITEMS + NUM_FLOORS` |
| `@asm_terminator` | Emit terminator after data | `db -1 ; end` |
| `@asm_preamble` | Raw lines before the label (multi-line) | `MACRO move` ... `ENDM` |
| `@asm_mode` | Specialized output mode | `bcd3`, `growth_rate` |

### Adding a new data table

1. Create `src/include/foo.h` with `#define` constants (mirror from `constants/*.asm`)
2. Create `src/data/foo.c` with the data array + `@asm_*` directives
3. Add to `Makefile`:
   ```makefile
   data/path/foo.asm: src/data/foo.c src/include/foo.h tools/c2asm.py
   	$(C2ASM) $< > $@
   ```
4. Add `data/path/foo.asm` to the `generate` target prerequisites
5. Run `make generate && make red && make compare`

---

## Key Files Reference

| File | What it is | When to read it |
|------|-----------|-----------------|
| `main.asm` | Top-level includes — maps every `.asm` file to a ROM bank section | When you need to know which bank a data table lives in |
| `layout.link` | ROM/RAM bank layout for the linker | When you need to understand memory map |
| `constants/*.asm` | All game constants (types, moves, items, Pokemon IDs, etc.) | When creating new `src/include/*.h` headers |
| `data/pokemon/base_stats/bulbasaur.asm` | Example base stat struct (28 bytes) | When planning base stats migration |
| `data/growth_rates.asm` | Growth rate macro with signed magnitude encoding | When planning growth rates migration |
| `data/items/prices.asm` | Item prices in BCD3 format | When planning item prices migration |
| `roms.sha1` | Expected SHA1 checksums for all ROM outputs | Reference for `make compare` |
| `tools/mapusage.py` | ROM/RAM space report script | When checking bank fill percentages |

---

## ROM Bank Layout (key banks)

| Bank | Contents | Notes |
|------|----------|-------|
| ROM0 | `home/*.asm` — always-accessible code | 99.0% full, very tight |
| $01 | Item prices, item names, sprites, menus, cable club | Where `data/items/prices.asm` lives |
| $0E | Move data, base stats, cries, trainer AI, evos | Where `data/moves/moves.asm` lives |
| $0F | Battle core engine | Where `data/types/type_matchups.asm` is referenced |
| $2C | Move names | Nearly empty (9.5%) |
| WRAM0 | Working RAM | 99.6% full |
| HRAM | High RAM | 100% full |

Full layout: see `layout.link` (206 lines)

---

## Verification Process

**Every change must pass this sequence:**

```bash
# 1. Regenerate ASM from C sources
make generate

# 2. Clean build
make clean && make red

# 3. SHA1 verification (THE critical gate)
make compare
# Expected output:
#   pokered.gbc: OK
#   pokeblue.gbc: OK
#   pokeblue_debug.gbc: OK
#   pokered.patch: OK
#   pokeblue.patch: OK

# 4. Optional: space report
make usage
```

If `make compare` fails, your change altered the ROM binary. Debug by comparing the generated `.asm` against the original (use `git diff` or `c2asm.py --diff`).

---

## Known Challenges

### ~~Growth Rates Macro~~ ✅ SOLVED
The `growth_rate` mode in `c2asm.py` handles `dn` packing and signed magnitude encoding automatically.

### ~~BCD Encoding~~ ✅ SOLVED
The `bcd3` mode in `c2asm.py` emits `bcd3 VALUE ; COMMENT` lines directly. The `bcd3` MACRO (defined in `macros/data.asm`) handles the actual BCD encoding at assembly time.

### Base Stats INCBIN
Each base stat file contains `INCBIN "gfx/pokemon/front/name.pic", 0, 1` for sprite dimensions and `dw NamePicFront, NamePicBack` for pic pointers. These are ASM-specific constructs that can't be expressed in C. The generator would need "passthrough" support to emit literal ASM lines.

### Toolchain Migration (Phase 4+)
Switching from RGBDS to SDCC linker is a one-way gate. All remaining ASM must adopt SDCC syntax (`.area` instead of `SECTION`, `.globl` instead of `EXPORT`). This should only happen once enough engine code is in C to justify the transition.

---

*Last updated: 2026-03-03.*
