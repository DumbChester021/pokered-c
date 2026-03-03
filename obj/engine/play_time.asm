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
SECTION "C Data obj/engine/play_time.asm.tmp 1", WRAM0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/engine/play_time.asm.tmp 2", WRAM0
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
SECTION "C Code obj/engine/play_time.asm.tmp 10", ROMX
;src/engine/playtime.c:9: void CountDownIgnoreInputBitReset(void) {
;	---------------------------------
; Function CountDownIgnoreInputBitReset
; ---------------------------------
CountDownIgnoreInputBitReset::
;src/engine/playtime.c:10: if (wIgnoreInputCounter != 0) {
	ld	hl, #wIgnoreInputCounter
	ld	a, [hl]
	or	a, a
	jr	Z, .L00102
;src/engine/playtime.c:11: wIgnoreInputCounter--;
	dec	[hl]
	ld	a, [hl]
	jr	.L00103
.L00102:
;src/engine/playtime.c:13: wIgnoreInputCounter = 0xFF; // Fallthrough logic from ASM
	ld	hl, #wIgnoreInputCounter
	ld	[hl], $ff
.L00103:
;src/engine/playtime.c:16: if (wIgnoreInputCounter != 0) {
	ld	a, [wIgnoreInputCounter]
	or	a, a
;src/engine/playtime.c:17: return;
	ret	NZ
;src/engine/playtime.c:22: wStatusFlags5 &= ~((1 << BITUNKNOWN_5_1) | (1 << BITUNKNOWN_5_2));
	ld	hl, #wStatusFlags5
	ld	a, [hl]
	and	a, $f9
	ld	[hl], a
;src/engine/playtime.c:25: if (wStatusFlags5 & (1 << BITDISABLE_JOYPAD)) {
	push	hl
	bit	5, [hl]
	pop	hl
	ret	Z
;src/engine/playtime.c:27: wStatusFlags5 &= ~(1 << BITDISABLE_JOYPAD);
	ld	hl, #wStatusFlags5
	ld	a, [hl]
	and	a, $df
	ld	[hl], a
;src/engine/playtime.c:32: hJoyPressed = 0;
	ld	hl, #hJoyPressed
	ld	[hl], $00
;src/engine/playtime.c:33: hJoyHeld = 0;
	ld	hl, #hJoyHeld
	ld	[hl], $00
;src/engine/playtime.c:35: }
	ret
;src/engine/playtime.c:37: void TrackPlayTime(void) {
;	---------------------------------
; Function TrackPlayTime
; ---------------------------------
TrackPlayTime::
;src/engine/playtime.c:38: CountDownIgnoreInputBitReset();
	call	CountDownIgnoreInputBitReset
;src/engine/playtime.c:40: if (!(wStatusFlags6 & (1 << BITGAME_TIMER_COUNTING))) {
	push	hl
	ld	hl, #wStatusFlags6
	bit	0, [hl]
	pop	hl
	ret	Z
;src/engine/playtime.c:41: return;
	jr	.L00102
.L00102:
;src/engine/playtime.c:44: if (wPlayTimeMaxed != 0) {
	ld	a, [wPlayTimeMaxed]
	or	a, a
;src/engine/playtime.c:45: return;
	ret	NZ
;src/engine/playtime.c:48: wPlayTimeFrames++;
	ld	hl, #wPlayTimeFrames
	inc	[hl]
	ld	a, [hl]
;src/engine/playtime.c:49: if (wPlayTimeFrames < 60) {
	ld	a, [hl]
	sub	a, $3c
;src/engine/playtime.c:50: return;
	ret	C
;src/engine/playtime.c:53: wPlayTimeFrames = 0;
	ld	hl, #wPlayTimeFrames
	ld	[hl], $00
;src/engine/playtime.c:54: wPlayTimeSeconds++;
	ld	hl, #wPlayTimeSeconds
	inc	[hl]
	ld	a, [hl]
;src/engine/playtime.c:55: if (wPlayTimeSeconds < 60) {
	ld	a, [hl]
	sub	a, $3c
;src/engine/playtime.c:56: return;
	ret	C
;src/engine/playtime.c:59: wPlayTimeSeconds = 0;
	ld	hl, #wPlayTimeSeconds
	ld	[hl], $00
;src/engine/playtime.c:60: wPlayTimeMinutes++;
	ld	hl, #wPlayTimeMinutes
	inc	[hl]
	ld	a, [hl]
;src/engine/playtime.c:61: if (wPlayTimeMinutes < 60) {
	ld	a, [hl]
	sub	a, $3c
;src/engine/playtime.c:62: return;
	ret	C
;src/engine/playtime.c:65: wPlayTimeMinutes = 0;
	ld	hl, #wPlayTimeMinutes
	ld	[hl], $00
;src/engine/playtime.c:66: wPlayTimeHours++;
	ld	hl, #wPlayTimeHours
	inc	[hl]
	ld	a, [hl]
;src/engine/playtime.c:67: if (wPlayTimeHours < 0xFF) {
	ld	a, [hl]
	sub	a, $ff
;src/engine/playtime.c:68: return;
	ret	C
;src/engine/playtime.c:71: wPlayTimeHours = 0xFF;
	ld	hl, #wPlayTimeHours
	ld	[hl], $ff
;src/engine/playtime.c:72: wPlayTimeMaxed = 0xFF;
	ld	hl, #wPlayTimeMaxed
	ld	[hl], $ff
;src/engine/playtime.c:73: }
	ret
SECTION "C Code obj/engine/play_time.asm.tmp 11", ROMX
