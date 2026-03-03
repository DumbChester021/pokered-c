#!/usr/bin/env python3
"""
c2asm.py — Generate RGBDS assembly data tables from C source files.

Parses structured C arrays and emits byte-identical .asm output that
can be assembled by RGBDS. This lets us author data in readable C
while keeping the existing RGBDS build chain intact.

Usage:
    python3 tools/c2asm.py src/data/type_matchups.c

The script reads @asm_* directives from comments in the C file to learn
how to format the output. Supported directives:

    @asm_label <LABEL>         — emitted as the first line (e.g. "TypeEffects:")
    @asm_format db {field}, ... — printf-style template for each entry
    @asm_terminator <literal>  — raw line emitted after the last entry
    @asm_comment <text>        — comment emitted before the table

The script resolves #define constants from included headers to convert
numeric values back to their symbolic names.
"""

import re
import sys
import os
from pathlib import Path


# ── Parse C #define constants ────────────────────────────────────────

def parse_defines(filepath):
    """Extract all #define NAME VALUE pairs from a header file."""
    defines = {}
    define_re = re.compile(r'^\s*#define\s+(\w+)\s+(0x[\da-fA-F]+|\d+)')
    with open(filepath) as f:
        for line in f.readlines():
            m = define_re.match(line)
            if m:
                name = m.group(1)
                value = int(m.group(2), 0)
                defines[name] = value
    return defines


def resolve_includes(c_filepath):
    """Follow #include directives relative to the C file and collect all defines."""
    all_defines = {}
    base_dir = os.path.dirname(os.path.abspath(c_filepath))
    include_re = re.compile(r'^\s*#include\s+"([^"]+)"')

    with open(c_filepath) as f:
        for line in f.readlines():
            m = include_re.match(line)
            if m:
                inc_path = os.path.normpath(os.path.join(base_dir, m.group(1)))
                if os.path.exists(inc_path):
                    all_defines.update(parse_defines(inc_path))

    return all_defines


# ── Build reverse lookup: value → symbol name ───────────────────────

def build_reverse_map(defines, category_prefixes=None):
    """
    Build value→name reverse maps, optionally separated by category.

    For type matchups we need separate maps for "type names" vs
    "effectiveness names" because NORMAL=0x00 and NO_EFFECT=0x00
    share the same numeric value.
    """
    if category_prefixes is None:
        # Single flat map
        return {v: k for k, v in defines.items()}

    maps = {}
    for prefix in category_prefixes:
        maps[prefix] = {}

    for name, value in defines.items():
        for prefix in category_prefixes:
            if name in prefix:
                maps[prefix][value] = name
                break
        else:
            # Doesn't match any prefix filter → put in all maps
            for prefix in category_prefixes:
                if value not in maps[prefix]:
                    maps[prefix][value] = name

    return maps


# ── Parse C struct array ─────────────────────────────────────────────

def parse_c_array(c_filepath, defines):
    """
    Parse a C file containing a const array of structs.
    Returns: (directives_dict, list_of_entry_dicts)

    Each entry is a list of field values (as ints or symbolic names).
    """
    directives = {}
    entries = []

    with open(c_filepath) as f:
        content = f.read()

    # Extract @asm_* directives from comments
    for m in re.finditer(r'/\*\s*@(asm_\w+)\s*(.*?)\s*\*/', content):
        key = m.group(1)
        val = m.group(2)
        if key == 'asm_preamble':
            # Accumulate preamble lines; convert \\t to real tabs
            line = val.replace('\\t', '\t')
            directives.setdefault(key, []).append(line)
        else:
            directives[key] = val
    # Special handling: asm_comment preserves exact whitespace from the raw line
    for m in re.finditer(r'/\*\s*@(asm_comment)\s(.*?)\s*\*/', content):
        directives[m.group(1)] = m.group(2)
    # asm_label_comment: preserve exact content (tab + comment)
    for m in re.finditer(r'/\*\s*@(asm_label_comment)\s(.*?)\s*\*/', content):
        directives[m.group(1)] = m.group(2)

    # Find the array body between { ... };
    # Match from the first { after '[] =' to the closing '};'
    array_match = re.search(r'\[\]\s*=\s*\{(.+?)\};', content, re.DOTALL)
    if not array_match:
        print(f"Error: no array found in {c_filepath}", file=sys.stderr)
        sys.exit(1)

    array_body = array_match.group(1)

    # Parse each { ... } entry
    entry_re = re.compile(r'\{([^}]+)\}')
    for entry_match in entry_re.finditer(array_body):
        fields_str = entry_match.group(1)
        fields = []
        # Split carefully, respecting quoted strings
        for field in re.split(r',(?=(?:[^"]*"[^"]*")*[^"]*$)', fields_str):
            field = field.strip()
            if not field:
                continue
            # Quoted string literal
            if field.startswith('"') and field.endswith('"'):
                fields.append((field, field.strip('"')))
            # Try to resolve as a define name
            elif field in defines:
                fields.append((field, defines[field]))
            else:
                # Try as literal int (including negatives)
                try:
                    val = int(field, 0)
                    fields.append((str(val), val))
                except ValueError:
                    fields.append((field, field))
        entries.append(fields)

    return directives, entries


# ── Reverse-resolve values to ASM symbol names ──────────────────────

# Type names that map value→ASM symbol (for type_matchups)
TYPE_EFFECTIVENESS_NAMES = {
    20: "SUPER_EFFECTIVE",
    15: "MORE_EFFECTIVE",
    10: "EFFECTIVE",
     5: "NOT_VERY_EFFECTIVE",
     0: "NO_EFFECT",
}


# ── Generate RGBDS assembly output ──────────────────────────────────

def generate_asm(directives, entries, defines):
    """Generate RGBDS-compatible assembly from parsed C data."""
    lines = []
    mode = directives.get('asm_mode', None)

    # ── bcd3 mode (item prices) ──────────────────────────────────────
    if mode == 'bcd3':
        label = directives.get('asm_label', 'Data')
        lines.append(f"{label}")  # label already has :: suffix

        if 'asm_table_width' in directives:
            lines.append(f"\ttable_width {directives['asm_table_width']}")

        # Find max price string width for alignment
        max_price_width = 0
        for entry in entries:
            price_str = str(entry[0][1])
            max_price_width = max(max_price_width, len(price_str))

        # First assertion position (NUM_ITEMS)
        assert1 = directives.get('asm_assert', None)
        assert2 = directives.get('asm_assert2', None)
        assert1_pos = None
        # Parse the C file to find the mid-table assertion comment
        with open(sys.argv[1]) as f:
            c_content = f.read()
        mid_assert_match = re.search(r'/\*\s*---\s*assert_table_length\s+NUM_ITEMS\s*---\s*\*/', c_content)

        # Count entries before/after mid-assertion
        if mid_assert_match:
            before_text = c_content[:mid_assert_match.start()]
            assert1_pos = before_text.count('{') - 1  # subtract the array opening brace

        for i, entry in enumerate(entries):
            price = entry[0][1]  # numeric value
            name = entry[1][1]   # string name (for comment)
            # Strip quotes from name if present
            if isinstance(name, str):
                name = name.strip('"')
            price_str = str(price)
            lines.append(f"\tbcd3 {price_str:<{max_price_width}s} ; {name}")

            # Insert mid-table assertion
            if assert1 and assert1_pos is not None and i == assert1_pos - 1:
                lines.append(f"\t{assert1}")

        if assert2:
            lines.append(f"\t{assert2}")

        return '\n'.join(lines) + '\n'

    # ── growth_rate mode ─────────────────────────────────────────────
    if mode == 'growth_rate':
        # Emit MACRO definition
        lines.append("MACRO growth_rate")
        lines.append("; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]")
        lines.append("\tdn \\1, \\2")
        lines.append("\tif \\3 < 0")
        lines.append("\t\tdb -\\3 | $80 ; signed magnitude")
        lines.append("\telse")
        lines.append("\t\tdb \\3")
        lines.append("\tendc")
        lines.append("\tdb \\4, \\5")
        lines.append("ENDM")
        lines.append("")

        label = directives.get('asm_label', 'Data')
        lines.append(f"{label}:")

        if 'asm_label_comment' in directives:
            lines.append(directives['asm_label_comment'])

        if 'asm_table_width' in directives:
            lines.append(f"\ttable_width {directives['asm_table_width']}")

        # Compute max widths for alignment (fields a-e are numeric)
        # Original format: right-aligned numbers with trailing comment
        for entry in entries:
            # entry fields: a, b, c, d, e, name(string)
            nums = []
            name = ""
            for field_name, field_val in entry:
                if isinstance(field_val, str):
                    name = field_val.strip('"')
                else:
                    nums.append(field_val)

            # Format: growth_rate a, b, ccc, ddd, eee ; Name
            # Fields c, d, e are right-aligned to width 3
            parts = []
            parts.append(str(nums[0]))
            parts.append(f" {nums[1]}")
            parts.append(f" {nums[2]:>3d}")
            parts.append(f" {nums[3]:>3d}")
            parts.append(f" {nums[4]:>3d}")
            lines.append(f"\tgrowth_rate {parts[0]},{parts[1]},{parts[2]},{parts[3]},{parts[4]} ; {name}")

        if 'asm_assert' in directives:
            lines.append(f"\t{directives['asm_assert']}")

        return '\n'.join(lines) + '\n'

    # ── Standard modes (preamble/label/macro/db) ─────────────────────

    # Preamble lines (e.g. MACRO definition)
    if 'asm_preamble' in directives:
        for line in directives['asm_preamble']:
            lines.append(line)

    # Label
    label = directives.get('asm_label', 'Data')
    lines.append(f"{label}:")

    # Label comment — directly under the label, not indented as a comment
    if 'asm_label_comment' in directives:
        lines.append(directives['asm_label_comment'])

    # Comment header (for db-style tables)
    if 'asm_comment' in directives:
        lines.append(f"\t; {directives['asm_comment']}")

    # Table width (e.g. "table_width MOVE_LENGTH")
    if 'asm_table_width' in directives:
        lines.append(f"\ttable_width {directives['asm_table_width']}")

    # Determine output mode: macro-based or db-based
    macro = directives.get('asm_macro', None)

    if macro:
        # ── Macro mode (e.g. "move POUND, NO_ADDITIONAL_EFFECT, 40, NORMAL, 100, 35")
        # Compute column widths from the data for alignment
        num_fields = max(len(e) for e in entries) if entries else 0
        col_widths = [0] * num_fields
        is_numeric = [True] * num_fields  # track if column is all-numeric
        for entry in entries:
            for i, (name, value) in enumerate(entry):
                col_widths[i] = max(col_widths[i], len(name))
                if not isinstance(value, int):
                    is_numeric[i] = False

        for entry in entries:
            field_strs = []
            for i, (name, value) in enumerate(entry):
                if i < len(entry) - 1:
                    if is_numeric[i]:
                        # Right-align numeric fields within column width
                        padded = f"{name:>{col_widths[i]}s},{'':<1s}"
                    else:
                        # Left-align symbolic fields
                        padded = f"{name + ',':<{col_widths[i] + 1}s}"
                    field_strs.append(padded)
                else:
                    if is_numeric[i]:
                        field_strs.append(f"{name:>{col_widths[i]}s}")
                    else:
                        field_strs.append(name)
            lines.append(f"\t{macro} {' '.join(field_strs)}")
    else:
        # ── db mode (e.g. "db WATER, FIRE, SUPER_EFFECTIVE")
        for entry in entries:
            field_strs = []
            for name, value in entry:
                field_strs.append(name)

            padded = []
            for i, s in enumerate(field_strs):
                if i < len(field_strs) - 1:
                    padded.append(f"{s + ',':<14s}")
                else:
                    padded.append(s)

            lines.append(f"\tdb {''.join(padded)}")

    # Table length assertion (e.g. "assert_table_length NUM_ATTACKS")
    if 'asm_assert' in directives:
        lines.append(f"\t{directives['asm_assert']}")

    # Terminator (e.g. "db -1 ; end")
    if 'asm_terminator' in directives:
        lines.append(f"\t{directives['asm_terminator']}")

    return '\n'.join(lines) + '\n'


# ── Main ─────────────────────────────────────────────────────────────

def main():
    if len(sys.argv) < 2:
        print("Usage: c2asm.py <source.c> [--diff <original.asm>]", file=sys.stderr)
        sys.exit(1)

    c_file = sys.argv[1]
    diff_file = None
    if '--diff' in sys.argv:
        diff_idx = sys.argv.index('--diff')
        if diff_idx + 1 < len(sys.argv):
            diff_file = sys.argv[diff_idx + 1]

    # Resolve #include'd defines
    defines = resolve_includes(c_file)

    # Parse the array
    directives, entries = parse_c_array(c_file, defines)

    # Generate ASM
    asm_output = generate_asm(directives, entries, defines)

    if diff_file:
        # Compare mode
        with open(diff_file) as f:
            original = f.read()
        if asm_output == original:
            print(f"✅ {c_file} → matches {diff_file}")
        else:
            print(f"❌ {c_file} → differs from {diff_file}")
            # Show first difference
            orig_lines = original.splitlines()
            gen_lines = asm_output.splitlines()
            for i, (o, g) in enumerate(zip(orig_lines, gen_lines), 1):
                if o != g:
                    print(f"  Line {i}:")
                    print(f"    original:  {o}")
                    print(f"    generated: {g}")
                    break
            sys.exit(1)
    else:
        print(asm_output, end='')


if __name__ == '__main__':
    main()
