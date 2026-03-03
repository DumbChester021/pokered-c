import re
import sys

with open('src/include/pokemon.h', 'r') as f:
    header = f.read()

# find all DEX macros: #define DEX_BULBASAUR 1
pattern = re.compile(r'#define\s+DEX_([A-Z0-9_]+)\s+(\d+)')
dex_entries = []
for match in pattern.finditer(header):
    name = match.group(1).lower().replace('_', '')
    if name == 'nidoranm':
        name = 'nidoran_m'
    elif name == 'nidoranf':
        name = 'nidoran_f'
    dex_id = int(match.group(2))
    dex_entries.append((dex_id, name))

# Sort by dex ID ascending
dex_entries.sort(key=lambda x: x[0])

# Mew is excluded from the normal table, it's index 151
entries_except_mew = [e for e in dex_entries if e[0] < 151]

lines = [
    'INCLUDE "src/asm/macros.asm"',
    '',
    'SECTION "Base Data", ROMX',
    '',
    'BaseStats::',
    '\ttable_width BASE_DATA_SIZE, BaseStats'
]

# We need the base_stats array block to be included here, but SDCC outputs labels for every struct. We just need to pull the first one.
for dex_id, name in entries_except_mew:
    lines.append(f'\tINCBIN "obj/data/base_stats.asm", 50, 20')  # Just a mock because we will use the actual asm directly. Wait, rgbds can't extract variables.

# Actually, the best way:
# Let's compile src/data/base_stats.c -> obj/data/base_stats.asm
# Then include this .asm file from main.asm but modify main.asm to point its `BaseStats` table to `_bulbasaur_base_stats` instead of importing an external table.

