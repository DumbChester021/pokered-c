#!/usr/bin/env python3
"""
sdcc2rgbasm.py

Translates SDCC (ASZ80) assembly output into RGBDS-compatible syntax.
This allows C functions compiled by SDCC to be linked by RGBDS (`rgblink`).

Usage:
    python3 sdcc2rgbasm.py <input.asm> > <output.asm>
"""

import sys
import re

def process_file(input_path):
    with open(input_path, 'r') as f:
        lines = f.readlines()

    out_lines = []
    
    # Track the current section to know when we are in _CODE or _DATA
    current_area = None

    section_counter = 0

    for line in lines:
        stripped = line.strip()
        
        # Skip SDCC module directives
        if stripped.startswith('.module') or stripped.startswith('.optsdcc') or stripped.startswith('.globl'):
            continue
            
        # Section changes
        if stripped.startswith('.area'):
            parts = stripped.split()
            area_name = parts[1]
            section_counter += 1
            if area_name == '_CODE':
                out_lines.append('SECTION "C Code %s %d", ROMX\n' % (input_path, section_counter))
            elif area_name == '_DATA' or area_name == '_INITIALIZED':
                out_lines.append('SECTION "C Data %s %d", WRAM0\n' % (input_path, section_counter))
            elif area_name == '_BSEG' or area_name == '_DABS':
                pass # Ignore these for now
            current_area = area_name
            continue
            
        # SDCC: _function:: or _function:
        # RGBDS: function::
        label_match = re.match(r'^_([a-zA-Z0-9_]+)(:|\:\:)', line)
        if label_match:
            name = label_match.group(1)
            
            # Map specific struct names to match game's expected labels
            if name == "base_stats":
                name = "BaseStats"
            elif name == "mew_base_stats":
                name = "MewBaseStats"

            # Always export mapped symbols globally for the linker
            out_lines.append(f'{name}::\n')
            continue
            
        # Local labels
        # SDCC: 00101$:
        # RGBDS: .L00101:
        local_label_match = re.match(r'^([0-9]+)\$?:', line)
        if local_label_match:
            out_lines.append(f'.L{local_label_match.group(1)}:\n')
            continue

        # Data definitions
        # SDCC: .db #0x01
        # RGBDS: db $01
        line = re.sub(r'^\s*\.([a-z]+)', r'\1', line) # Strip leading dot from directives
        line = re.sub(r'db\s+#0x([0-9a-fA-F]+)', r'db $\1', line)
        # SDCC: .dw #0x0102
        # RGBDS: dw $0102
        line = re.sub(r'\.dw\s+#0x([0-9a-fA-F]+)', r'dw $\1', line)
        line = re.sub(r'\.dw\s+_([a-zA-Z0-9_]+)', r'dw \1', line) # Symbol ref
        
        # Instructions
        # SDCC uses instructions like: ld a, #0x00
        # RGBDS needs: ld a, $00
        line = re.sub(r'#0x([0-9a-fA-F]+)', r'$\1', line)
        
        # SDCC local jumps: jr 00101$
        # RGBDS: jr .L00101
        line = re.sub(r'([0-9]+)\$', r'.L\1', line)
        
        # SDCC ldhl sp, #NN
        # SDCC often uses `ldhl sp, #NN` to set HL to `SP + NN`.
        # RGBDS syntax relies heavily on `add hl, bc` or `ld hl, sp+NN`.
        # But wait, looking at the error:
        # error: syntax error, unexpected hl at obj/engine/math.asm: `ld hl, sp+8` and then `ld a, (hl+)`
        # Actually `ld a, (hl+)` is valid in rgbds as `ld a, [hli]`. Wait!
        # Ah! The RGBDS array dereference syntax is brackets `[hl]` not `(hl)`!
        # `ld a, (hl)` is ASZ80 SDCC syntax. RGBDS expects `ld a, [hl]`.
        # Let's fix parentheses to brackets for all memory addresses.
        line = re.sub(r'ldhl\s+sp,\s*#([0-9]+)', r'ld hl, sp+\1', line)
        line = re.sub(r'ldhl\s+sp,\s*\$([0-9a-fA-F]+)', r'ld hl, sp+$\1', line)
        
        # SDCC uses (hl) (bc) (de) etc. RGBDS expects [hl] [bc] [de]
        # Also handles (hl+), (hl-), etc -> [hli], [hld]
        line = re.sub(r'\(([hH][lL]\+)\)', r'[hli]', line)
        line = re.sub(r'\(([hH][lL]\-)\)', r'[hld]', line)
        # Handle simple register pointers: (hl) -> [hl]
        line = re.sub(r'\(([A-Za-z0-9_]+)\)', r'[\1]', line)
        
        # SDCC immediate memory references: (#label) -> [label] and (#label + offset)
        # It also does `(#(label + N))` or `(#(label + N) + offset)`
        # The easiest approach is to iteratively strip `#` from inside pointer lookups.
        line = re.sub(r'\(\#([A-Za-z0-9_]+)\)', r'[\1]', line)
        
        # For `(#(label + 1))` -> `[label + 1]`
        line = re.sub(r'\(\#\(([A-Za-z0-9_]+\s*\+\s*[0-9]+)\)\)', r'[\1]', line)
        
        # For `(#(label + 1) + 0)` -> `[label + 1 + 0]`
        line = re.sub(r'\(\#\(([A-Za-z0-9_]+\s*\+\s*[0-9]+)\)\s*\+\s*([0-9]+)\)', r'[\1 + \2]', line)

        # For `(#label + 0)` -> `[label + 0]`
        line = re.sub(r'\(\#([A-Za-z0-9_]+)\s*\+\s*([0-9]+)\)', r'[\1 + \2]', line)

        # For `#(label + 1)` outside of memory dereference, e.g. `ld hl, #(hMultiplyBuffer + 1)`
        line = re.sub(r'\#\(([A-Za-z0-9_]+\s*\+\s*[0-9]+)\)', r'\1', line)

        # SDCC negative numbers: #-3 -> -3
        line = re.sub(r'\#\-([0-9]+)', r'-\1', line)
        
        # SDCC basic positive numbers: #3 -> 3
        line = re.sub(r'\#([0-9]+)', r'\1', line)
        
        # SDCC function calls: call _func
        # RGBDS: call func
        
        # Handle BANK operator mapping before general symbol scrubbing
        # Matches: _BANK_Symbol, #_BANK_Symbol, etc.
        # SDCC: ld a, #_BANK_Symbol -> RGBDS: ld a, BANK(Symbol)
        line = re.sub(r'#?_BANK_([a-zA-Z0-9_]*)', r'BANK(\1)', line)
        
        # General symbol scrubbing (remove leading underscores)
        line = re.sub(r'(_)([a-zA-Z_][a-zA-Z0-9_]*)', r"\2", line)
        
        # SDCC `jp (hl)` becomes `jp [hl]` from previous regex, but RGBDS expects `jp hl`!
        line = re.sub(r'^\s*jp\s+\[hl\]', '\tjp hl', line)

        out_lines.append(line)

    for line in out_lines:
        sys.stdout.write(line)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: {} <input.asm>".format(sys.argv[0]))
        sys.exit(1)
    process_file(sys.argv[1])
