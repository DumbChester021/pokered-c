# Technical Research Report: 8-bit Limitations & 16-bit Expansion Feasibility

This report details the architectural constraints of the `pokered-c` engine regarding 8-bit data widths and the technical requirements for expanding to 16-bit (word) structures.

---

## 1. Current 8-bit Limitations: "The 255 Ceiling"

The original Pokémon Red/Blue engine is fundamentally built around 8-bit identifiers. Almost every core object is stored as a single byte (`uint8_t` in C, `db` in ASM).

### Current Object Capacities
| Category | Used | Limit | Data Structure Location |
|----------|------|-------|--------------------------|
| Pokémon  | 190  | 255   | `wPartySpecies`, `wBoxSpecies`, `BaseStats` table |
| Moves    | 165  | 255   | `wBattleMonMoves`, `Moves` table |
| Types    | 15   | 255   | `wBattleMonType`, `TypeEffects` table |
| Items    | ~96  | 255   | `wBagItems`, `ItemPrice` table |

### Why the 8-bit Limit?
1.  **Hardware Efficiency**: The Game Boy CPU (LR35902) is an 8-bit processor. Operating on 16-bit words (LD HL, BC; ADD HL, DE) is supported but significantly slower than 8-bit operations.
2.  **Memory Conservation**: 1-byte IDs save massive amounts of WRAM and ROM. Doubling an ID to 16 bits doubles the size of every party structure, PC box, and data table.
3.  **Legacy ASM Design**: Hand-optimized assembly routines often rely on the `Carry` flag from 8-bit overflows to trigger logic (e.g., damage calculation caps).

---

## 2. 16-bit Expansion: Feasibility & Difficulty

Expanding beyond 255 (the 8-bit limit) requires moving to 16-bit identifiers (`uint16_t` / `dw`).

### Difficulty Assessment
| Expansion Area | Difficulty | Primary Technical Hurdles |
|----------------|------------|---------------------------|
| **Logic (Math/Damage)**| **Low** | `pokered-c` already uses `uint16_t` and `uint32_t` for intermediate calculations in `battle_core.c`. SDCC handles the 16-bit math generation. |
| **Object IDs (Mons/Moves)**| **High** | Requires refactoring **WRAM Party Structures** and **PC Boxes**. This breaks save-game compatibility and requires updating every ASM routine that iterates through lists. |
| **Stats (Atk/Def > 255)** | **Medium**| Requires changing the `BaseStats` struct and `wBattleMon` stat fields to 2 bytes. Easier than IDs because it doesn't impact list indexing. |

---

## 3. Specific Technical Bottlenecks

### The Bank-Safe Pointer Conflict
In C, a `uint16_t*` is just an address. It does **not** know which ROM bank it points to.
- **8-bit solution**: We use `BANK(Label)` + a 16-bit address.
- **16-bit risk**: If we expand data tables, they may cross bank boundaries. A standard pointer in C cannot handle a table that starts in Bank 1 and ends in Bank 2.

### ROM0 (Home Bank) Exhaustion
The Home Bank (Bank 0) is **99.4% full**. 
- 16-bit logic produces larger assembly code.
- Frequent use of 16-bit values increases the number of `ld` and `inc` instructions, which could push the project over the limit if any of that logic needs to reside in Bank 0.

### SDCC Overhead
While SDCC supports 16-bit and 32-bit types, its code generation for these types on the Z80/GB is verbose compared to hand-written ASM. 
- **Example**: Incrementing a 16-bit variable in C might involve 4-5 ASM instructions, whereas an 8-bit increment is 1.

---

## 5. GBC-Exclusive Expansion (CGB-Only Mode)

The user inquired about the impact of converting the project to a "Strictly GBC" (CGB-only) ROM. This shift would fundamentally change the expansion landscape.

### The "WRAMX" Advantage
A standard Game Boy (DMG) has 8KB of WRAM. A Game Boy Color (CGB) has **32KB** (8 banks of 4KB). 
- **Bypassing Memory Limits**: By utilizing `WRAM1-7` (Banked WRAM), we can double or even quadruple the size of party structures and PC boxes without running out of memory. This effectively **removes the "Memory Conservation" hurdle** for 16-bit IDs.

### GBC Features vs. Expansion Hurdles
| GBC Feature | Impact on 16-bit Expansion |
|-------------|----------------------------|
| **Banked WRAM (28KB extra)** | **Critical**: Allows for 16-bit IDs in party/box structures. |
| **Double Speed CPU (8.4 MHz)**| **High**: Mitigates the processing overhead of 16-bit C math logic. |
| **VRAM Banks (16KB total)** | **Low**: Primarily helps with graphics/color, not logic IDs. |

### Does "Strictly GBC" Solve the Hurdle?
**Yes and No.**
- **Memory**: Yes. The "doubling memory usage" concern becomes irrelevant with 32KB of RAM.
- **Logic**: No. The CPU remains an 8-bit architecture. You still have to perform 16-bit operations manually (or via C).
- **Difficulty**: The "High Difficulty" of refactoring ASM accessors remains, but the *physical space* to store expanded data is no longer a bottleneck.

### Recommendation: Hybrid Expansion
If the goal is to break the 255 limit:
1.  **Switch to CGB-Only**: Enable `WRAMX` support in `layout.link`.
2.  **Move Large Tables to WRAMX**: Relocate party/box data to Bank 1 of WRAM.
3.  **Refactor with Accessor Macros**: Replace direct `ld hl, wPartySpecies` in ASM with C-wrapped or macro-based accessors to handle the 16-bit offsets.

---

## 4. GB-Native Workarounds (Staying on DMG)

The user asked if there are existing romhacks that have successfully upgraded from 8-bit to 16-bit while remaining on the original Game Boy (DMG) and what workarounds they used.

### Successful Examples
*   **Pokémon Red++ (v3)**: Successfully implemented 16-bit species IDs while maintaining DMG compatibility.
*   **Pokered-Expanded**: Implements over 400 species on the original engine.

### Common Technical Workarounds
Instead of a full, destructive 16-bit refactor of every register, these projects often use "Hybrid" strategies:

1.  **Species Aliasing (The "Gateway ID" Method)**:
    *   The game uses ID `255 ($FF)` as a sentinel. If a routine sees `$FF`, it immediately checks a "Secondary ID" byte stored elsewhere in the `PartyMon` struct.
    *   **Pros**: Doesn't break legacy ASM that expects 1-byte IDs for the original 251.
    *   **Cons**: Requires a "dual-lookup" for every expanded species.

2.  **SRAM-Banked Data Management**:
    *   Store the massive expanded species/stat tables in **SRAM** (Save RAM) instead of ROM. 
    *   Since SRAM is banked, you can store 32KB+ of extra data and swap the active bank to read stats for a specific mon.
    *   This keeps the core ROM banks from overflowing.

3.  **High-Bit Multiplexing**:
    *   Using bits 6-7 of an ID as a "List Selector" (e.g., `00`=Johto, `01`=Hoenn).
    *   This effectively expands the 8-bit space to 1024 without changing the variable width, but requires bitmasking logic in every accessor.

4.  **C-Based Refactoring (Our Advantage)**:
    *   In `pokered-c`, we have a massive advantage over purely ASM hacks. We can redefine `uint8_t species` as `uint16_t` in a C header, and the compiler will automatically fix the logic in all migrated `.c` files.
    *   We only need to manually update the "Bridge" routines that interface with legacy ASM.

### Recommendation: "The Gateway Method"
If we want to avoid the "use Pokegold" outcome, the best path is:
*   Keep the internal ID as `uint8_t` for the "Active" mon in battle.
*   Use a 16-bit "True ID" in the `PartyMon` struct (using unused padding bytes).
*   Update the `BaseStats` lookup to use the 16-bit True ID.

---

## 5. Modern Efficiency & Optimization (DMG-Compatible)

The user requested research into modern techniques to optimize the engine for expansion while remaining on original Game Boy (DMG) hardware.

### Struct Byte-by-Byte Analysis
| Struct | Size (Bytes) | Fields (All 8-bit unless noted) | Potential Savings |
|--------|--------------|--------------------------------|-------------------|
| `PartyMon` | 44 | Species, HP(2), Level, Status, Types(2), CatchRate, Moves(4), OTID(2), Exp(3), StatsEXP(10), DVs(2), PP(4), Stats(10) | **CatchRate** is often redundant in party. **Status** bitfield has 2-3 unused bits. |
| `BoxMon` | 33 | Species, HP(2), BoxLevel, Status, Types(2), CatchRate, Moves(4), OTID(2), Exp(3), StatsEXP(10), DVs(2), PP(4) | Same as above. |
| `MoveData` | 6 | Animation, Effect, Power, Type, Accuracy, PP | Tightly packed. No easy room here. |
| `Item` | 2 | ID, Quantity | Minimal. |

### Proposed "Modern" Optimizations
1.  **SRAM-Backed Party Expansion**:
    *   Instead of keeping all 6 party members in WRAM, we can swap them into a bank of **SRAM (Save RAM)**. Standard cartridges have 32KB of SRAM (4 banks of 8KB).
    *   This allows for massive expansion of the Pokémon structure (e.g., adding Abilities, Natures, held items) without hitting the 8KB WRAM limit.

2.  **Bit-Packing Species/Types**:
    *   Since there are only ~15 standard types, we could pack `Type1` and `Type2` into a single `uint8_t` (4 bits each, allowing 16 types).
    *   Saving 1 byte per mon across 6 party members and 20 box mons frees up 26 bytes—enough for several new 16-bit pointers.

3.  **Modern Compression (LZSS/Huffman)**:
    *   The project already uses `pkmncompress` (RLE-based) for graphics.
    *   **Text Huffman Coding**: Implementing Huffman coding for dialogue could save 20-30% of ROM space in the text banks, leaving more room for code expansion in Bank 0 and Bank 1.

4.  **SDCC Toolchain Optimization**:
    *   Current `SDCC_CFLAGS` do not use optimization levels. Adding `--opt-code-speed` or `--max-allocs-per-node 5000` could significantly reduce the cycle count of C-migrated damage/stat logic, offsetting the 16-bit overhead.

### Strategic Recommendation: "The SRAM Pivot"
To achieve a "16-bit feel" on 8-bit hardware, we should:
*   Use **Species Aliasing** for the battle engine (compatibility).
*   Use **SRAM Banking** for persistent data (expansion).
*   Use **C-Inline Macros** for bit-packed types to maintain readable code.

---
*Updated on 2026-03-04*

### Recommendation 1: The "Sweet Spot" (Goal: 255)
Maximize the existing 8-bit space first. There is still room for **65 more Pokémon** and **90 more moves** without changing a single WRAM structure. This is the lowest-risk, highest-reward path.

### Recommendation 2: "Bit-Packing" for Types
Instead of expanding Type IDs to 16-bit, we can use bit-packing or high-bit flags (e.g., bit 7 = Special move) to expand functionality without increasing the data width.

### Recommendation 3: Targeted 16-bit Refactoring
If a "Gen 2" style expansion (251+ Mons) is required:
1.  **Migrate Accessors First**: Write C wrappers for all WRAM data access before changing the underlying types.
2.  **Segmented Expansion**: Only expand Pokémon IDs to 16-bit; keep Items and Moves 8-bit to save space.

---
*Prepared by Antigravity Expansion Research Division*
