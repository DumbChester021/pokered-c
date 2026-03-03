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
SECTION "C Data obj/engine/flag_action.asm.tmp 1", WRAM0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/engine/flag_action.asm.tmp 2", WRAM0
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
SECTION "C Code obj/engine/flag_action.asm.tmp 10", ROMX
;src/engine/flagaction.c:9: uint8t C_FlagAction(uint8t bit, uint8t action, uint8t* ptr) {
;	---------------------------------
; Function C_FlagAction
; ---------------------------------
_C_FlagAction::
	ld	d, a
	ld	c, e
;src/engine/flagaction.c:10: uint8t mask = 1 << (bit & 7);
	ld	a, d
	and	a, $07
	ld	e, a
	ld	b, $01
	inc	e
	jr	.L00126
.L00125:
	sla	b
.L00126:
	dec	e
	jr	NZ,.L00125
;src/engine/flagaction.c:11: ptr += (bit >> 3);
	ld	e, d
	srl	e
	srl	e
	srl	e
	ld	d, $00
	ld hl, sp+2
	ld	a,	[hli]
	ld	h, [hl]
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ld hl, sp+4
	ld	[hl], a
	pop	hl
	ld	a, h
	ld hl, sp+3
;src/engine/flagaction.c:14: *ptr &= ~mask;
	ld	[hld], a
	ld	a, [hli]
	ld	e, a
	ld	d, [hl]
	ld	a, [de]
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/engine/flagaction.c:13: if (action == 0) { // FLAGRESET
	ld	a, c
	or	a, a
	jr	NZ, .L00104
;src/engine/flagaction.c:14: *ptr &= ~mask;
	ld	a, b
	cpl
	and	a, l
	ld	[de], a
	jr	.L00105
.L00104:
;src/engine/flagaction.c:15: } else if (action == 1) { // FLAGSET
	dec	c
	jr	NZ, .L00105
;src/engine/flagaction.c:16: *ptr |= mask;
	ld	a, l
	or	a, b
	ld	[de], a
.L00105:
;src/engine/flagaction.c:20: return (*ptr & mask) ? 1 : 0;
	ld	a, [de]
	and	a,b
	jr	Z, .L00108
	ld	a, $01
	ld	c, $00
	jr	.L00109
.L00108:
	xor	a, a
	ld	c, a
.L00109:
;src/engine/flagaction.c:21: }
	pop	hl
	inc	sp
	inc	sp
 jp hl
;src/engine/flagaction.c:23: void FlagActionProxy(void) _naked {
;	---------------------------------
; Function FlagActionProxy
; ---------------------------------
FlagAction_Proxy::
;src/engine/flagaction.c:47: _endasm;
	FlagActionPredef::
	call	GetPredefRegisters
	FlagAction::
	push	de
;	Setup arguments for C_FlagAction
;	SP + 0: de
;	SP + 2: return address
	push	hl ; arg 3: ptr
	push	bc ; arg 1 [c] & arg 2 [b]
	call	_C_FlagAction
;	restore stack
	pop	bc
	pop	hl
;	return value is in a. legacy expects it in c too.
	ld	c, a
	pop	de
	ret
;src/engine/flagaction.c:48: }
SECTION "C Code obj/engine/flag_action.asm.tmp 11", ROMX
