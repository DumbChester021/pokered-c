# Architecture Research Report: Expansion & Migration Strategy

## Executive Summary
This document provides a deep technical audit of the `pokered-c` architecture. It identifies the critical constraints imposed by the Game Boy hardware (Banked Memory, 8-bit registers) and the technical hurdles of the C migration (Compiler overhead, Struct alignment). Most importantly, it outlines the **Bank-Safe Bridge** solution and a **Logic-Matching Verification** strategy to ensure the "Maximum Capacity" expansion goals are met with 100% stability.

---

## 1. Memory Banking & The "Bank Safety" Core
The 8-bit Game Boy (LR35902) uses a 16-bit address space ($0000-$FFFF). To access more than 32KB of ROM, it uses **Memory Bank Controllers (MBCs)**.

### The Problem: Pointer Blindness
In the `pokered-c` framework, C code is compiled by SDCC into "floating" `ROMX` sections. 
- **Constraint**: A pointer in C is 16 bits. It does not carry "Bank Information".
- **Crash Scenario**: If a function in Bank $15 tries to read an array in Bank $0C using a standard pointer, it will instead read whatever data is at that address in Bank $15. This results in **memory corruption**, **logic glitches**, or **instant crashes**.

### The Solution: The Bank-Safe Bridge (`far_call.h`)
We have implemented a software bridge that leverages the existing stable `Bankswitch` routine in `home/bankswitch.asm`.
- **`FarCall(bank, func)`**: A `__naked` wrapper that saves the current bank, switches to the target, executes the function, and restores the original bank.
- **`BankReadByte(bank, addr)`**: A utility to read a single byte across banks safely.
- **Transpiler Support**: `sdcc2rgbasm.py` has been upgraded to support the `BANK()` operator mapping, allowing C to resolve the home-bank locations of distant symbols.

---

## 2. Expansion Limits (8-bit Bottlenecks)
The original engine was designed for 151 Pokémon and a limited set of moves. Almost all object IDs are 1-byte (`db`).

### Object ID Capacity
| Category | Current | Hard 8-bit Limit | Expansion Difficulty |
|----------|---------|------------------|----------------------|
| Pokémon  | 190 used| 255              | **Low**: Updates to `BaseStats`, `Cries`, etc. |
| Moves    | 165 used| 255              | **Low**: Mostly table expansion. |
| Types    | 15 used | 255              | **Medium**: Requires P/S Split logic. |
| Items    | ~96 used| 255              | **Low**: Table expansion. |

### The "Maximum Capacity" Path
- **Limit 255**: This is the "Sweet Spot". We can expand the game to 255 Pokémon and 255 Moves with minimal architectural changes by just filling the remaining 8-bit ID space.
- **Beyond 255**: This requires **"16-bit Refactoring"**. We would need to change IDs to `dw`, which impacts WRAM party structures, PC boxes, and almost every battle routine. 
- **Recommendation**: Exhaust the 255 ID space first. 16-bit refactored expansions should be considered "Phase 12" level complexity.

---

## 3. Data Structure Integrity
The "Migration Goal" is not byte-matching, but **Logic-Matching**. 

### Struct Alignment
C structs must be byte-perfect matches for their ASM counterparts.
- **Example**: `MoveData` must be exactly 6 bytes.
- **Critical Risk**: SDCC may add padding. Always use `uint8_t` and avoid bitfields unless strictly verified.

### Logic-Matching Verification
To ensure a migration is perfect, we utilize **Dual-Execution Testing**:
1. Execute the original ASM routine with a controlled input.
2. Capture all mutated state (Registers, WRAM).
3. Execute the C implementation with the SAME input.
4. Verify that the mutated state of C matches ASM exactly.

---

## 4. Current Bottlenecks & Recommendations
1. **ROM0 (Home Bank) Space**: Bank 0 is at 99.4% capacity. No more C code or ASM should be added here.
2. **C Overhead**: SDCC code is larger than ASM. Use C for complex logic (Battle, AI) and keep hot loops/utilities (VBlank, Audio) in ASM.
3. **P/S Split**: This is the most impactful technical upgrade. Implementing it in C will decouple Type IDs from move categories, freeing up Type ID space for new types (Fairy, Steel, etc.).

---
*Documented by Antigravity on 2026-03-04*
