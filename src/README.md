# C Source Modules (`src/`)

This directory will contain C source files as the pokered codebase is incrementally migrated from RGBDS assembly to C.

## Status: Not yet started

The migration will be done module by module, starting with self-contained data tables and progressing to engine logic.

## Toolchain

This project uses [GBDK-2020](https://github.com/gbdev/gbdk-2020) which wraps the SDCC compiler with Game Boy-specific libraries.

### Install GBDK-2020

```bash
# Download latest release from https://github.com/gbdev/gbdk-2020/releases
# Extract to /opt/gbdk/ (or set GBDK= in Makefile)
```

### Building C modules

Once C modules exist, they'll be compiled with:
```bash
make red   # Automatically compiles .c files in src/ and links with ASM objects
```

## Migration Order (planned)

1. **Data tables** — base stats, type charts, move data, item data
2. **Utility functions** — string handling, math, RNG
3. **Engine subsystems** — menu system, overworld, battle engine
4. **Core** — main loop, interrupt handlers

Each migrated module must produce a byte-identical ROM (verified via `make compare`).
