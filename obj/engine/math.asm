;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 13081 [Linux]
;--------------------------------------------------------
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/engine/math.asm.tmp 1", WRAM0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/engine/math.asm.tmp 2", WRAM0
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
;--------------------------------------------------------
; Home
;--------------------------------------------------------
;--------------------------------------------------------
; code
;--------------------------------------------------------
SECTION "C Code obj/engine/math.asm.tmp 10", ROMX
;src/engine/math.c:4: void Random_[void] {
;	---------------------------------
; Function Random_
; ---------------------------------
Random_::
;src/engine/math.c:5: uint8t d = rDIV;
	ld	hl, #rDIV
	ld	c, [hl]
;src/engine/math.c:6: hRandomAdd += d;
	ld	hl, #hRandomAdd
	ld	a, [hl]
	add	a, c
	ld	[hl], a
;src/engine/math.c:7: hRandomSub -= d;
	ld	hl, #hRandomSub
	ld	a, [hl]
	sub	a, c
	ld	[hl], a
;src/engine/math.c:8: }
	ret
;src/engine/math.c:10: void Multiply[void] {
;	---------------------------------
; Function Multiply
; ---------------------------------
_Multiply::
	add	sp, -3
;src/engine/math.c:14: hProduct[0] = 0;
	ld	hl, #hProduct
	ld	[hl], $00
;src/engine/math.c:16: hMultiplyBuffer[0] = 0;
	ld	hl, #hMultiplyBuffer
	ld	[hl], $00
;src/engine/math.c:17: hMultiplyBuffer[1] = 0;
	ld	hl, hMultiplyBuffer + 1
	ld	[hl], $00
;src/engine/math.c:18: hMultiplyBuffer[2] = 0;
	ld	hl, hMultiplyBuffer + 2
	ld	[hl], $00
;src/engine/math.c:19: hMultiplyBuffer[3] = 0;
	ld	hl, hMultiplyBuffer + 3
	ld	[hl], $00
;src/engine/math.c:21: while [1] {
	ld hl, sp+2
	ld	[hl], $08
.L00106:
;src/engine/math.c:22: uint8t a = hMultiplier;
	ld	hl, #hMultiplier
	ld	a, [hl]
;src/engine/math.c:23: hMultiplier = a >> 1; // carry flag holds the shifted out bit
	push	af
	srl	a
	ld	[hl], a
	pop	af
;src/engine/math.c:25: if (a & 1) { // jr nc, .smallMultiplier
	rrca
	jr	NC, .L00102
;src/engine/math.c:29: sum = hMultiplyBuffer[3] + hMultiplicand[2];
	ld	a, [hMultiplyBuffer + 3 + 0]
	ld	c, a
	ld	b, $00
	ld	a, [hMultiplicand + 2 + 0]
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
;src/engine/math.c:30: hMultiplyBuffer[3] = [uint8t]sum;
	ld	de, #hMultiplyBuffer+3
	ld	a, c
	ld	[de], a
;src/engine/math.c:32: sum = hMultiplyBuffer[2] + hMultiplicand[1] + (sum >> 8);
	ld	a, [hMultiplyBuffer + 2 + 0]
	ld hl, sp+0
	ld	[hli], a
	ld	[hl], $00
	ld	a, [hMultiplicand + 1 + 0]
	ld	d, $00
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
;src/engine/math.c:33: hMultiplyBuffer[2] = [uint8t]sum;
	ld	de, #hMultiplyBuffer+2
	ld	a, c
	ld	[de], a
;src/engine/math.c:35: sum = hMultiplyBuffer[1] + hMultiplicand[0] + (sum >> 8);
	ld	a, [hMultiplyBuffer + 1 + 0]
	ld hl, sp+0
	ld	[hli], a
	ld	[hl], $00
	ld	a, [hMultiplicand + 0]
	ld	d, $00
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
;src/engine/math.c:36: hMultiplyBuffer[1] = [uint8t]sum;
	ld	de, #hMultiplyBuffer+1
	ld	a, c
	ld	[de], a
;src/engine/math.c:38: sum = hMultiplyBuffer[0] + hProduct[0] + (sum >> 8);
	ld	a, [hMultiplyBuffer + 0]
	ld hl, sp+0
	ld	[hli], a
	ld	[hl], $00
	ld	a, [hProduct + 0]
	ld	d, $00
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
;src/engine/math.c:39: hMultiplyBuffer[0] = [uint8t]sum;
	ld	hl, #hMultiplyBuffer
	ld	[hl], c
.L00102:
;src/engine/math.c:42: b--;
	ld hl, sp+2
;src/engine/math.c:43: if (b == 0) break;
	dec	[hl]
	ld	a, [hl]
	jr	Z, .L00107
;src/engine/math.c:47: shift = hMultiplicand[2] << 1;
	ld	a, [hMultiplicand + 2 + 0]
	ld	b, $00
	add	a, a
	rl	b
;src/engine/math.c:48: hMultiplicand[2] = [uint8t]shift;
	ld	[hMultiplicand + 2],a
;src/engine/math.c:50: shift = (hMultiplicand[1] << 1) | (shift >> 8);
	ld	a, [hMultiplicand + 1 + 0]
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	c, b
	ld	b, $00
	ld	a, c
	or	a, l
	ld	c, a
	ld	a, b
	or	a, h
	ld	b, a
;src/engine/math.c:51: hMultiplicand[1] = [uint8t]shift;
	ld	a, c
	ld	[hMultiplicand + 1],a
;src/engine/math.c:53: shift = (hMultiplicand[0] << 1) | (shift >> 8);
	ld	a, [hMultiplicand + 0]
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	c, b
	ld	b, $00
	ld	a, l
	or	a, c
	ld	c, a
	ld	a, h
	or	a, b
	ld	b, a
;src/engine/math.c:54: hMultiplicand[0] = [uint8t]shift;
	ld	a, c
	ld	[hMultiplicand],a
;src/engine/math.c:56: shift = (hProduct[0] << 1) | (shift >> 8);
	ld	a, [hProduct + 0]
	ld	h, $00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	c, b
	ld	b, $00
	ld	a, c
	or	a, l
	ld	c, a
	ld	a, b
	or	a, h
;src/engine/math.c:57: hProduct[0] = [uint8t]shift;
	ld	hl, #hProduct
	ld	[hl], c
	jp	.L00106
.L00107:
;src/engine/math.c:60: hProduct[3] = hMultiplyBuffer[3];
	ld	a, [hMultiplyBuffer + 3 + 0]
	ld	[hProduct + 3],a
;src/engine/math.c:61: hProduct[2] = hMultiplyBuffer[2];
	ld	a, [hMultiplyBuffer + 2 + 0]
	ld	[hProduct + 2],a
;src/engine/math.c:62: hProduct[1] = hMultiplyBuffer[1];
	ld	a, [hMultiplyBuffer + 1 + 0]
	ld	[hProduct + 1],a
;src/engine/math.c:63: hProduct[0] = hMultiplyBuffer[0];
	ld	a, [hMultiplyBuffer + 0]
	ld	[hProduct],a
;src/engine/math.c:64: }
	add	sp, 3
	ret
;src/engine/math.c:66: void Divide[void] {
;	---------------------------------
; Function Divide
; ---------------------------------
_Divide::
	add	sp, -22
;src/engine/math.c:69: uint32t dividend = ([uint32t]hDividend[0] << 24) | 
	ld	a, [hDividend + 0]
	ld	d, a
	ld	bc, $0000
	ld	e, $00
	ld hl, sp+14
	ld	a, c
	ld	[hli], a
	ld	a, b
	ld	[hli], a
	ld	a, e
	ld	[hli], a
	ld	[hl], d
	ld	a, [hDividend + 1 + 0]
	ld	e, a
	ld	d, $00
	ld	bc, $0000
	ld hl, sp+14
	ld	a, [hl]
	or	a, c
	ld hl, sp+18
	ld	[hl], a
	ld hl, sp+15
	ld	a, [hl]
	or	a, b
	ld hl, sp+19
	ld	[hl], a
	ld hl, sp+16
	ld	a, [hl]
	or	a, e
	ld hl, sp+20
	ld	[hl], a
	ld hl, sp+17
	ld	a, [hl]
	or	a, d
	ld hl, sp+21
	ld	[hl], a
	ld	a, [hDividend + 2 + 0]
	ld	c, a
	ld	b, $00
	ld	de, $0000
	ld	d, e
	ld	e, b
	ld	b, c
	ld	c, $00
	ld hl, sp+18
	ld	a, [hl]
	or	a, c
	ld hl, sp+14
	ld	[hl], a
	ld hl, sp+19
	ld	a, [hl]
	or	a, b
	ld hl, sp+15
	ld	[hl], a
	ld hl, sp+20
	ld	a, [hl]
	or	a, e
	ld hl, sp+16
	ld	[hl], a
	ld hl, sp+21
	ld	a, [hl]
	or	a, d
	ld hl, sp+17
	ld	[hl], a
	ld	a, [hDividend + 3 + 0]
	ld	c, a
	ld	b, $00
	ld	de, $0000
	ld hl, sp+14
	ld	a, [hl]
	or	a, c
	ld hl, sp+18
	ld	[hl], a
	ld hl, sp+15
	ld	a, [hl]
	or	a, b
	ld hl, sp+19
	ld	[hl], a
	ld hl, sp+16
	ld	a, [hl]
	or	a, e
	ld hl, sp+20
	ld	[hl], a
	ld hl, sp+17
	ld	a, [hl]
	or	a, d
	ld hl, sp+21
	ld	[hl], a
	ld hl, sp+18
	ld	d, h
	ld	e, l
	ld hl, sp+12
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hl], a
;src/engine/math.c:74: uint32t divisor = hDivisor;
	ld	a, [hDivisor]
	ld hl, sp+0
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hli], a
;src/engine/math.c:76: uint32t quotient = 0;
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hli], a
	ld	[hli], a
	ld	[hl], a
;src/engine/math.c:77: uint32t remainder = 0;
	xor	a, a
	ld hl, sp+16
	ld	[hli], a
	ld	[hli], a
	ld	[hli], a
	ld	[hl], a
;src/engine/math.c:79: if (divisor != 0) {
	ld hl, sp+3
	ld	a, [hld]
	or	a, [hl]
	dec	hl
	or	a, [hl]
	dec	hl
	or	a, [hl]
	jp	Z, .L00108
;src/engine/math.c:80: for (int i = 0; i < 32; i++) {
	xor	a, a
	ld hl, sp+20
	ld	[hli], a
	ld	[hl], a
.L00111:
	ld hl, sp+20
	ld	a, [hli]
	sub	a, $20
	ld	a, [hl]
	sbc	a, $00
	ld	d, [hl]
	ld	a, $00
	bit	7,a
	jr	Z, .L00147
	bit	7, d
	jr	NZ, .L00148
	cp	a, a
	jr	.L00148
.L00147:
	bit	7, d
	jr	Z, .L00148
	scf
.L00148:
	jp	NC, .L00109
;src/engine/math.c:81: remainder <<= 1;
	ld hl, sp+16
	sla	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
;src/engine/math.c:82: if (dividend & 0x80000000) {
	push	hl
	ld hl, sp+17
	bit	7, [hl]
	pop	hl
	jr	Z, .L00102
;src/engine/math.c:83: remainder |= 1;
	ld hl, sp+16
	ld	a, [hl]
	or	a, $01
	ld	[hl], a
.L00102:
;src/engine/math.c:85: dividend <<= 1;
	ld hl, sp+12
	sla	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
;src/engine/math.c:89: quotient = (quotient << 1) | 1;
	push	af
	ld hl, sp+6
	ld	a, [hl]
	ld hl, sp+10
	ld	[hl], a
	ld hl, sp+7
	ld	a, [hl]
	ld hl, sp+11
	ld	[hl], a
	ld hl, sp+8
	ld	a, [hl]
	ld hl, sp+12
	ld	[hl], a
	ld hl, sp+9
	ld	a, [hl]
	ld hl, sp+13
	ld	[hl], a
	pop	af
	ld hl, sp+8
	sla	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
	inc	hl
	rl	[hl]
;src/engine/math.c:87: if (remainder >= divisor) {
	ld hl, sp+16
	ld	e, l
	ld	d, h
	ld hl, sp+0
	ld	a, [de]
	inc	de
	sub	a, [hl]
	inc	hl
	ld	a, [de]
	inc	de
	sbc	a, [hl]
	inc	hl
	ld	a, [de]
	inc	de
	sbc	a, [hl]
	inc	hl
	ld	a, [de]
	sbc	a, [hl]
	jr	C, .L00104
;src/engine/math.c:88: remainder -= divisor;
	ld hl, sp+16
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	ld	a, e
	ld hl, sp+0
	sub	a, [hl]
	inc	hl
	ld	e, a
	ld	a, d
	sbc	a, [hl]
	push	af
	ld hl, sp+19
	ld	[hld], a
	ld	[hl], e
	ld hl, sp+20
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	ld hl, sp+4
	pop	af
	ld	a, e
	sbc	a, [hl]
	inc	hl
	ld	e, a
	ld	a, d
	sbc	a, [hl]
	ld hl, sp+19
	ld	[hld], a
	ld	[hl], e
;src/engine/math.c:89: quotient = (quotient << 1) | 1;
	ld hl, sp+8
	ld	a, [hl]
	or	a, $01
	ld hl, sp+4
	ld	[hl], a
	ld hl, sp+9
	ld	a, [hl]
	ld hl, sp+5
	ld	[hl], a
	ld hl, sp+10
	ld	a, [hl]
	ld hl, sp+6
	ld	[hl], a
	ld hl, sp+11
	ld	a, [hl]
	ld hl, sp+7
	ld	[hl], a
	jr	.L00112
.L00104:
;src/engine/math.c:91: quotient <<= 1;
	ld hl, sp+8
	ld	d, h
	ld	e, l
	ld hl, sp+4
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hli],	a
	inc	de
	ld	a, [de]
	ld	[hl], a
.L00112:
;src/engine/math.c:80: for (int i = 0; i < 32; i++) {
	ld hl, sp+20
	inc	[hl]
	jp	NZ,.L00111
	inc	hl
	inc	[hl]
	jp	.L00111
.L00108:
;src/engine/math.c:96: quotient = 0xFFFFFFFF;
	ld hl, sp+4
	ld	a,$ff
	ld	[hli],a
	ld	[hli], a
	ld	a, $ff
	ld	[hli], a
	ld	[hl], $ff
;src/engine/math.c:97: remainder = dividend & 0xFF; // Only 8 bit remainder usually
	ld hl, sp+12
	ld	a, [hl]
	ld hl, sp+16
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hli], a
	ld	[hl], a
.L00109:
;src/engine/math.c:101: hQuotient[0] = (quotient >> 24) & 0xFF;
	ld hl, sp+7
	ld	a, [hl]
	ld	[hQuotient],a
;src/engine/math.c:102: hQuotient[1] = (quotient >> 16) & 0xFF;
	ld hl, sp+6
	ld	a, [hl]
	ld	[hQuotient + 1],a
;src/engine/math.c:103: hQuotient[2] = (quotient >> 8) & 0xFF;
	ld hl, sp+5
	ld	a, [hl]
	ld	[hQuotient + 2],a
;src/engine/math.c:104: hQuotient[3] = quotient & 0xFF;
	ld hl, sp+4
	ld	a, [hl]
	ld	[hQuotient + 3],a
;src/engine/math.c:106: hRemainder = remainder & 0xFF;
	ld hl, sp+16
	ld	a, [hl]
	ld	[hRemainder],a
;src/engine/math.c:109: }
	add	sp, 22
	ret
SECTION "C Code obj/engine/math.asm.tmp 11", ROMX
