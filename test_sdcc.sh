#!/usr/bin/env bash
/usr/bin/sdcc -msm83 --fsigned-char --use-stdout --no-std-crt0 -D_SDCC -S -o - src/data/base_stats.c > /tmp/test1.asm 2> /tmp/test1_err.txt
cat /tmp/test1.asm | head -n 30
cat /tmp/test1_err.txt
