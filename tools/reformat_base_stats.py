import re

with open('src/data/base_stats.c', 'r') as f:
    content = f.read()

# We need to change the single array `const BaseStats base_stats[] = { ... }` 
# into individual structures because `base_stats.asm` actually includes them individually:
# e.g., `INCLUDE "data/pokemon/base_stats/bulbasaur.asm"`
# So we need to generate:
# const BaseStats bulbasaur_base_stats = { ... };
# const BaseStats ivysaur_base_stats = { ... };

# Find all entries: { DEX_ID, hp, atk, def, spd, spc, type1, type2, catch, exp, "name", "Name", move1, 2, 3, 4, growth, tmhm, padding }
pattern = re.compile(r'\{\s*DEX_[A-Z_]+,\s*\d+,\s*\d+,\s*\d+,\s*\d+,\s*\d+,\s*[A-Z_]+,\s*[A-Z_]+,\s*\d+,\s*\d+,\s*"([^"]+)",\s*"[^"]+",\s*[A-Z0-9_]+,\s*[A-Z0-9_]+,\s*[A-Z0-9_]+,\s*[A-Z0-9_]+,\s*[A-Z_]+,\s*[A-Za-z0-9_]+,\s*(0x[0-9A-Fa-f]+|\d+)\s*\},?')

out_content = []

last_end = 0
match_idx = 0
for match in pattern.finditer(content):
    if match_idx == 0:
        # Before the first match, replace `const BaseStats base_stats[] = {`
        pre = content[last_end:match.start()]
        pre = re.sub(r'const BaseStats base_stats\[\] = \{', '', pre)
        out_content.append(pre)
    
    entry = match.group(0)
    name = match.group(1)
    
    # Strip the trailing comma if present
    if entry.endswith(','):
        entry = entry[:-1]
        
    out_content.append(f'const BaseStats {name}_base_stats = {entry};\n')
    last_end = match.end()
    match_idx += 1

post = content[last_end:]
post = re.sub(r'^\s*};\s*', '', post)
out_content.append(post)

with open('src/data/base_stats.c', 'w') as f:
    f.write(''.join(out_content))
