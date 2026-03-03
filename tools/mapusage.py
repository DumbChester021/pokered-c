#!/usr/bin/env python3
"""
mapusage.py - ROM/RAM space usage report for RGBDS .map files

Parses the SUMMARY and per-bank sections from an RGBDS map file and
prints a colored terminal report showing fill percentages and visual bars.

Usage:
    python3 tools/mapusage.py pokered.map [pokeblue.map ...]

Inspired by RHH pokeemerald-expansion's build space reporting.
"""

import sys
import re
import os

# ── Terminal colors ──────────────────────────────────────────────────────

class Color:
    RESET   = "\033[0m"
    BOLD    = "\033[1m"
    DIM     = "\033[2m"
    RED     = "\033[31m"
    GREEN   = "\033[32m"
    YELLOW  = "\033[33m"
    BLUE    = "\033[34m"
    MAGENTA = "\033[35m"
    CYAN    = "\033[36m"
    WHITE   = "\033[37m"
    BG_RED  = "\033[41m"

    @staticmethod
    def disable():
        for attr in dir(Color):
            if attr.isupper() and not attr.startswith("_"):
                setattr(Color, attr, "")

# Disable colors if not a TTY
if not sys.stdout.isatty():
    Color.disable()

# ── Bank size constants ──────────────────────────────────────────────────

BANK_SIZES = {
    "ROM0":  0x4000,  # 16 KiB
    "ROMX":  0x4000,  # 16 KiB per bank
    "SRAM":  0x2000,  #  8 KiB per bank
    "WRAM0": 0x2000,  #  8 KiB
    "WRAMX": 0x1000,  #  4 KiB per bank (CGB only)
    "VRAM":  0x2000,  #  8 KiB per bank
    "HRAM":  0x007F,  # 127 bytes
}

BAR_WIDTH = 30

# ── Parsing ──────────────────────────────────────────────────────────────

def parse_map_file(path):
    """
    Parse an RGBDS .map file.

    Returns:
        summary: dict from SUMMARY section, e.g. {"ROM0": "16228 bytes used / 156 free", ...}
        banks: list of (mem_type, bank_number, total_empty_bytes, section_names)
    """
    with open(path) as f:
        content = f.read()

    # Parse SUMMARY block
    summary = {}
    summary_match = re.search(r"SUMMARY:\n((?:\t.+\n)+)", content)
    if summary_match:
        for line in summary_match.group(1).strip().split("\n"):
            line = line.strip()
            m = re.match(r"(\w+):\s+(.+)", line)
            if m:
                summary[m.group(1)] = m.group(2)

    # Parse per-bank data
    bank_re = re.compile(r"^(\w+)\s+bank\s+#(\d+):", re.MULTILINE)
    total_empty_re = re.compile(r"TOTAL EMPTY:\s+\$([0-9A-Fa-f]+)\s+bytes?")
    section_re = re.compile(r'SECTION:.*\["(.+?)"\]')

    banks = []
    for match in bank_re.finditer(content):
        mem_type = match.group(1)
        bank_num = int(match.group(2))

        # Find the next bank header or end of file to delimit this bank's content
        start = match.end()
        next_bank = bank_re.search(content, start)
        end = next_bank.start() if next_bank else len(content)
        block = content[start:end]

        # Get total empty
        empty_match = total_empty_re.search(block)
        total_empty = int(empty_match.group(1), 16) if empty_match else 0

        # Get section names
        sections = section_re.findall(block)

        banks.append((mem_type, bank_num, total_empty, sections))

    return summary, banks

# ── Display helpers ──────────────────────────────────────────────────────

def fill_color(pct):
    """Return color code based on fill percentage."""
    if pct >= 95:
        return Color.RED + Color.BOLD
    elif pct >= 90:
        return Color.RED
    elif pct >= 75:
        return Color.YELLOW
    elif pct >= 50:
        return Color.GREEN
    else:
        return Color.CYAN

def make_bar(pct, width=BAR_WIDTH):
    """Create a visual progress bar."""
    filled = int(pct / 100 * width)
    empty = width - filled
    c = fill_color(pct)
    bar = c + "█" * filled + Color.DIM + "░" * empty + Color.RESET
    return f"│{bar}│"

def fmt_bytes(n):
    """Format byte count with KiB if large enough."""
    if n >= 1024:
        return f"{n:,}B ({n/1024:.1f}K)"
    return f"{n:,}B"

# ── Report generation ────────────────────────────────────────────────────

def print_report(map_path):
    """Print the full usage report for a single .map file."""
    rom_name = os.path.splitext(os.path.basename(map_path))[0]
    summary, banks = parse_map_file(map_path)

    # Header
    print()
    print(f"{Color.BOLD}{Color.CYAN}{'═' * 72}{Color.RESET}")
    print(f"{Color.BOLD}{Color.CYAN}  ROM/RAM USAGE REPORT: {rom_name}{Color.RESET}")
    print(f"{Color.BOLD}{Color.CYAN}{'═' * 72}{Color.RESET}")
    print()

    # Summary section
    if summary:
        print(f"  {Color.BOLD}SUMMARY{Color.RESET}")
        print(f"  {'─' * 68}")
        for mem, info in summary.items():
            # Parse "XXXXX bytes used / YYY free [in N banks]"
            m = re.match(r"(\d+) bytes used / (\d+) free(?:\s+in (\d+) banks?)?", info)
            if m:
                used = int(m.group(1))
                free = int(m.group(2))
                total = used + free
                pct = (used / total * 100) if total > 0 else 0
                bar = make_bar(pct, 20)
                c = fill_color(pct)
                bank_info = f" ({m.group(3)} banks)" if m.group(3) else ""
                print(f"  {Color.BOLD}{mem:6s}{Color.RESET} {bar} {c}{pct:5.1f}%{Color.RESET} "
                      f"  {fmt_bytes(used):>12s} / {fmt_bytes(total):<12s}{bank_info}")
        print()

    # Separate banks by memory type
    mem_types_order = ["ROM0", "ROMX", "SRAM", "WRAM0", "WRAMX", "VRAM", "HRAM"]
    grouped = {}
    for mem_type, bank_num, total_empty, sections in banks:
        grouped.setdefault(mem_type, []).append((bank_num, total_empty, sections))

    for mem_type in mem_types_order:
        if mem_type not in grouped:
            continue

        bank_list = grouped[mem_type]
        bank_size = BANK_SIZES.get(mem_type, 0x4000)

        # Section header
        type_color = Color.MAGENTA if "ROM" in mem_type else Color.BLUE
        print(f"  {Color.BOLD}{type_color}{mem_type} Banks{Color.RESET}")
        print(f"  {'─' * 68}")

        for bank_num, total_empty, sections in bank_list:
            used = bank_size - total_empty
            pct = (used / bank_size * 100) if bank_size > 0 else 0
            c = fill_color(pct)
            bar = make_bar(pct)

            # Bank label
            if mem_type in ("ROM0", "WRAM0", "HRAM"):
                label = f"  {mem_type:6s}"
            else:
                label = f"  ${bank_num:02X}   "

            # Show sections (truncated)
            sec_str = ""
            if sections:
                sec_list = ", ".join(sections[:3])
                if len(sections) > 3:
                    sec_list += f" +{len(sections)-3}"
                sec_str = f"  {Color.DIM}{sec_list}{Color.RESET}"

            free_marker = ""
            if pct >= 95:
                free_marker = f" {Color.RED}{Color.BOLD}▲ NEARLY FULL{Color.RESET}"
            elif total_empty == 0:
                free_marker = f" {Color.RED}{Color.BOLD}▲ FULL{Color.RESET}"

            print(f"{label} {bar} {c}{pct:5.1f}%{Color.RESET} "
                  f" {fmt_bytes(used):>10s} / {fmt_bytes(bank_size):<10s}"
                  f"{free_marker}{sec_str}")

        print()

    # Footer
    total_rom_used = 0
    total_rom_free = 0
    for mem_type, bank_num, total_empty, _ in banks:
        if "ROM" in mem_type:
            bank_size = BANK_SIZES.get(mem_type, 0x4000)
            total_rom_used += bank_size - total_empty
            total_rom_free += total_empty

    total_rom = total_rom_used + total_rom_free
    if total_rom > 0:
        pct = total_rom_used / total_rom * 100
        c = fill_color(pct)
        print(f"  {Color.BOLD}TOTAL ROM:{Color.RESET} {c}{fmt_bytes(total_rom_used)}{Color.RESET}"
              f" / {fmt_bytes(total_rom)} ({c}{pct:.1f}%{Color.RESET} used,"
              f" {Color.GREEN}{fmt_bytes(total_rom_free)}{Color.RESET} free)")

    print(f"{Color.BOLD}{Color.CYAN}{'═' * 72}{Color.RESET}")
    print()

# ── Main ─────────────────────────────────────────────────────────────────

def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <mapfile> [mapfile ...]", file=sys.stderr)
        print(f"Example: {sys.argv[0]} pokered.map pokeblue.map", file=sys.stderr)
        sys.exit(1)

    for path in sys.argv[1:]:
        if not os.path.exists(path):
            print(f"Error: {path} not found. Build the ROM first.", file=sys.stderr)
            continue
        print_report(path)

if __name__ == "__main__":
    main()
