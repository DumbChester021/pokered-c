# pokered-c: Pokémon Red/Blue C Expansion Framework

This is a fork of [pret/pokered](https://github.com/pret/pokered), repurposed as a foundational, extensible C-based expansion engine. 

By integrating SDCC (Small Device C Compiler) with a dedicated Python transpiler (`tools/sdcc2rgbasm.py`), we have enabled developers to write game logic natively in C. The resulting code is seamlessly linked alongside the classic Game Boy assembler routines.

**Core Philosophy - "Expandability over Completionism":** We have adopted a purely strategic approach to this migration: **Migrate only what needs to be expanded or modified.** If a component does not benefit from being written in C for future expansions (e.g., audio, graphics tile rendering), it will remain in ASM to save time and prevent regressions.

**Note on Hashes:** Because C-compiled functions generate varying assembler instructions and segments compared to the original Game Boy cartridge, **this project does NOT prioritize a byte-identical `make compare` ROM.** This is an expansion engine designed for clean logic abstraction and maintainability (similar to `pokeemerald` by RHH).

It builds the following functional ROMs:
- pokered.gbc
- pokeblue.gbc
- pokeblue_debug.gbc

To set up the repository, see [**INSTALL.md**](INSTALL.md).
For more details on the C conversion architecture, expansion mechanics, and critical constraints (**Bank Safety** and Struct Alignment), see [**docs/MIGRATION_GUIDE.md**](docs/MIGRATION_GUIDE.md).

**Stability Warning:** When writing C logic, ALWAYS use the **Bank-Safe Bridge** (`far_call.h`) for any cross-bank function calls or data reads. Direct C pointers across banks WILL cause memory corruption.


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- [**Tools**][tools]

You can find us on [Discord (pret, #pokered)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).

[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[tools]: https://github.com/pret/gb-asm-tools
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
