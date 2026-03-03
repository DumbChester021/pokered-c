import re

with open('src/data/base_stats.c', 'r') as f:
    content = f.read()

# Replace individual declarations back to array
pattern = re.compile(r'const BaseStats ([a-z0-9]+)_base_stats = \{([^}]+)\};')

out_content = []
last_end = 0
match_idx = 0

mew_entry = None

for match in pattern.finditer(content):
    if match_idx == 0:
        pre = content[last_end:match.start()]
        out_content.append(pre)
        out_content.append("const BaseStats base_stats[] = {\n")
    
    name = match.group(1)
    entry_body = match.group(2)
    
    if name == 'mew':
        mew_entry = f"    {{ {entry_body} }}"
    else:
        out_content.append(f"    {{ {entry_body} }},\n")
        
    last_end = match.end()
    match_idx += 1

out_content.append("};\n\n")

if mew_entry:
    out_content.append("const BaseStats mew_base_stats = ")
    out_content.append(mew_entry)
    out_content.append(";\n")

out_content.append(content[last_end:])

with open('src/data/base_stats.c', 'w') as f:
    f.write(''.join(out_content))
