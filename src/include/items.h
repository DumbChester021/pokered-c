/*
 * items.h — Item constants
 * Mirrors constants/item_constants.asm
 */

#ifndef POKERED_ITEMS_H
#define POKERED_ITEMS_H

#include <stdint.h>

typedef struct {
    uint8_t price[3]; // 3-byte BCD (e.g. 10 00 00)
} ItemPrice;

// BCD conversion helper, extracts 3 bytes
#define BCD3(val) { \
    (((val) / 100000) % 10 << 4) | (((val) / 10000) % 10), \
    (((val) / 1000) % 10 << 4)   | (((val) / 100) % 10),   \
    (((val) / 10) % 10 << 4)     | ((val) % 10)            \
}

#endif /* POKERED_ITEMS_H */
