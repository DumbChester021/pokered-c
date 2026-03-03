import re
import sys

# Mapping moves to their TM/HM numbers from constants/item_constants.asm
tmhm_map = {
    "MEGA_PUNCH": 1, "RAZOR_WIND": 2, "SWORDS_DANCE": 3, "WHIRLWIND": 4, "MEGA_KICK": 5, "TOXIC": 6, "HORN_DRILL": 7, "BODY_SLAM": 8, "TAKE_DOWN": 9, "DOUBLE_EDGE": 10,
    "BUBBLEBEAM": 11, "WATER_GUN": 12, "ICE_BEAM": 13, "BLIZZARD": 14, "HYPER_BEAM": 15, "PAY_DAY": 16, "SUBMISSION": 17, "COUNTER": 18, "SEISMIC_TOSS": 19, "RAGE": 20,
    "MEGA_DRAIN": 21, "SOLARBEAM": 22, "DRAGON_RAGE": 23, "THUNDERBOLT": 24, "THUNDER": 25, "EARTHQUAKE": 26, "FISSURE": 27, "DIG": 28, "PSYCHIC_M": 29, "TELEPORT": 30,
    "MIMIC": 31, "DOUBLE_TEAM": 32, "REFLECT": 33, "BIDE": 34, "METRONOME": 35, "SELFDESTRUCT": 36, "EGG_BOMB": 37, "FIRE_BLAST": 38, "SWIFT": 39, "SKULL_BASH": 40,
    "SOFTBOILED": 41, "DREAM_EATER": 42, "SKY_ATTACK": 43, "REST": 44, "THUNDER_WAVE": 45, "PSYWAVE": 46, "EXPLOSION": 47, "ROCK_SLIDE": 48, "TRI_ATTACK": 49, "SUBSTITUTE": 50,
    "CUT": 51, "FLY": 52, "SURF": 53, "STRENGTH": 54, "FLASH": 55
}

def get_tmhm_bytes(moves):
    tm_bytes = [0] * 7 # 55 TM/HMs fit into 7 bytes
    if not moves or moves[0] == "NULL":
        return tm_bytes
        
    for move in moves:
        if move == "NULL":
            continue
        move = move.strip('" ')
        if move in tmhm_map:
            idx = tmhm_map[move] - 1
            byte_idx = idx // 8
            bit_idx = idx % 8
            tm_bytes[byte_idx] |= (1 << bit_idx)
            
    return tm_bytes

with open('src/data/base_stats.c', 'r') as f:
    content = f.read()

# Replace tmhm arrays with macro expansion equivalents
# `static const char *bulbasaur_tmhm[] = { ... };` -> deleted
# And in the BaseStats struct, replace `bulbasaur_tmhm` with `{ 0x11, 0x22, ... }`
# To do this, we just map out all the arrays first.

arrays = {}
pattern = re.compile(r'static const char \*([a-z0-9]+)_tmhm\[\] = \{([^}]+)\};')

for match in pattern.finditer(content):
    name = match.group(1)
    moves_str = match.group(2)
    moves = [m.strip(' \n\t') for m in moves_str.split(',')]
    moves = [m for m in moves if m]
    bytes_arr = get_tmhm_bytes(moves)
    arrays[name + '_tmhm'] = '{ ' + ', '.join([f'0x{b:02X}' for b in bytes_arr]) + ' }'

# Remove all static const char arrays
content = pattern.sub('', content)

# Replace references in the struct
for name, bytes_str in arrays.items():
    content = re.sub(r'(?<![a-zA-Z0-9_])' + name + r'(?![a-zA-Z0-9_])', bytes_str, content)

with open('src/data/base_stats.c', 'w') as f:
    f.write(content)

