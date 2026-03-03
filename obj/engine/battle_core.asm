;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 13081 (Linux)
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
SECTION "C Data obj/engine/battle_core.asm.tmp 1", WRAM0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/engine/battle_core.asm.tmp 2", WRAM0
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
SECTION "C Code obj/engine/battle_core.asm.tmp 10", ROMX
;src/engine/battlecore.c:12: void CalculateDamageC(uint8t attack, uint8t defense, uint8t basePower, uint8t level) {
;	---------------------------------
; Function CalculateDamageC
; ---------------------------------
CalculateDamage_C::
	add	sp, -14
	ld hl, sp+13
	ld	[hld], a
	ld	[hl], e
;src/engine/battlecore.c:16: if (hWhoseTurn == 0) {
	ld	a, [hWhoseTurn]
	or	a, a
	jr	NZ, .L00102
;src/engine/battlecore.c:17: effect = wPlayerMoveEffect;
	ld	a, [wPlayerMoveEffect]
	ld hl, sp+11
	ld	[hl], a
	jr	.L00103
.L00102:
;src/engine/battlecore.c:19: effect = wEnemyMoveEffect;
	ld	a, [wEnemyMoveEffect]
	ld hl, sp+11
	ld	[hl], a
.L00103:
;src/engine/battlecore.c:23: if (effect == EXPLODEEFFECT) {
	ld hl, sp+11
	ld	a, [hl]
	sub	a, $07
	jr	NZ, .L00107
;src/engine/battlecore.c:24: defense >>= 1;
	ld hl, sp+12
	ld	a, [hl]
	srl	a
	ld	[hl], a
;src/engine/battlecore.c:25: if (defense == 0) {
	ld	a, [hl]
	or	a, a
	jr	NZ, .L00107
;src/engine/battlecore.c:26: defense = 1; // minimum value of 1
	ld	[hl], $01
.L00107:
;src/engine/battlecore.c:31: if (effect != TWOTO_FIVE_ATTACKS_EFFECT && effect != ATTACKTWICE_EFFECT) {
	ld hl, sp+11
	ld	a, [hl]
	sub	a, $1d
	jr	Z, .L00113
	ld hl, sp+11
	ld	a, [hl]
	sub	a, $2c
	jr	Z, .L00113
;src/engine/battlecore.c:33: if (effect == OHKOEFFECT) {
	ld hl, sp+11
	ld	a, [hl]
	sub	a, $26
	jr	NZ, .L00109
;src/engine/battlecore.c:34: JumpMoveEffect();
	call	JumpMoveEffect
;src/engine/battlecore.c:35: wMoveMissed--;
	ld	hl, #wMoveMissed
	dec	[hl]
	ld	a, [hl]
;src/engine/battlecore.c:36: return;
	jp	.L00127
.L00109:
;src/engine/battlecore.c:40: if (basePower == 0) {
	ld hl, sp+16
	ld	a, [hl]
	or	a, a
;src/engine/battlecore.c:41: return;
	jp	Z,.L00127
.L00113:
;src/engine/battlecore.c:46: hDividend[0] = 0;
	ld	hl, #hDividend
	ld	[hl], $00
;src/engine/battlecore.c:47: hDividend[1] = 0;
	ld	hl, hDividend + 1
	ld	[hl], $00
;src/engine/battlecore.c:48: hDividend[2] = 0;
	ld	hl, hDividend + 2
	ld	[hl], $00
;src/engine/battlecore.c:49: hDividend[3] = 0;
	ld	hl, hDividend + 3
	ld	[hl], $00
;src/engine/battlecore.c:52: uint16t lvl2 = (uint16t)level * 2;
	ld hl, sp+17
	ld	a, [hl]
	ld hl, sp+11
	ld	[hl], a
	ld	a, [hld]
	ld	[hli], a
	xor	a, a
	ld	[hld], a
	sla	[hl]
	inc	hl
	rl	[hl]
	dec	hl
	ld	a, [hld]
	dec	hl
	ld	[hl], a
	ld hl, sp+11
	ld	a, [hld]
	dec	hl
;src/engine/battlecore.c:53: if (lvl2 > 255) {
	ld	[hld], a
	ld	a, [hli]
	inc	hl
	ld	[hld], a
	ld	a, [hli]
	inc	hl
	ld	[hld], a
	ld	a, $ff
	sub	a, [hl]
	inc	hl
	ld	a, $00
	sbc	a, [hl]
	jr	NC, .L00116
;src/engine/battlecore.c:54: hDividend[1] = 1;
	ld	hl, hDividend + 1
	ld	[hl], $01
.L00116:
;src/engine/battlecore.c:56: hDividend[2] = (uint8t)lvl2;
	ld hl, sp+8
	ld	a, [hl]
	ld	[hDividend + 2],a
;src/engine/battlecore.c:59: hDividend[3] = 5;
	ld	hl, hDividend + 3
	ld	[hl], $05
;src/engine/battlecore.c:87: hDivisor = 5;
	ld	hl, #hDivisor
	ld	[hl], $05
;src/engine/battlecore.c:88: Divide(); // quotient is in hQuotient[0..3]
	call	_Divide
;src/engine/battlecore.c:106: hDividend[0] = 0;
	ld	hl, #hDividend
	ld	[hl], $00
;src/engine/battlecore.c:107: hDividend[1] = 0;
	ld	hl, hDividend + 1
	ld	[hl], $00
;src/engine/battlecore.c:108: hDividend[2] = (lvl2 >> 8) & 0xFF; // normally 0 or 1
	ld hl, sp+9
	ld	a, [hl]
	ld	[hDividend + 2],a
;src/engine/battlecore.c:109: hDividend[3] = lvl2 & 0xFF;
	ld hl, sp+8
	ld	a, [hl]
	ld	[hDividend + 3],a
;src/engine/battlecore.c:112: hDivisor = 5;
	ld	hl, #hDivisor
	ld	[hl], $05
;src/engine/battlecore.c:113: Divide(); // quotient is in hQuotient[0..3]. Note: hDividend gets modified to hDivideBuffer+1 usually, but quotient is what matters.
	call	_Divide
;src/engine/battlecore.c:118: uint8t q3 = hQuotient[3] + 2;
	ld	a, [hQuotient + 3 + 0]
	add	a, $02
	ld	c, a
;src/engine/battlecore.c:119: hQuotient[3] = q3;
	ld	hl, hQuotient + 3
	ld	[hl], c
;src/engine/battlecore.c:120: if (q3 < 2) { // carry
	ld	a, c
	sub	a, $02
	jr	NC, .L00122
;src/engine/battlecore.c:121: uint8t q2 = hQuotient[2] + 1;
	ld	a, [hQuotient + 2 + 0]
	ld	c, a
	inc	c
;src/engine/battlecore.c:122: hQuotient[2] = q2;
	ld	hl, hQuotient + 2
	ld	[hl], c
;src/engine/battlecore.c:123: if (q2 == 0) {
	ld	a, c
	or	a, a
	jr	NZ, .L00122
;src/engine/battlecore.c:124: uint8t q1 = hQuotient[1] + 1;
	ld	a, [hQuotient + 1 + 0]
	ld	c, a
	inc	c
;src/engine/battlecore.c:125: hQuotient[1] = q1;
	ld	hl, hQuotient + 1
	ld	[hl], c
;src/engine/battlecore.c:126: if (q1 == 0) hQuotient[0]++;
	ld	a, c
	or	a, a
	jr	NZ, .L00122
	ld	bc, #hQuotient+0
	ld	a, [bc]
	inc	a
	ld	[bc], a
.L00122:
;src/engine/battlecore.c:133: hMultiplicand[0] = hQuotient[1];
	ld	a, [hQuotient + 1 + 0]
	ld	[hMultiplicand],a
;src/engine/battlecore.c:134: hMultiplicand[1] = hQuotient[2];
	ld	a, [hQuotient + 2 + 0]
	ld	[hMultiplicand + 1],a
;src/engine/battlecore.c:135: hMultiplicand[2] = hQuotient[3];
	ld	a, [hQuotient + 3 + 0]
	ld	[hMultiplicand + 2],a
;src/engine/battlecore.c:136: hMultiplier = basePower;
	ld hl, sp+16
	ld	a, [hl]
	ld	[hMultiplier],a
;src/engine/battlecore.c:137: Multiply(); // Product in hProduct[0..3]
	call	_Multiply
;src/engine/battlecore.c:141: hMultiplicand[0] = hProduct[1];
	ld	a, [hProduct + 1 + 0]
	ld	[hMultiplicand],a
;src/engine/battlecore.c:142: hMultiplicand[1] = hProduct[2];
	ld	a, [hProduct + 2 + 0]
	ld	[hMultiplicand + 1],a
;src/engine/battlecore.c:143: hMultiplicand[2] = hProduct[3];
	ld	a, [hProduct + 3 + 0]
	ld	[hMultiplicand + 2],a
;src/engine/battlecore.c:144: hMultiplier = attack;
	ld hl, sp+13
	ld	a, [hl]
	ld	[hMultiplier],a
;src/engine/battlecore.c:145: Multiply(); // Product in hProduct[0..3]
	call	_Multiply
;src/engine/battlecore.c:149: hDividend[0] = hProduct[0];
	ld	a, [hProduct + 0]
	ld	[hDividend],a
;src/engine/battlecore.c:150: hDividend[1] = hProduct[1];
	ld	a, [hProduct + 1 + 0]
	ld	[hDividend + 1],a
;src/engine/battlecore.c:151: hDividend[2] = hProduct[2];
	ld	a, [hProduct + 2 + 0]
	ld	[hDividend + 2],a
;src/engine/battlecore.c:152: hDividend[3] = hProduct[3];
	ld	a, [hProduct + 3 + 0]
	ld	[hDividend + 3],a
;src/engine/battlecore.c:153: hDivisor = defense;
	ld hl, sp+12
	ld	a, [hl]
	ld	[hDivisor],a
;src/engine/battlecore.c:154: Divide(); // Quotient in hQuotient[0..3]
	call	_Divide
;src/engine/battlecore.c:158: hDividend[0] = hQuotient[0];
	ld	a, [hQuotient + 0]
	ld	[hDividend],a
;src/engine/battlecore.c:159: hDividend[1] = hQuotient[1];
	ld	a, [hQuotient + 1 + 0]
	ld	[hDividend + 1],a
;src/engine/battlecore.c:160: hDividend[2] = hQuotient[2];
	ld	a, [hQuotient + 2 + 0]
	ld	[hDividend + 2],a
;src/engine/battlecore.c:161: hDividend[3] = hQuotient[3];
	ld	a, [hQuotient + 3 + 0]
	ld	[hDividend + 3],a
;src/engine/battlecore.c:162: hDivisor = 50;
	ld	hl, #hDivisor
	ld	[hl], $32
;src/engine/battlecore.c:163: Divide(); // Quotient in hQuotient[0..3]
	call	_Divide
;src/engine/battlecore.c:169: uint16t curdmg = ((uint16t)wDamage[0] << 8) | wDamage[1];
	ld	a, [wDamage + 0]
	ld	b, a
	ld	c, $00
	ld	a, [wDamage + 1 + 0]
	ld	e, $00
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld hl, sp+10
	ld	[hl], c
	inc	hl
	ld	[hl], a
;src/engine/battlecore.c:170: uint32t damage = ((uint32t)hQuotient[0] << 24) |
	ld	a, [hQuotient + 0]
	ld	d, a
	xor	a, a
	ld	c, a
	ld	e, a
	ld hl, sp+6
	ld	[hli], a
	ld	a, c
	ld	[hli], a
	ld	a, e
	ld	[hli], a
	ld	[hl], d
	ld	a, [hQuotient + 1 + 0]
	ld	c, a
	ld	b, $00
	ld	de, $0000
	ld hl, sp+6
	ld	a, [hl]
	or	a, e
	ld hl, sp+2
	ld	[hl], a
	ld hl, sp+7
	ld	a, [hl]
	or	a, d
	ld hl, sp+3
	ld	[hl], a
	ld hl, sp+8
	ld	a, [hl]
	or	a, c
	ld hl, sp+4
	ld	[hl], a
	ld hl, sp+9
	ld	a, [hl]
	or	a, b
	ld hl, sp+5
	ld	[hl], a
	ld	a, [hQuotient + 2 + 0]
	ld	c, a
	ld	b, $00
	ld	de, $0000
	ld	d, e
	ld	e, b
	ld	b, c
	ld	c, $00
	ld hl, sp+2
	ld	a, [hl]
	or	a, c
	ld hl, sp+6
	ld	[hl], a
	ld hl, sp+3
	ld	a, [hl]
	or	a, b
	ld hl, sp+7
	ld	[hl], a
	ld hl, sp+4
	ld	a, [hl]
	or	a, e
	ld hl, sp+8
	ld	[hl], a
	ld hl, sp+5
	ld	a, [hl]
	or	a, d
	ld hl, sp+9
	ld	[hl], a
	ld	a, [hQuotient + 3 + 0]
	ld	c, a
	ld	b, $00
	ld	de, $0000
	ld hl, sp+6
	ld	a, [hl]
	or	a, c
	ld hl, sp+0
	ld	[hl], a
	ld hl, sp+7
	ld	a, [hl]
	or	a, b
	ld hl, sp+1
	ld	[hl], a
	ld hl, sp+8
	ld	a, [hl]
	or	a, e
	ld hl, sp+2
	ld	[hl], a
	ld hl, sp+9
	ld	a, [hl]
	or	a, d
	ld hl, sp+3
	ld	[hl], a
;src/engine/battlecore.c:175: damage += curdmg; // add wDamage to quotient
	ld hl, sp+10
	ld	a, [hl]
	ld hl, sp+4
	ld	[hl], a
	ld hl, sp+11
	ld	a, [hl]
	ld hl, sp+5
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hl], a
	pop	de
	push	de
	ld	a, e
	ld hl, sp+4
	add	a, [hl]
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, [hl]
	push	af
	ld hl, sp+11
	ld	[hld], a
	ld	[hl], e
	ld hl, sp+4
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	ld hl, sp+8
	pop	af
	ld	a, e
	adc	a, [hl]
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, [hl]
	ld hl, sp+11
	ld	[hld], a
;src/engine/battlecore.c:177: if (damage > 997) {
	ld	a, e
	ld	[hld], a
	dec	hl
	ld	a, $e5
	sub	a, [hl]
	inc	hl
	ld	a, $03
	sbc	a, [hl]
	inc	hl
	ld	a, $00
	sbc	a, [hl]
	inc	hl
	ld	a, $00
	sbc	a, [hl]
	jr	NC, .L00124
;src/engine/battlecore.c:178: damage = 997;
	ld hl, sp+8
	ld	a, $e5
	ld	[hli], a
	ld	a, $03
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hl], a
.L00124:
;src/engine/battlecore.c:182: damage += 2;
	ld hl, sp+8
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	ld	a, e
	add	a, $02
	ld	e, a
	ld	a, d
	adc	a, $00
	push	af
	ld hl, sp+7
	ld	[hld], a
	ld	[hl], e
	ld hl, sp+12
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	pop	af
	ld	a, e
	adc	a, $00
	ld	e, a
	ld	a, d
	adc	a, $00
	ld hl, sp+7
	ld	[hld], a
;src/engine/battlecore.c:183: if (damage > 999) {
	ld	a, e
	ld	[hld], a
	dec	hl
	ld	a, $e7
	sub	a, [hl]
	inc	hl
	ld	a, $03
	sbc	a, [hl]
	inc	hl
	ld	a, $00
	sbc	a, [hl]
	inc	hl
	ld	a, $00
	sbc	a, [hl]
	jr	NC, .L00126
;src/engine/battlecore.c:184: damage = 999;
	ld hl, sp+4
	ld	a, $e7
	ld	[hli], a
	ld	a, $03
	ld	[hli], a
	xor	a, a
	ld	[hli], a
	ld	[hl], a
.L00126:
;src/engine/battlecore.c:187: wDamage[0] = (damage >> 8) & 0xFF;
	ld hl, sp+5
	ld	a, [hl]
	ld	[wDamage],a
;src/engine/battlecore.c:188: wDamage[1] = damage & 0xFF;
	ld hl, sp+4
	ld	a, [hl]
	ld hl, sp+11
	ld	[hl], a
	ld	de, wDamage + 1
	ld	a, [hl]
	ld	[de], a
.L00127:
;src/engine/battlecore.c:189: }
	add	sp, 14
	pop	hl
	inc	sp
	inc	sp
 jp hl
;src/engine/battlecore.c:192: void CalculateDamage(void) _naked {
;	---------------------------------
; Function CalculateDamage
; ---------------------------------
CalculateDamage::
;src/engine/battlecore.c:223: _endasm;
	push	bc
	push	de
	push	hl
	push	de
	push	bc
	call	CalculateDamage_C
	add	sp, 4
	pop	hl
	pop	de
	pop	bc
	ld	a, 1
	and	a
	ret
;src/engine/battlecore.c:224: }
SECTION "C Code obj/engine/battle_core.asm.tmp 11", ROMX
