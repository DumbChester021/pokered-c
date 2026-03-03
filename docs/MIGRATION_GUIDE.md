# Pokémon Red/Blue — Assembly → C Expansion Framework

> **What is this?** This repository is a fork of [pret/pokered](https://github.com/pret/pokered) — a complete disassembly of Pokémon Red and Blue for the original Game Boy. We are **incrementally migrating the codebase from RGBDS assembly to a native C logic engine**. The private repo lives at [DumbChester021/pokered-c](https://github.com/DumbChester021/pokered-c).

---

## Table of Contents

1. [Project Goal](#project-goal)
2. [Architecture Overview](#architecture-overview)
3. [The Transpiler Pipeline](#the-transpiler-pipeline)
4. [What Has Been Done](#what-has-been-done)
5. [What Needs To Be Done](#what-needs-to-be-done)
6. [What You Should NOT Do](#what-you-should-not-do)
7. [How The Build System Works](#how-the-build-system-works)
8. [Adding C Logic](#adding-c-logic)
9. [ROM Bank Layout](#rom-bank-layout)
10. [Git Workflow](#git-workflow)

---

## Project Goal

**Make the Pokémon Red/Blue codebase maintainable and extensible by migrating it from Game Boy assembly to a C-based Expansion Engine**. We are building a foundational framework where complex logic and new expansions (e.g. physical/special split, new types) can be written rapidly in C, compiling naturally into the ROM.

> **Note on Byte-Matching:** In the earliest phases of this project, we enforced a strict 1:1 SHA hash byte-matching requirement with the original 1998 ROM (`make compare`). Due to the inherent differences in how SDCC and RGBDS emit and organize functional assembly frames, **this requirement has been officially deprecated.** The `pokered-c` repository now prioritizes clean, extensible C logic over binary perfection, similar to the `pokeemerald` expansion model.

The expansion framework utilizes a custom transpiler, `sdcc2rgbasm.py`, allowing C functions to be compiled by SDCC and subsequently linked cleanly into the original RGBDS source files.

---

## Architecture Overview

```
pokered-c/
├── src/                    # ← NEW: C source files (our additions)
│   ├── include/            #   C headers matching game structures
│   │   ├── global.h        #   Main configuration definition file mimicking Pokeemerald
│   │   ├── types.h         
│   │   ├── moves.h         
│   │   └── pokemon.h       
│   ├── data/               #   C data tables (BaseStats, etc.)
│   └── engine/             #   C logic (Battle routines, utilities)
├── tools/
│   ├── sdcc2rgbasm.py      # ← NEW: C→ASM transpiler script
│   └── mapusage.py         # ← NEW: ROM/RAM space report
├── constants/              #   ASM constant definitions
├── engine/                 #   Legacy ASM game engine code
├── home/                   #   Legacy ASM code in ROM bank 0
├── Makefile                #   Build system (extended with C→ASM rules)
├── layout.link             #   ROM bank assignments
└── main.asm                #   Top-level section/include map
```

### The Toolchain Bridge

- **RGBDS** (current assembler/linker) produces `.o` files with its own format.
- **SDCC** (C compiler for Game Boy) produces ASZ80 output formats.
- To avoid linker toolchain incompatibilities during the transition, we route `.c` files via `sdcc2rgbasm.py`, converting SDCC's output into standard `.asm` files that RGBDS (`rgbasm`) natively understands and compiles into standard `.o` objects.

---

## The Transpiler Pipeline

The script `tools/sdcc2rgbasm.py` acts as the vital glue. Its responsibilities include:

1. **Section Mapping:** Translating `.area _CODE` into `SECTION "C Code %s %d", ROMX` to avoid linker collisions.
2. **Value Conversion:** Converting SDCC's `#0A` immediates to RGBDS-compatible `$0A`.
3. **Symbol Renaming:** Scrubbing the `_` prefix SDCC attaches to global functions and variables, bridging them natively to RGBDS `::` exporters.

---

## What Has Been Done

### Phase 1: Infrastructure ✅
- Set up `src/include/global.h` config logic.
- Implemented `sdcc2rgbasm.py`.
- Refactored `Makefile` to natively support `obj/%.o` compilation through the C pipeline.

### Phase 2: Core Data Translation ✅
- `BaseStats` and `MewBaseStats` successfully compile from C structs directly into the linked ROM object tables.

---

## What Needs To Be Done

### Phase 3: Utility Functions (Math & RNG) ✅
- Implemented C versions of `Random_`, `_Multiply`, and `_Divide` in `src/engine/math.c`.
- Restructured `sdcc2rgbasm.py` to seamlessly convert negative SP offsets, 32-bit math structs, and `(#label + n)` immediate logic correctly into RGBDS.
- Created `src/include/hram.h` mapping hardware timer variables natively for direct interaction with legacy features.

---

## What Needs To Be Done

### Phase 4: Engine Subsystems (Current Focus)
With the toolchain unblocked and utility math/hardware access functioning natively, we are now migrating standalone engine subsystems to pure C. 
- `engine/play_time.asm` migrated to `src/engine/play_time.c` utilizing pure memory-mapped WRAM definitions.

### Phase 5: Engine Expansions (Future)
Target Features:
- Physical / Special split mechanic.
- New moves / logic adjustments.
- Fairy Type implementation.

---

## What You Should NOT Do

1. **Do NOT worry about `make compare` failures.** It will throw a warning about hashes drifting. This is expected.
2. **Do NOT change the ROM bank layout (`layout.link`) unnecessarily.** Bank limitations still apply. C functions that jump across banks indiscriminately will crash.
3. **Do NOT modify generated `obj/**/*.asm` files.** Editing transpiler output is futile; always edit the source `*.c` or `*.h` files.

---

## How The Build System Works

```bash
# Standard build (compiles C, assembles ASM, links ROM, runs space report)
make red          # builds pokered.gbc
make blue         # builds pokeblue.gbc

# Clean out all object files (necessary if C headers change)
make clean

# Build and verify hashes (will gracefully warn about drift)
make red && make compare
```

### Makefile Generation Rules

C source files are compiled using a universal pattern rule:

```makefile
obj/%.asm: src/%.c src/asm/macros.asm tools/sdcc2rgbasm.py
	@mkdir -p $(dir $@)
	$(SDCC) $(SDCC_CFLAGS) -S -o $@.tmp $<
	$(PYTHON) tools/sdcc2rgbasm.py $@.tmp > $@
	@rm $@.tmp
```
The resulting `.asm` is subsequently processed by `rgbasm` into `.o` files automatically through the `rom_obj` array mapping.

---

## Adding C Logic

1. Create a logic file (e.g., `src/engine/new_mechanic.c`).
2. Include `"../include/global.h"`.
3. Write standard C functions.
4. Open the `Makefile` and append `obj/engine/new_mechanic.o` to the `rom_obj` target array.
5. In legacy `.asm` files, `call new_mechanic` behaves normally, as the transpiler registers external C declarations to RGBDS.

## ROM Bank Layout

| Bank | Contents | Notes |
|------|----------|-------|
| ROM0 | `home/*.asm` — always-accessible code | 99.0% full, very tight |
| $0E | Move data, base stats, cries, trainer AI | BaseStats C modules load here via `WRAM0`. |
| WRAM0 | Working RAM | Used for static initialization blocks. |
| HRAM | High RAM | 100% full |

See `layout.link` for full architectural memory map constraints.

---

## Git Workflow

| File type | Tracked? | Why |
|-----------|----------|-----|
| `src/**/*.c`/`.h` | ✅ Yes | Source of truth |
| `tools/sdcc2rgbasm.py` | ✅ Yes | The transpiler script |
| `obj/**/*.asm` | ❌ No | Temporary build artifacts. |
| `Makefile` | ✅ Yes | Build rules |
| `docs/MIGRATION_GUIDE.md` | ✅ Yes | This document |

*Last updated: 2026-03-04.*
