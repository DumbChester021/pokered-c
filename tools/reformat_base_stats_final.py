import re
import os

tmhm_map = {
    "MEGA_PUNCH": 1, "RAZOR_WIND": 2, "SWORDS_DANCE": 3, "WHIRLWIND": 4, "MEGA_KICK": 5, "TOXIC": 6, "HORN_DRILL": 7, "BODY_SLAM": 8, "TAKE_DOWN": 9, "DOUBLE_EDGE": 10,
    "BUBBLEBEAM": 11, "WATER_GUN": 12, "ICE_BEAM": 13, "BLIZZARD": 14, "HYPER_BEAM": 15, "PAY_DAY": 16, "SUBMISSION": 17, "COUNTER": 18, "SEISMIC_TOSS": 19, "RAGE": 20,
    "MEGA_DRAIN": 21, "SOLARBEAM": 22, "DRAGON_RAGE": 23, "THUNDERBOLT": 24, "THUNDER": 25, "EARTHQUAKE": 26, "FISSURE": 27, "DIG": 28, "PSYCHIC_M": 29, "TELEPORT": 30,
    "MIMIC": 31, "DOUBLE_TEAM": 32, "REFLECT": 33, "BIDE": 34, "METRONOME": 35, "SELFDESTRUCT": 36, "EGG_BOMB": 37, "FIRE_BLAST": 38, "SWIFT": 39, "SKULL_BASH": 40,
    "SOFTBOILED": 41, "DREAM_EATER": 42, "SKY_ATTACK": 43, "REST": 44, "THUNDER_WAVE": 45, "PSYWAVE": 46, "EXPLOSION": 47, "ROCK_SLIDE": 48, "TRI_ATTACK": 49, "SUBSTITUTE": 50,
    "CUT": 51, "FLY": 52, "SURF": 53, "STRENGTH": 54, "FLASH": 55
}

def get_tmhm_bytes(moves):
    tm_bytes = [0] * 7
    if not moves or moves[0] == "NULL": return tm_bytes
    for move in moves:
        if move == "NULL": continue
        move = move.strip('" ')
        if move in tmhm_map:
            idx = tmhm_map[move] - 1
            byte_idx = idx // 8
            bit_idx = idx % 8
            tm_bytes[byte_idx] |= (1 << bit_idx)
    return tm_bytes

with open("src/data/base_stats.c", "r") as f:
    text = f.read()

# Build dictionary of TMHM macros
tmhm_arrays = {}
tmhm_pattern = re.compile(r'static const char \*([a-z0-9_]+)_tmhm\[\] = \{([^}]+)\};')
for match in tmhm_pattern.finditer(text):
    name = match.group(1)
    moves = [m.strip(' \n\t') for m in match.group(2).split(',')]
    moves = [m for m in moves if m]
    tmhm_arrays[name] = get_tmhm_bytes(moves)

# Remove the tmhm definitions from source
text = tmhm_pattern.sub('', text)

# Extract structs
pattern = re.compile(r'\{\s*(DEX_[A-Z0-9_]+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\d+),\s*([A-Z_]+),\s*([A-Z_]+),\s*(\d+),\s*(\d+),\s*"([^"]+)",\s*"([^"]+)",\s*([A-Z0-9_]+),\s*([A-Z0-9_]+),\s*([A-Z0-9_]+),\s*([A-Z0-9_]+),\s*([A-Z_]+),\s*([a-z0-9_]+)_tmhm,\s*(0x[0-9A-Fa-f]+|\d+)\s*\}')

externs = []
entries = []
mew_entry = None

for match in pattern.finditer(text):
    dex_macro, hp, atk, def_, spd, spc, type1, type2, catch, exp = match.groups()[:10]
    name_low = match.group(11)
    name_cap = match.group(12)
    m1, m2, m3, m4, growth = match.groups()[12:17]
    name_tmhm = match.group(18)
    padding = match.group(19)

    pic_name = "mr.mime" if name_low == "mrmime" else name_low
    pic_path = f"gfx/pokemon/front/{pic_name}.pic"
    pic_dim = 0x55
    if os.path.exists(pic_path):
        with open(pic_path, "rb") as f:
            pic_dim = f.read(1)[0]
    
    tmhm_bytes = tmhm_arrays.get(name_tmhm, [0]*7)
    tmhm_str = "{ " + ", ".join(f"0x{b:02X}" for b in tmhm_bytes) + " }"

    externs.append(f"extern const void {name_cap}PicFront;")
    externs.append(f"extern const void {name_cap}PicBack;")

    s = f"    {{ {dex_macro}, {hp}, {atk}, {def_}, {spd}, {spc}, {type1}, {type2}, {catch}, {exp}, 0x{pic_dim:02X}, &{name_cap}PicFront, &{name_cap}PicBack, {m1}, {m2}, {m3}, {m4}, {growth}, {tmhm_str}, {padding} }}"
    
    if name_low == "mew":
        mew_entry = s
    else:
        entries.append(s)

out_text = []
out_text.append("/*\n * base_stats.c — Pokémon base stat data for all 151 Pokémon\n */\n\n")
out_text.append("#include \"../include/pokemon.h\"\n#include \"../include/types.h\"\n#include \"../include/moves.h\"\n\n")

out_text.append("\n".join(externs) + "\n\n")

out_text.append("const BaseStats base_stats[] = {\n")
out_text.append(",\n".join(entries))
out_text.append("\n};\n\n")

with open("src/data/base_stats.c", "w") as f:
    f.write("".join(out_text))

if mew_entry:
    mew_text = []
    mew_text.append("/*\n * mew_base_stats.c — Mew base stats\n */\n\n")
    mew_text.append("#include \"../include/pokemon.h\"\n#include \"../include/types.h\"\n#include \"../include/moves.h\"\n\n")
    mew_text.append("extern const void MewPicFront;\nextern const void MewPicBack;\n\n")
    mew_text.append(f"const BaseStats mew_base_stats = {mew_entry};\n")
    with open("src/data/mew_base_stats.c", "w") as f:
        f.write("".join(mew_text))
