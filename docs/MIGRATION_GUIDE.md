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
8. [c2asm.py Output Modes](#c2asmpy-output-modes)
9. [Walkthrough: Adding a New Data Module](#walkthrough-adding-a-new-data-module)
10. [C Source File Reference](#c-source-file-reference)
11. [Key Files Reference](#key-files-reference)
12. [ROM Bank Layout](#rom-bank-layout)
13. [Verification Process](#verification-process)
14. [Troubleshooting](#troubleshooting)
15. [Known Challenges](#known-challenges)
16. [Git Workflow](#git-workflow)

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
│   │   ├── moves.h         #   Move IDs, effects, MoveData struct
│   │   └── items.h         #   ItemPrice struct
│   └── data/               #   C data tables (source of truth)
│       ├── type_matchups.c #   Type effectiveness chart
│       ├── moves.c         #   165 move data entries
│       ├── growth_rates.c  #   6 EXP growth rate entries
│       └── item_prices.c   #   97 items + 14 floor entries
├── tools/
│   ├── c2asm.py            # ← NEW: C→ASM code generator
│   └── mapusage.py         # ← NEW: ROM/RAM space report
├── data/                   #   ASM data files (some now auto-generated)
│   ├── types/type_matchups.asm   # ← GENERATED from src/data/type_matchups.c
│   ├── moves/moves.asm           # ← GENERATED from src/data/moves.c
│   ├── growth_rates.asm          # ← GENERATED from src/data/growth_rates.c
│   ├── items/prices.asm          # ← GENERATED from src/data/item_prices.c
│   ├── pokemon/base_stats/       #   151 individual Pokémon stat files
│   └── ...
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
| Item struct header | `src/include/items.h` | ✅ Done |
| Code generator | `tools/c2asm.py` | ✅ Done |
| Makefile integration | `Makefile` (generate target) | ✅ Done |
| ROM space reporter | `tools/mapusage.py` | ✅ Done |

### Phase 2: Data Tables ✅

| Table | C Source | Generated ASM | Entries | Verified |
|-------|----------|---------------|---------|----------|
| Type effectiveness | `src/data/type_matchups.c` | `data/types/type_matchups.asm` | 82 matchups | ✅ SHA1 match |
| Move data | `src/data/moves.c` | `data/moves/moves.asm` | 165 moves | ✅ SHA1 match |
| Growth rates | `src/data/growth_rates.c` | `data/growth_rates.asm` | 6 entries | ✅ SHA1 match |
| Item prices | `src/data/item_prices.c` | `data/items/prices.asm` | 97 items + 14 floors | ✅ SHA1 match |

**Verification results (all pass):**
- `pokered.gbc` — `ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- `pokeblue.gbc` — `d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- `pokeblue_debug.gbc` — `5b1456177671b79b263c614ea0e7cc9ac542e9c4`

---

## What Needs To Be Done

### Phase 2 (remaining data tables)

| Table | File | Status |
|-------|------|--------|
| **Base stats** | `data/pokemon/base_stats.asm` | ✅ Migrated (using direct SDCC compilation) |

> **Note on Base Stats:** Unlike the other files which use `c2asm.py`, the base stats were migrated via **direct C compilation**. SDCC compiles `src/data/base_stats.c` into raw assembly at `obj/data/base_stats.asm`, which is then processed by a `sed` pipeline in the Makefile to convert SDCC syntax (`.db #0x01`, `.dw _Sym`) into RGBDS format (`db 0x01`, `dw Sym`).`

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

### Makefile generation rules

Each C data file has an explicit rule that declares its dependencies:

```makefile
# Type matchups: depends on types.h for constant resolution
data/types/type_matchups.asm: src/data/type_matchups.c src/include/types.h tools/c2asm.py
	$(C2ASM) $< > $@

# Moves: depends on both moves.h and types.h
data/moves/moves.asm: src/data/moves.c src/include/moves.h src/include/types.h tools/c2asm.py
	$(C2ASM) $< > $@

# Growth rates: no header dependencies (uses raw integers)
data/growth_rates.asm: src/data/growth_rates.c tools/c2asm.py
	$(C2ASM) $< > $@

# Item prices: depends on items.h for ItemPrice struct
data/items/prices.asm: src/data/item_prices.c src/include/items.h tools/c2asm.py
	$(C2ASM) $< > $@

# Aggregate target
generate: data/types/type_matchups.asm data/moves/moves.asm \
          data/growth_rates.asm data/items/prices.asm
	@echo "Generated ASM data files up to date."
```

The `C2ASM` variable is defined as `$(PYTHON) tools/c2asm.py` near line 116 of the Makefile.

---

## How The Code Generation Pipeline Works

### `tools/c2asm.py`

Reads a C source file containing a `const` array of structs, parses `@asm_*` comment directives, and emits RGBDS-compatible assembly.

**Usage:**
```bash
# Generate to stdout
python3 tools/c2asm.py src/data/type_matchups.c

# Generate to file (how the Makefile uses it)
python3 tools/c2asm.py src/data/type_matchups.c > data/types/type_matchups.asm

# Diff mode: compare against the original to verify byte-match
python3 tools/c2asm.py src/data/moves.c --diff data/moves/moves.asm
```

### Processing pipeline (inside c2asm.py)

1. **`resolve_includes()`** — follows `#include` directives to collect all `#define` constants
2. **`parse_c_array()`** — extracts `@asm_*` directives and parses struct array entries
3. **`build_reverse_map()`** — creates value→symbol reverse lookups for generating symbolic names
4. **`generate_asm()`** — emits assembly based on the chosen output mode

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
| `@asm_format` | Printf-style template (db mode) | `db {attacker}, {defender}, {effectiveness}` |

### How symbol resolution works

`c2asm.py` reads `#define` constants from included headers and builds a reverse map (value→symbol name). When generating assembly, numeric values in the C struct are replaced with their symbolic names.

**Special case:** The type matchups table has a collision — `NORMAL = 0x00` and `NO_EFFECT = 0x00` share the same numeric value. The `TYPE_EFFECTIVENESS_NAMES` dict (hardcoded in c2asm.py) handles this by providing explicit effectiveness name resolution.

---

## c2asm.py Output Modes

The generator has **4 distinct output modes**, selected by the `@asm_mode` directive or the presence of `@asm_macro`:

### 1. `db` mode (default)

Used for simple byte tables. Each struct entry becomes a `db` line with symbolic field names.

**Example:** `type_matchups.c`
```c
/* @asm_label TypeEffects */
/* @asm_comment  attacker,     defender,     *= */
/* @asm_terminator db -1 ; end */
```
**Output:**
```asm
TypeEffects:
	; attacker,     defender,     *=
	db WATER,        FIRE,         SUPER_EFFECTIVE
	db FIRE,         GRASS,        SUPER_EFFECTIVE
	...
	db -1 ; end
```

### 2. `macro` mode

Activated by `@asm_macro <name>`. Each entry becomes a macro invocation with auto-aligned columns. Supports `@asm_preamble` for inline MACRO definitions.

**Example:** `moves.c`
```c
/* @asm_preamble MACRO move */
/* @asm_preamble \tdb \1 ; animation */
/* @asm_preamble ... */
/* @asm_preamble ENDM */
/* @asm_macro move */
```
**Output:**
```asm
MACRO move
	db \1 ; animation (interchangeable with move id)
	...
ENDM

Moves:
; Characteristics of each move.
	table_width MOVE_LENGTH
	move POUND,        NO_ADDITIONAL_EFFECT,        40, NORMAL,       100, 35
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,        50, NORMAL,       100, 25
	...
	assert_table_length NUM_ATTACKS
```

**Column alignment:** Symbolic (text) fields are left-aligned; numeric fields are right-aligned. Column widths are computed from the widest entry in each column.

### 3. `bcd3` mode

For BCD-encoded item prices. Takes decimal integers in C, emits `bcd3 VALUE ; NAME` lines. Supports mid-table assertions via `/* --- assert_table_length ... --- */` comments in the C source.

**Example:** `item_prices.c`
```c
/* @asm_mode bcd3 */
/* @asm_label ItemPrices:: */
/* @asm_assert assert_table_length NUM_ITEMS */
/* @asm_assert2 assert_table_length NUM_ITEMS + NUM_FLOORS */

const ItemPrice item_prices[] = {
    {  1200, "ULTRA_BALL" },
    ...
    /* --- assert_table_length NUM_ITEMS --- */
    {     0, "FLOOR_B2F" },
    ...
};
```
**Output:**
```asm
ItemPrices::
	table_width 3
	bcd3 0     ; MASTER_BALL
	bcd3 1200  ; ULTRA_BALL
	...
	assert_table_length NUM_ITEMS
	bcd3 0     ; FLOOR_B2F
	...
	assert_table_length NUM_ITEMS + NUM_FLOORS
```

**Note:** The `bcd3` MACRO (defined in `macros/data.asm`) handles the actual binary-coded decimal encoding at assembly time. `c2asm.py` only needs to emit the decimal value.

### 4. `growth_rate` mode

For EXP growth rate formulas with signed magnitude encoding and `dn` nibble packing.

**Example:** `growth_rates.c`
```c
/* @asm_mode growth_rate */
/* @asm_label GrowthRateTable */
/* @asm_table_width 4 */

const GrowthRate growth_rates[] = {
    { 1, 1,   0,   0,   0, "Medium Fast" },
    { 6, 5, -15, 100, 140, "Medium Slow" },
    ...
};
```
**Output:**
```asm
MACRO growth_rate
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 < 0
		db -\3 | $80 ; signed magnitude
	else
		db \3
	endc
	db \4, \5
ENDM

GrowthRateTable:
; entries correspond to GROWTH_* (see constants/pokemon_data_constants.asm)
	table_width 4
	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	...
	assert_table_length NUM_GROWTH_RATES
```

**Note:** The MACRO definition is always emitted inline by the generator (not via `@asm_preamble`). The formula handles negative coefficients via signed magnitude encoding (`-15` → `15 | $80`).

---

## Walkthrough: Adding a New Data Module

This is a step-by-step example of how the type matchups table was migrated. Follow this pattern for future modules.

### Step 1: Identify the ASM data table

Look at the original `data/types/type_matchups.asm`:
```asm
TypeEffects:
	;       attacker,     defender,     *=
	db      WATER,        FIRE,         SUPER_EFFECTIVE
	db      FIRE,         GRASS,        SUPER_EFFECTIVE
	...
	db      -1 ; end
```

Note:
- **Label:** `TypeEffects`
- **Format:** `db` with 3 fields per row
- **Terminator:** `db -1 ; end`
- **Constants used:** Type names from `constants/type_constants.asm`, effectiveness from `constants/type_matchup_constants.asm`

### Step 2: Create the C header

Create `src/include/types.h` mirroring the ASM constants:
```c
#define NORMAL       0x00
#define FIGHTING     0x01
#define FLYING       0x02
...
#define SUPER_EFFECTIVE     20
#define NOT_VERY_EFFECTIVE   5
#define NO_EFFECT            0
```

**Rule:** Every `#define` value must exactly match its ASM counterpart (`EQU` or `const_value`).

### Step 3: Create the C data source

Create `src/data/type_matchups.c`:
```c
#include "../include/types.h"

/* @asm_label TypeEffects */
/* @asm_comment  attacker,     defender,     *= */
/* @asm_terminator db -1 ; end */

typedef struct { ... } TypeMatchup;

const TypeMatchup type_matchups[] = {
    { WATER, FIRE, SUPER_EFFECTIVE },
    ...
};
```

**Rules:**
- Use `@asm_*` directives to control the output format
- Use symbolic constants from the header, not raw numbers
- The generator will resolve symbols to ASM names automatically

### Step 4: Test the generator standalone

```bash
python3 tools/c2asm.py src/data/type_matchups.c > /tmp/test.asm
diff data/types/type_matchups.asm /tmp/test.asm
```

If the diff is non-empty, adjust the C source or directives until the output is character-identical.

### Step 5: Add Makefile rules

```makefile
data/types/type_matchups.asm: src/data/type_matchups.c src/include/types.h tools/c2asm.py
	$(C2ASM) $< > $@
```

Add the target to the `generate` prerequisites.

### Step 6: Verify byte-identical ROM

```bash
make generate && make clean && make red && make compare
```

All 5 SHA1 checks must pass.

### Step 7: Commit

```bash
git add src/data/type_matchups.c src/include/types.h Makefile
git add data/types/type_matchups.asm  # the generated file IS tracked
git commit -m "Phase 2a: Migrate type matchups to C"
```

**Important:** Generated `.asm` files are tracked in git so the repo builds without running `make generate` first.

---

## C Source File Reference

### `src/data/type_matchups.c`

| Property | Value |
|----------|-------|
| **Mode** | `db` (default) |
| **Entries** | 82 type effectiveness matchups |
| **Includes** | `types.h` |
| **Output** | `data/types/type_matchups.asm` |
| **Bank** | $0F (`"Battle Core"` via `engine/battle/core.asm`) |
| **Key directives** | `@asm_label`, `@asm_comment`, `@asm_terminator` |

### `src/data/moves.c`

| Property | Value |
|----------|-------|
| **Mode** | macro (`@asm_macro move`) |
| **Entries** | 165 moves × 6 bytes each |
| **Includes** | `moves.h`, `types.h` |
| **Output** | `data/moves/moves.asm` |
| **Bank** | $0E (`"Battle Engine 7"`) |
| **Key directives** | `@asm_preamble` (inline MACRO), `@asm_macro`, `@asm_table_width`, `@asm_assert` |

### `src/data/growth_rates.c`

| Property | Value |
|----------|-------|
| **Mode** | `growth_rate` |
| **Entries** | 6 growth rate formulas |
| **Includes** | None (raw integers + names) |
| **Output** | `data/growth_rates.asm` |
| **Bank** | bank 3 (via `main.asm`) |
| **Key directives** | `@asm_mode growth_rate`, `@asm_label`, `@asm_label_comment`, `@asm_table_width`, `@asm_assert` |

### `src/data/item_prices.c`

| Property | Value |
|----------|-------|
| **Mode** | `bcd3` |
| **Entries** | 97 items + 14 elevator floor entries |
| **Includes** | `items.h` |
| **Output** | `data/items/prices.asm` |
| **Bank** | $01 |
| **Key directives** | `@asm_mode bcd3`, `@asm_label` (with `::` global export), `@asm_assert`, `@asm_assert2` |
| **Special** | Mid-table assertion via `/* --- assert_table_length NUM_ITEMS --- */` comment |

---

## Key Files Reference

| File | What it is | When to read it |
|------|-----------|-----------------| 
| `main.asm` | Top-level includes — maps every `.asm` file to a ROM bank section | When you need to know which bank a data table lives in |
| `layout.link` | ROM/RAM bank layout for the linker | When you need to understand memory map |
| `constants/*.asm` | All game constants (types, moves, items, Pokemon IDs, etc.) | When creating new `src/include/*.h` headers |
| `data/pokemon/base_stats/bulbasaur.asm` | Example base stat struct (28 bytes) | When planning base stats migration |
| `roms.sha1` | Expected SHA1 checksums for all ROM outputs | Reference for `make compare` |
| `tools/c2asm.py` | The code generator (409 lines) | When debugging generation issues |
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

### Using `--diff` mode

```bash
# Compare generated output against an existing .asm file
python3 tools/c2asm.py src/data/moves.c --diff data/moves/moves.asm
# Output: ✅ src/data/moves.c → matches data/moves/moves.asm
# Or:     ❌ src/data/moves.c → differs from data/moves/moves.asm
#           Line 42:
#             original:  ...
#             generated: ...
```

This is useful during development to debug generation issues before running a full build.

---

## Troubleshooting

### "Error: no array found in `<file>`"

The C source file doesn't have a `const ... name[] = { ... };` array. `c2asm.py` looks for `[] =` followed by braces.

### Generated ASM has wrong symbol names

Check that the `#define` values in `src/include/*.h` exactly match the `EQU`/`const_value` constants in `constants/*.asm`. The reverse lookup maps integer→symbol, so any mismatch produces the wrong name.

### Columns are misaligned

The generator auto-computes column widths from the widest entry in each field. If you've added a new entry with a longer symbol name, all rows will re-align. This is correct — if `make compare` passes, alignment is fine.

### Mid-table assertion in wrong position (bcd3 mode)

The `/* --- assert_table_length NUM_ITEMS --- */` comment must appear between the correct entries in the C array. The generator counts `{` braces to find the insertion point.

### `make compare` fails but generated ASM looks correct

Run `make clean && make red && make compare` from scratch. Stale `.o` files can cause phantom failures.

### Negative values in growth rate mode

Negative coefficients (e.g. `-15` in Medium Slow) are handled automatically via signed magnitude encoding. Don't use `0x80 | 15` in the C source — just write `-15`.

---

## Known Challenges

### ~~Growth Rates Macro~~ ✅ SOLVED
The `growth_rate` mode in `c2asm.py` handles `dn` packing and signed magnitude encoding automatically.

### ~~BCD Encoding~~ ✅ SOLVED
The `bcd3` mode in `c2asm.py` emits `bcd3 VALUE ; COMMENT` lines directly. The `bcd3` MACRO (defined in `macros/data.asm`) handles the actual BCD encoding at assembly time.

### Base Stats INCBIN ✅ SOLVED
The problem of inline assembler macros (`INCBIN`, `dw`) in base stats was circumvented by adding `pic_dimensions`, `pic_front`, and `pic_back` pointers directly into the C struct in `src/include/pokemon.h`. Setting these values via pointers in C allows SDCC to emit standard word declarations that map cleanly to the original ASM expectation, avoiding the need for macro passthrough.

### Toolchain Migration (Phase 4+)
Switching from RGBDS to SDCC linker is a one-way gate. All remaining ASM must adopt SDCC syntax (`.area` instead of `SECTION`, `.globl` instead of `EXPORT`). This should only happen once enough engine code is in C to justify the transition.

---

## Git Workflow

### Commit conventions

Migration commits follow a phase-based naming scheme:

```
Phase 1-2: C→ASM migration pipeline + type matchups & move data
Phase 2c-d: Migrate growth rates & item prices to C
```

### What to track in git

| File type | Tracked? | Why |
|-----------|----------|-----|
| `src/data/*.c` | ✅ Yes | Source of truth for data |
| `src/include/*.h` | ✅ Yes | Shared constants |
| `data/**/*.asm` (generated) | ✅ Yes | Repo must build without `make generate` |
| `tools/c2asm.py` | ✅ Yes | The generator itself |
| `Makefile` | ✅ Yes | Build rules |
| `docs/MIGRATION_GUIDE.md` | ✅ Yes | This document |

### Typical commit workflow

```bash
# 1. Make changes to C source
vim src/data/type_matchups.c

# 2. Regenerate and verify
make generate && make clean && make red && make compare

# 3. Stage everything (C source + generated ASM + Makefile if changed)
git add src/data/ src/include/ data/ Makefile

# 4. Commit with descriptive message
git commit -m "Phase 2a: Migrate type matchups to C"

# 5. Push
git push origin main
```

---

*Last updated: 2026-03-03.*
