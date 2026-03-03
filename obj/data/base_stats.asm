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
SECTION "C Data obj/data/base_stats.asm.tmp 1", WRAM0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
SECTION "C Data obj/data/base_stats.asm.tmp 2", WRAM0
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
SECTION "C Code obj/data/base_stats.asm.tmp 10", ROMX
SECTION "C Code obj/data/base_stats.asm.tmp 11", ROMX
BaseStats::
	db $01	; 1
	db $2d	; 45
	db $31	; 49	'1'
	db $31	; 49	'1'
	db $2d	; 45
	db $41	; 65	'A'
	db $16	; 22
	db $03	; 3
	db $2d	; 45
	db $40	; 64
	db $55	; 85	'U'
	dw BulbasaurPicFront
	dw BulbasaurPicBack
	db $21	; 33
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $a4	; 164
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $02	; 2
	db $3c	; 60
	db $3e	; 62
	db $3f	; 63
	db $3c	; 60
	db $50	; 80	'P'
	db $16	; 22
	db $03	; 3
	db $2d	; 45
	db $8d	; 141
	db $66	; 102	'f'
	dw IvysaurPicFront
	dw IvysaurPicBack
	db $21	; 33
	db $2d	; 45
	db $49	; 73	'I'
	db $00	; 0
	db $03	; 3
	db $a4	; 164
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $03	; 3
	db $50	; 80	'P'
	db $52	; 82	'R'
	db $53	; 83	'S'
	db $50	; 80	'P'
	db $64	; 100	'd'
	db $16	; 22
	db $03	; 3
	db $2d	; 45
	db $d0	; 208
	db $77	; 119	'w'
	dw VenusaurPicFront
	dw VenusaurPicBack
	db $21	; 33
	db $2d	; 45
	db $49	; 73	'I'
	db $16	; 22
	db $03	; 3
	db $a4	; 164
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $04	; 4
	db $27	; 39
	db $34	; 52	'4'
	db $2b	; 43
	db $41	; 65	'A'
	db $32	; 50	'2'
	db $14	; 20
	db $14	; 20
	db $2d	; 45
	db $41	; 65	'A'
	db $55	; 85	'U'
	dw CharmanderPicFront
	dw CharmanderPicBack
	db $0a	; 10
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $b5	; 181
	db $03	; 3
	db $4f	; 79	'O'
	db $c8	; 200
	db $e3	; 227
	db $08	; 8
	db $26	; 38
	db $00	; 0
	db $05	; 5
	db $3a	; 58
	db $40	; 64
	db $3a	; 58
	db $50	; 80	'P'
	db $41	; 65	'A'
	db $14	; 20
	db $14	; 20
	db $2d	; 45
	db $8e	; 142
	db $66	; 102	'f'
	dw CharmeleonPicFront
	dw CharmeleonPicBack
	db $0a	; 10
	db $2d	; 45
	db $34	; 52	'4'
	db $00	; 0
	db $03	; 3
	db $b5	; 181
	db $03	; 3
	db $4f	; 79	'O'
	db $c8	; 200
	db $e3	; 227
	db $08	; 8
	db $26	; 38
	db $00	; 0
	db $06	; 6
	db $4e	; 78	'N'
	db $54	; 84	'T'
	db $4e	; 78	'N'
	db $64	; 100	'd'
	db $55	; 85	'U'
	db $14	; 20
	db $02	; 2
	db $2d	; 45
	db $d1	; 209
	db $77	; 119	'w'
	dw CharizardPicFront
	dw CharizardPicBack
	db $0a	; 10
	db $2d	; 45
	db $34	; 52	'4'
	db $2b	; 43
	db $03	; 3
	db $b5	; 181
	db $43	; 67	'C'
	db $4f	; 79	'O'
	db $ce	; 206
	db $e3	; 227
	db $08	; 8
	db $26	; 38
	db $00	; 0
	db $07	; 7
	db $2c	; 44
	db $30	; 48	'0'
	db $41	; 65	'A'
	db $2b	; 43
	db $32	; 50	'2'
	db $15	; 21
	db $15	; 21
	db $2d	; 45
	db $42	; 66	'B'
	db $55	; 85	'U'
	dw SquirtlePicFront
	dw SquirtlePicBack
	db $21	; 33
	db $27	; 39
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $3f	; 63
	db $0f	; 15
	db $c8	; 200
	db $83	; 131
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $08	; 8
	db $3b	; 59
	db $3f	; 63
	db $50	; 80	'P'
	db $3a	; 58
	db $41	; 65	'A'
	db $15	; 21
	db $15	; 21
	db $2d	; 45
	db $8f	; 143
	db $66	; 102	'f'
	dw WartortlePicFront
	dw WartortlePicBack
	db $21	; 33
	db $27	; 39
	db $91	; 145
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $3f	; 63
	db $0f	; 15
	db $c8	; 200
	db $83	; 131
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $09	; 9
	db $4f	; 79	'O'
	db $53	; 83	'S'
	db $64	; 100	'd'
	db $4e	; 78	'N'
	db $55	; 85	'U'
	db $15	; 21
	db $15	; 21
	db $2d	; 45
	db $d2	; 210
	db $77	; 119	'w'
	dw BlastoisePicFront
	dw BlastoisePicBack
	db $21	; 33
	db $27	; 39
	db $91	; 145
	db $37	; 55	'7'
	db $03	; 3
	db $b1	; 177
	db $7f	; 127
	db $0f	; 15
	db $ce	; 206
	db $83	; 131
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $0a	; 10
	db $2d	; 45
	db $1e	; 30
	db $23	; 35
	db $2d	; 45
	db $14	; 20
	db $07	; 7
	db $07	; 7
	db $ff	; 255
	db $35	; 53	'5'
	db $55	; 85	'U'
	dw CaterpiePicFront
	dw CaterpiePicBack
	db $21	; 33
	db $51	; 81	'Q'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $0b	; 11
	db $32	; 50	'2'
	db $14	; 20
	db $37	; 55	'7'
	db $1e	; 30
	db $19	; 25
	db $07	; 7
	db $07	; 7
	db $78	; 120	'x'
	db $48	; 72	'H'
	db $55	; 85	'U'
	dw MetapodPicFront
	dw MetapodPicBack
	db $6a	; 106	'j'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $0c	; 12
	db $3c	; 60
	db $2d	; 45
	db $32	; 50	'2'
	db $46	; 70	'F'
	db $50	; 80	'P'
	db $07	; 7
	db $02	; 2
	db $2d	; 45
	db $a0	; 160
	db $77	; 119	'w'
	dw ButterfreePicFront
	dw ButterfreePicBack
	db $5d	; 93
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $2a	; 42
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $f0	; 240
	db $43	; 67	'C'
	db $28	; 40
	db $02	; 2
	db $00	; 0
	db $0d	; 13
	db $28	; 40
	db $23	; 35
	db $1e	; 30
	db $32	; 50	'2'
	db $14	; 20
	db $07	; 7
	db $03	; 3
	db $ff	; 255
	db $34	; 52	'4'
	db $55	; 85	'U'
	dw WeedlePicFront
	dw WeedlePicBack
	db $28	; 40
	db $51	; 81	'Q'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $0e	; 14
	db $2d	; 45
	db $19	; 25
	db $32	; 50	'2'
	db $23	; 35
	db $19	; 25
	db $07	; 7
	db $03	; 3
	db $78	; 120	'x'
	db $47	; 71	'G'
	db $55	; 85	'U'
	dw KakunaPicFront
	dw KakunaPicBack
	db $6a	; 106	'j'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $0f	; 15
	db $41	; 65	'A'
	db $50	; 80	'P'
	db $28	; 40
	db $4b	; 75	'K'
	db $2d	; 45
	db $07	; 7
	db $03	; 3
	db $2d	; 45
	db $9f	; 159
	db $77	; 119	'w'
	dw BeedrillPicFront
	dw BeedrillPicBack
	db $1f	; 31
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $24	; 36
	db $43	; 67	'C'
	db $18	; 24
	db $c0	; 192
	db $c3	; 195
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $10	; 16
	db $28	; 40
	db $2d	; 45
	db $28	; 40
	db $38	; 56	'8'
	db $23	; 35
	db $00	; 0
	db $02	; 2
	db $ff	; 255
	db $37	; 55	'7'
	db $55	; 85	'U'
	dw PidgeyPicFront
	dw PidgeyPicBack
	db $10	; 16
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $2a	; 42
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $43	; 67	'C'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $11	; 17
	db $3f	; 63
	db $3c	; 60
	db $37	; 55	'7'
	db $47	; 71	'G'
	db $32	; 50	'2'
	db $00	; 0
	db $02	; 2
	db $78	; 120	'x'
	db $71	; 113	'q'
	db $66	; 102	'f'
	dw PidgeottoPicFront
	dw PidgeottoPicBack
	db $10	; 16
	db $1c	; 28
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $2a	; 42
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $43	; 67	'C'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $12	; 18
	db $53	; 83	'S'
	db $50	; 80	'P'
	db $4b	; 75	'K'
	db $5b	; 91
	db $46	; 70	'F'
	db $00	; 0
	db $02	; 2
	db $2d	; 45
	db $ac	; 172
	db $77	; 119	'w'
	dw PidgeotPicFront
	dw PidgeotPicBack
	db $10	; 16
	db $1c	; 28
	db $62	; 98	'b'
	db $00	; 0
	db $03	; 3
	db $2a	; 42
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $43	; 67	'C'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $13	; 19
	db $1e	; 30
	db $38	; 56	'8'
	db $23	; 35
	db $48	; 72	'H'
	db $19	; 25
	db $00	; 0
	db $00	; 0
	db $ff	; 255
	db $39	; 57	'9'
	db $55	; 85	'U'
	dw RattataPicFront
	dw RattataPicBack
	db $21	; 33
	db $27	; 39
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $2f	; 47
	db $88	; 136
	db $c9	; 201
	db $c2	; 194
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $14	; 20
	db $37	; 55	'7'
	db $51	; 81	'Q'
	db $3c	; 60
	db $61	; 97	'a'
	db $32	; 50	'2'
	db $00	; 0
	db $00	; 0
	db $5a	; 90	'Z'
	db $74	; 116	't'
	db $66	; 102	'f'
	dw RaticatePicFront
	dw RaticatePicBack
	db $21	; 33
	db $27	; 39
	db $62	; 98	'b'
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $7f	; 127
	db $88	; 136
	db $c9	; 201
	db $c2	; 194
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $15	; 21
	db $28	; 40
	db $3c	; 60
	db $1e	; 30
	db $46	; 70	'F'
	db $1f	; 31
	db $00	; 0
	db $02	; 2
	db $ff	; 255
	db $3a	; 58
	db $55	; 85	'U'
	dw SpearowPicFront
	dw SpearowPicBack
	db $40	; 64
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $2a	; 42
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $42	; 66	'B'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $16	; 22
	db $41	; 65	'A'
	db $5a	; 90	'Z'
	db $41	; 65	'A'
	db $64	; 100	'd'
	db $3d	; 61
	db $00	; 0
	db $02	; 2
	db $5a	; 90	'Z'
	db $a2	; 162
	db $77	; 119	'w'
	dw FearowPicFront
	dw FearowPicBack
	db $40	; 64
	db $2d	; 45
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $2a	; 42
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $42	; 66	'B'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $17	; 23
	db $23	; 35
	db $3c	; 60
	db $2c	; 44
	db $37	; 55	'7'
	db $28	; 40
	db $03	; 3
	db $03	; 3
	db $ff	; 255
	db $3e	; 62
	db $55	; 85	'U'
	dw EkansPicFront
	dw EkansPicBack
	db $23	; 35
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $03	; 3
	db $18	; 24
	db $ce	; 206
	db $82	; 130
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $18	; 24
	db $3c	; 60
	db $55	; 85	'U'
	db $45	; 69	'E'
	db $50	; 80	'P'
	db $41	; 65	'A'
	db $03	; 3
	db $03	; 3
	db $5a	; 90	'Z'
	db $93	; 147
	db $77	; 119	'w'
	dw ArbokPicFront
	dw ArbokPicBack
	db $23	; 35
	db $2b	; 43
	db $28	; 40
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $43	; 67	'C'
	db $18	; 24
	db $ce	; 206
	db $82	; 130
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $19	; 25
	db $23	; 35
	db $37	; 55	'7'
	db $1e	; 30
	db $5a	; 90	'Z'
	db $32	; 50	'2'
	db $17	; 23
	db $17	; 23
	db $be	; 190
	db $52	; 82	'R'
	db $55	; 85	'U'
	dw PikachuPicFront
	dw PikachuPicBack
	db $54	; 84	'T'
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $83	; 131
	db $8d	; 141
	db $c1	; 193
	db $c3	; 195
	db $18	; 24
	db $42	; 66	'B'
	db $00	; 0
	db $1a	; 26
	db $3c	; 60
	db $5a	; 90	'Z'
	db $37	; 55	'7'
	db $64	; 100	'd'
	db $5a	; 90	'Z'
	db $17	; 23
	db $17	; 23
	db $4b	; 75	'K'
	db $7a	; 122	'z'
	db $77	; 119	'w'
	dw RaichuPicFront
	dw RaichuPicBack
	db $54	; 84	'T'
	db $2d	; 45
	db $56	; 86	'V'
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $c3	; 195
	db $8d	; 141
	db $c1	; 193
	db $c3	; 195
	db $18	; 24
	db $42	; 66	'B'
	db $00	; 0
	db $1b	; 27
	db $32	; 50	'2'
	db $4b	; 75	'K'
	db $55	; 85	'U'
	db $28	; 40
	db $1e	; 30
	db $04	; 4
	db $04	; 4
	db $ff	; 255
	db $5d	; 93
	db $55	; 85	'U'
	dw SandshrewPicFront
	dw SandshrewPicBack
	db $0a	; 10
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $03	; 3
	db $0d	; 13
	db $ce	; 206
	db $c2	; 194
	db $88	; 136
	db $26	; 38
	db $00	; 0
	db $1c	; 28
	db $4b	; 75	'K'
	db $64	; 100	'd'
	db $6e	; 110	'n'
	db $41	; 65	'A'
	db $37	; 55	'7'
	db $04	; 4
	db $04	; 4
	db $5a	; 90	'Z'
	db $a3	; 163
	db $66	; 102	'f'
	dw SandslashPicFront
	dw SandslashPicBack
	db $0a	; 10
	db $1c	; 28
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $43	; 67	'C'
	db $0d	; 13
	db $ce	; 206
	db $c2	; 194
	db $88	; 136
	db $26	; 38
	db $00	; 0
	db $1d	; 29
	db $37	; 55	'7'
	db $2f	; 47
	db $34	; 52	'4'
	db $29	; 41
	db $28	; 40
	db $03	; 3
	db $03	; 3
	db $eb	; 235
	db $3b	; 59
	db $55	; 85	'U'
	dw NidoranFPicFront
	dw NidoranFPicBack
	db $2d	; 45
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $a0	; 160
	db $23	; 35
	db $88	; 136
	db $c1	; 193
	db $83	; 131
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $1e	; 30
	db $46	; 70	'F'
	db $3e	; 62
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $37	; 55	'7'
	db $03	; 3
	db $03	; 3
	db $78	; 120	'x'
	db $75	; 117	'u'
	db $66	; 102	'f'
	dw NidorinaPicFront
	dw NidorinaPicBack
	db $2d	; 45
	db $21	; 33
	db $0a	; 10
	db $00	; 0
	db $03	; 3
	db $e0	; 224
	db $3f	; 63
	db $88	; 136
	db $c1	; 193
	db $83	; 131
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $1f	; 31
	db $5a	; 90	'Z'
	db $52	; 82	'R'
	db $57	; 87	'W'
	db $4c	; 76	'L'
	db $4b	; 75	'K'
	db $03	; 3
	db $04	; 4
	db $2d	; 45
	db $c2	; 194
	db $77	; 119	'w'
	dw NidoqueenPicFront
	dw NidoqueenPicBack
	db $21	; 33
	db $0a	; 10
	db $27	; 39
	db $22	; 34
	db $03	; 3
	db $f1	; 241
	db $ff	; 255
	db $8f	; 143
	db $c7	; 199
	db $a3	; 163
	db $88	; 136
	db $32	; 50	'2'
	db $00	; 0
	db $20	; 32
	db $2e	; 46
	db $39	; 57	'9'
	db $28	; 40
	db $32	; 50	'2'
	db $28	; 40
	db $03	; 3
	db $03	; 3
	db $eb	; 235
	db $3c	; 60
	db $55	; 85	'U'
	dw NidoranMPicFront
	dw NidoranMPicBack
	db $2b	; 43
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $e0	; 224
	db $23	; 35
	db $88	; 136
	db $c1	; 193
	db $83	; 131
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $21	; 33
	db $3d	; 61
	db $48	; 72	'H'
	db $39	; 57	'9'
	db $41	; 65	'A'
	db $37	; 55	'7'
	db $03	; 3
	db $03	; 3
	db $78	; 120	'x'
	db $76	; 118	'v'
	db $66	; 102	'f'
	dw NidorinoPicFront
	dw NidorinoPicBack
	db $2b	; 43
	db $21	; 33
	db $1e	; 30
	db $00	; 0
	db $03	; 3
	db $e0	; 224
	db $3f	; 63
	db $88	; 136
	db $c1	; 193
	db $83	; 131
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $22	; 34
	db $51	; 81	'Q'
	db $5c	; 92
	db $4d	; 77	'M'
	db $55	; 85	'U'
	db $4b	; 75	'K'
	db $03	; 3
	db $04	; 4
	db $2d	; 45
	db $c3	; 195
	db $77	; 119	'w'
	dw NidokingPicFront
	dw NidokingPicBack
	db $21	; 33
	db $1e	; 30
	db $28	; 40
	db $25	; 37
	db $03	; 3
	db $f1	; 241
	db $ff	; 255
	db $8f	; 143
	db $c7	; 199
	db $a3	; 163
	db $88	; 136
	db $32	; 50	'2'
	db $00	; 0
	db $23	; 35
	db $46	; 70	'F'
	db $2d	; 45
	db $30	; 48	'0'
	db $23	; 35
	db $3c	; 60
	db $00	; 0
	db $00	; 0
	db $96	; 150
	db $44	; 68	'D'
	db $55	; 85	'U'
	dw ClefairyPicFront
	dw ClefairyPicBack
	db $01	; 1
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $04	; 4
	db $b1	; 177
	db $3f	; 63
	db $af	; 175
	db $f1	; 241
	db $a7	; 167
	db $38	; 56	'8'
	db $63	; 99	'c'
	db $00	; 0
	db $24	; 36
	db $5f	; 95
	db $46	; 70	'F'
	db $49	; 73	'I'
	db $3c	; 60
	db $55	; 85	'U'
	db $00	; 0
	db $00	; 0
	db $19	; 25
	db $81	; 129
	db $66	; 102	'f'
	dw ClefablePicFront
	dw ClefablePicBack
	db $2f	; 47
	db $03	; 3
	db $6b	; 107	'k'
	db $76	; 118	'v'
	db $04	; 4
	db $b1	; 177
	db $7f	; 127
	db $af	; 175
	db $f1	; 241
	db $a7	; 167
	db $38	; 56	'8'
	db $63	; 99	'c'
	db $00	; 0
	db $25	; 37
	db $26	; 38
	db $29	; 41
	db $28	; 40
	db $41	; 65	'A'
	db $41	; 65	'A'
	db $14	; 20
	db $14	; 20
	db $be	; 190
	db $3f	; 63
	db $66	; 102	'f'
	dw VulpixPicFront
	dw VulpixPicBack
	db $34	; 52	'4'
	db $27	; 39
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $03	; 3
	db $08	; 8
	db $c8	; 200
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $26	; 38
	db $49	; 73	'I'
	db $4c	; 76	'L'
	db $4b	; 75	'K'
	db $64	; 100	'd'
	db $64	; 100	'd'
	db $14	; 20
	db $14	; 20
	db $4b	; 75	'K'
	db $b2	; 178
	db $77	; 119	'w'
	dw NinetalesPicFront
	dw NinetalesPicBack
	db $34	; 52	'4'
	db $27	; 39
	db $62	; 98	'b'
	db $2e	; 46
	db $00	; 0
	db $a0	; 160
	db $43	; 67	'C'
	db $08	; 8
	db $c8	; 200
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $27	; 39
	db $73	; 115	's'
	db $2d	; 45
	db $14	; 20
	db $14	; 20
	db $19	; 25
	db $00	; 0
	db $00	; 0
	db $aa	; 170
	db $4c	; 76	'L'
	db $55	; 85	'U'
	dw JigglypuffPicFront
	dw JigglypuffPicBack
	db $2f	; 47
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $04	; 4
	db $b1	; 177
	db $3f	; 63
	db $af	; 175
	db $f1	; 241
	db $a3	; 163
	db $38	; 56	'8'
	db $63	; 99	'c'
	db $00	; 0
	db $28	; 40
	db $8c	; 140
	db $46	; 70	'F'
	db $2d	; 45
	db $2d	; 45
	db $32	; 50	'2'
	db $00	; 0
	db $00	; 0
	db $32	; 50	'2'
	db $6d	; 109	'm'
	db $66	; 102	'f'
	dw WigglytuffPicFront
	dw WigglytuffPicBack
	db $2f	; 47
	db $32	; 50	'2'
	db $6f	; 111	'o'
	db $03	; 3
	db $04	; 4
	db $b1	; 177
	db $7f	; 127
	db $af	; 175
	db $f1	; 241
	db $a3	; 163
	db $38	; 56	'8'
	db $63	; 99	'c'
	db $00	; 0
	db $29	; 41
	db $28	; 40
	db $2d	; 45
	db $23	; 35
	db $37	; 55	'7'
	db $28	; 40
	db $03	; 3
	db $02	; 2
	db $ff	; 255
	db $36	; 54	'6'
	db $55	; 85	'U'
	dw ZubatPicFront
	dw ZubatPicBack
	db $8d	; 141
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $2a	; 42
	db $03	; 3
	db $18	; 24
	db $c0	; 192
	db $42	; 66	'B'
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $2a	; 42
	db $4b	; 75	'K'
	db $50	; 80	'P'
	db $46	; 70	'F'
	db $5a	; 90	'Z'
	db $4b	; 75	'K'
	db $03	; 3
	db $02	; 2
	db $5a	; 90	'Z'
	db $ab	; 171
	db $77	; 119	'w'
	dw GolbatPicFront
	dw GolbatPicBack
	db $8d	; 141
	db $67	; 103	'g'
	db $2c	; 44
	db $00	; 0
	db $00	; 0
	db $2a	; 42
	db $43	; 67	'C'
	db $18	; 24
	db $c0	; 192
	db $42	; 66	'B'
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $2b	; 43
	db $2d	; 45
	db $32	; 50	'2'
	db $37	; 55	'7'
	db $1e	; 30
	db $4b	; 75	'K'
	db $16	; 22
	db $03	; 3
	db $ff	; 255
	db $4e	; 78	'N'
	db $55	; 85	'U'
	dw OddishPicFront
	dw OddishPicBack
	db $47	; 71	'G'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $24	; 36
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $2c	; 44
	db $3c	; 60
	db $41	; 65	'A'
	db $46	; 70	'F'
	db $28	; 40
	db $55	; 85	'U'
	db $16	; 22
	db $03	; 3
	db $78	; 120	'x'
	db $84	; 132
	db $66	; 102	'f'
	dw GloomPicFront
	dw GloomPicBack
	db $47	; 71	'G'
	db $4d	; 77	'M'
	db $4e	; 78	'N'
	db $00	; 0
	db $03	; 3
	db $24	; 36
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $2d	; 45
	db $4b	; 75	'K'
	db $50	; 80	'P'
	db $55	; 85	'U'
	db $32	; 50	'2'
	db $64	; 100	'd'
	db $16	; 22
	db $03	; 3
	db $2d	; 45
	db $b8	; 184
	db $77	; 119	'w'
	dw VileplumePicFront
	dw VileplumePicBack
	db $4e	; 78	'N'
	db $4f	; 79	'O'
	db $33	; 51	'3'
	db $50	; 80	'P'
	db $03	; 3
	db $a4	; 164
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $2e	; 46
	db $23	; 35
	db $46	; 70	'F'
	db $37	; 55	'7'
	db $19	; 25
	db $37	; 55	'7'
	db $07	; 7
	db $16	; 22
	db $be	; 190
	db $46	; 70	'F'
	db $55	; 85	'U'
	dw ParasPicFront
	dw ParasPicBack
	db $0a	; 10
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $03	; 3
	db $38	; 56	'8'
	db $c8	; 200
	db $83	; 131
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $2f	; 47
	db $3c	; 60
	db $5f	; 95
	db $50	; 80	'P'
	db $1e	; 30
	db $50	; 80	'P'
	db $07	; 7
	db $16	; 22
	db $4b	; 75	'K'
	db $80	; 128
	db $77	; 119	'w'
	dw ParasectPicFront
	dw ParasectPicBack
	db $0a	; 10
	db $4e	; 78	'N'
	db $8d	; 141
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $c8	; 200
	db $83	; 131
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $30	; 48	'0'
	db $3c	; 60
	db $37	; 55	'7'
	db $32	; 50	'2'
	db $2d	; 45
	db $28	; 40
	db $07	; 7
	db $03	; 3
	db $be	; 190
	db $4b	; 75	'K'
	db $55	; 85	'U'
	dw VenonatPicFront
	dw VenonatPicBack
	db $21	; 33
	db $32	; 50	'2'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $03	; 3
	db $38	; 56	'8'
	db $d0	; 208
	db $03	; 3
	db $28	; 40
	db $02	; 2
	db $00	; 0
	db $31	; 49	'1'
	db $46	; 70	'F'
	db $41	; 65	'A'
	db $3c	; 60
	db $5a	; 90	'Z'
	db $5a	; 90	'Z'
	db $07	; 7
	db $03	; 3
	db $4b	; 75	'K'
	db $8a	; 138
	db $77	; 119	'w'
	dw VenomothPicFront
	dw VenomothPicBack
	db $21	; 33
	db $32	; 50	'2'
	db $4d	; 77	'M'
	db $8d	; 141
	db $00	; 0
	db $2a	; 42
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $f0	; 240
	db $43	; 67	'C'
	db $28	; 40
	db $02	; 2
	db $00	; 0
	db $32	; 50	'2'
	db $0a	; 10
	db $37	; 55	'7'
	db $19	; 25
	db $5f	; 95
	db $2d	; 45
	db $04	; 4
	db $04	; 4
	db $ff	; 255
	db $51	; 81	'Q'
	db $55	; 85	'U'
	dw DiglettPicFront
	dw DiglettPicBack
	db $0a	; 10
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $03	; 3
	db $08	; 8
	db $ce	; 206
	db $02	; 2
	db $88	; 136
	db $02	; 2
	db $00	; 0
	db $33	; 51	'3'
	db $23	; 35
	db $50	; 80	'P'
	db $32	; 50	'2'
	db $78	; 120	'x'
	db $46	; 70	'F'
	db $04	; 4
	db $04	; 4
	db $32	; 50	'2'
	db $99	; 153
	db $66	; 102	'f'
	dw DugtrioPicFront
	dw DugtrioPicBack
	db $0a	; 10
	db $2d	; 45
	db $5b	; 91
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $43	; 67	'C'
	db $08	; 8
	db $ce	; 206
	db $02	; 2
	db $88	; 136
	db $02	; 2
	db $00	; 0
	db $34	; 52	'4'
	db $28	; 40
	db $2d	; 45
	db $23	; 35
	db $5a	; 90	'Z'
	db $28	; 40
	db $00	; 0
	db $00	; 0
	db $ff	; 255
	db $45	; 69	'E'
	db $55	; 85	'U'
	dw MeowthPicFront
	dw MeowthPicBack
	db $0a	; 10
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $8f	; 143
	db $88	; 136
	db $c1	; 193
	db $c2	; 194
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $35	; 53	'5'
	db $41	; 65	'A'
	db $46	; 70	'F'
	db $3c	; 60
	db $73	; 115	's'
	db $41	; 65	'A'
	db $00	; 0
	db $00	; 0
	db $5a	; 90	'Z'
	db $94	; 148
	db $77	; 119	'w'
	dw PersianPicFront
	dw PersianPicBack
	db $0a	; 10
	db $2d	; 45
	db $2c	; 44
	db $67	; 103	'g'
	db $00	; 0
	db $a0	; 160
	db $cf	; 207
	db $88	; 136
	db $c1	; 193
	db $c2	; 194
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $36	; 54	'6'
	db $32	; 50	'2'
	db $34	; 52	'4'
	db $30	; 48	'0'
	db $37	; 55	'7'
	db $32	; 50	'2'
	db $15	; 21
	db $15	; 21
	db $be	; 190
	db $50	; 80	'P'
	db $55	; 85	'U'
	dw PsyduckPicFront
	dw PsyduckPicBack
	db $0a	; 10
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $bf	; 191
	db $0f	; 15
	db $c8	; 200
	db $c2	; 194
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $37	; 55	'7'
	db $50	; 80	'P'
	db $52	; 82	'R'
	db $4e	; 78	'N'
	db $55	; 85	'U'
	db $50	; 80	'P'
	db $15	; 21
	db $15	; 21
	db $4b	; 75	'K'
	db $ae	; 174
	db $77	; 119	'w'
	dw GolduckPicFront
	dw GolduckPicBack
	db $0a	; 10
	db $27	; 39
	db $32	; 50	'2'
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $ff	; 255
	db $0f	; 15
	db $c8	; 200
	db $c2	; 194
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $38	; 56	'8'
	db $28	; 40
	db $50	; 80	'P'
	db $23	; 35
	db $46	; 70	'F'
	db $23	; 35
	db $01	; 1
	db $01	; 1
	db $be	; 190
	db $4a	; 74	'J'
	db $55	; 85	'U'
	dw MankeyPicFront
	dw MankeyPicBack
	db $0a	; 10
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $83	; 131
	db $8f	; 143
	db $c9	; 201
	db $c6	; 198
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $39	; 57	'9'
	db $41	; 65	'A'
	db $69	; 105	'i'
	db $3c	; 60
	db $5f	; 95
	db $3c	; 60
	db $01	; 1
	db $01	; 1
	db $4b	; 75	'K'
	db $95	; 149
	db $77	; 119	'w'
	dw PrimeapePicFront
	dw PrimeapePicBack
	db $0a	; 10
	db $2b	; 43
	db $02	; 2
	db $9a	; 154
	db $00	; 0
	db $b1	; 177
	db $c3	; 195
	db $8f	; 143
	db $c9	; 201
	db $c6	; 198
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $3a	; 58
	db $37	; 55	'7'
	db $46	; 70	'F'
	db $2d	; 45
	db $3c	; 60
	db $32	; 50	'2'
	db $14	; 20
	db $14	; 20
	db $be	; 190
	db $5b	; 91
	db $55	; 85	'U'
	dw GrowlithePicFront
	dw GrowlithePicBack
	db $2c	; 44
	db $2e	; 46
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $a0	; 160
	db $03	; 3
	db $48	; 72	'H'
	db $c8	; 200
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $3b	; 59
	db $5a	; 90	'Z'
	db $6e	; 110	'n'
	db $50	; 80	'P'
	db $5f	; 95
	db $50	; 80	'P'
	db $14	; 20
	db $14	; 20
	db $4b	; 75	'K'
	db $d5	; 213
	db $77	; 119	'w'
	dw ArcaninePicFront
	dw ArcaninePicBack
	db $2e	; 46
	db $34	; 52	'4'
	db $2b	; 43
	db $24	; 36
	db $05	; 5
	db $a0	; 160
	db $43	; 67	'C'
	db $48	; 72	'H'
	db $e8	; 232
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $3c	; 60
	db $28	; 40
	db $32	; 50	'2'
	db $28	; 40
	db $5a	; 90	'Z'
	db $28	; 40
	db $15	; 21
	db $15	; 21
	db $ff	; 255
	db $4d	; 77	'M'
	db $55	; 85	'U'
	dw PoliwagPicFront
	dw PoliwagPicBack
	db $91	; 145
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $a0	; 160
	db $3f	; 63
	db $08	; 8
	db $d0	; 208
	db $82	; 130
	db $28	; 40
	db $12	; 18
	db $00	; 0
	db $3d	; 61
	db $41	; 65	'A'
	db $41	; 65	'A'
	db $41	; 65	'A'
	db $5a	; 90	'Z'
	db $32	; 50	'2'
	db $15	; 21
	db $15	; 21
	db $78	; 120	'x'
	db $83	; 131
	db $66	; 102	'f'
	dw PoliwhirlPicFront
	dw PoliwhirlPicBack
	db $91	; 145
	db $5f	; 95
	db $37	; 55	'7'
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $3f	; 63
	db $0f	; 15
	db $d6	; 214
	db $86	; 134
	db $28	; 40
	db $32	; 50	'2'
	db $00	; 0
	db $3e	; 62
	db $5a	; 90	'Z'
	db $55	; 85	'U'
	db $5f	; 95
	db $46	; 70	'F'
	db $46	; 70	'F'
	db $15	; 21
	db $01	; 1
	db $2d	; 45
	db $b9	; 185
	db $77	; 119	'w'
	dw PoliwrathPicFront
	dw PoliwrathPicBack
	db $5f	; 95
	db $37	; 55	'7'
	db $03	; 3
	db $22	; 34
	db $03	; 3
	db $b1	; 177
	db $7f	; 127
	db $0f	; 15
	db $d6	; 214
	db $86	; 134
	db $28	; 40
	db $32	; 50	'2'
	db $00	; 0
	db $3f	; 63
	db $19	; 25
	db $14	; 20
	db $0f	; 15
	db $5a	; 90	'Z'
	db $69	; 105	'i'
	db $18	; 24
	db $18	; 24
	db $c8	; 200
	db $49	; 73	'I'
	db $55	; 85	'U'
	dw AbraPicFront
	dw AbraPicBack
	db $64	; 100	'd'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $f0	; 240
	db $87	; 135
	db $38	; 56	'8'
	db $43	; 67	'C'
	db $00	; 0
	db $40	; 64
	db $28	; 40
	db $23	; 35
	db $1e	; 30
	db $69	; 105	'i'
	db $78	; 120	'x'
	db $18	; 24
	db $18	; 24
	db $64	; 100	'd'
	db $91	; 145
	db $66	; 102	'f'
	dw KadabraPicFront
	dw KadabraPicBack
	db $64	; 100	'd'
	db $5d	; 93
	db $32	; 50	'2'
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $f8	; 248
	db $87	; 135
	db $38	; 56	'8'
	db $43	; 67	'C'
	db $00	; 0
	db $41	; 65	'A'
	db $37	; 55	'7'
	db $32	; 50	'2'
	db $2d	; 45
	db $78	; 120	'x'
	db $87	; 135
	db $18	; 24
	db $18	; 24
	db $32	; 50	'2'
	db $ba	; 186
	db $77	; 119	'w'
	dw AlakazamPicFront
	dw AlakazamPicBack
	db $64	; 100	'd'
	db $5d	; 93
	db $32	; 50	'2'
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $43	; 67	'C'
	db $0f	; 15
	db $f8	; 248
	db $87	; 135
	db $38	; 56	'8'
	db $43	; 67	'C'
	db $00	; 0
	db $42	; 66	'B'
	db $46	; 70	'F'
	db $50	; 80	'P'
	db $32	; 50	'2'
	db $23	; 35
	db $23	; 35
	db $01	; 1
	db $01	; 1
	db $b4	; 180
	db $58	; 88	'X'
	db $55	; 85	'U'
	dw MachopPicFront
	dw MachopPicBack
	db $02	; 2
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $ce	; 206
	db $a6	; 166
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $43	; 67	'C'
	db $50	; 80	'P'
	db $64	; 100	'd'
	db $46	; 70	'F'
	db $2d	; 45
	db $32	; 50	'2'
	db $01	; 1
	db $01	; 1
	db $5a	; 90	'Z'
	db $92	; 146
	db $77	; 119	'w'
	dw MachokePicFront
	dw MachokePicBack
	db $02	; 2
	db $43	; 67	'C'
	db $2b	; 43
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $ce	; 206
	db $a6	; 166
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $44	; 68	'D'
	db $5a	; 90	'Z'
	db $82	; 130
	db $50	; 80	'P'
	db $37	; 55	'7'
	db $41	; 65	'A'
	db $01	; 1
	db $01	; 1
	db $2d	; 45
	db $c1	; 193
	db $77	; 119	'w'
	dw MachampPicFront
	dw MachampPicBack
	db $02	; 2
	db $43	; 67	'C'
	db $2b	; 43
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $43	; 67	'C'
	db $0f	; 15
	db $ce	; 206
	db $a6	; 166
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $45	; 69	'E'
	db $32	; 50	'2'
	db $4b	; 75	'K'
	db $23	; 35
	db $28	; 40
	db $46	; 70	'F'
	db $16	; 22
	db $03	; 3
	db $ff	; 255
	db $54	; 84	'T'
	db $55	; 85	'U'
	dw BellsproutPicFront
	dw BellsproutPicBack
	db $16	; 22
	db $4a	; 74	'J'
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $24	; 36
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $46	; 70	'F'
	db $41	; 65	'A'
	db $5a	; 90	'Z'
	db $32	; 50	'2'
	db $37	; 55	'7'
	db $55	; 85	'U'
	db $16	; 22
	db $03	; 3
	db $78	; 120	'x'
	db $97	; 151
	db $66	; 102	'f'
	dw WeepinbellPicFront
	dw WeepinbellPicBack
	db $16	; 22
	db $4a	; 74	'J'
	db $23	; 35
	db $00	; 0
	db $03	; 3
	db $24	; 36
	db $03	; 3
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $47	; 71	'G'
	db $50	; 80	'P'
	db $69	; 105	'i'
	db $41	; 65	'A'
	db $46	; 70	'F'
	db $64	; 100	'd'
	db $16	; 22
	db $03	; 3
	db $2d	; 45
	db $bf	; 191
	db $77	; 119	'w'
	dw VictreebelPicFront
	dw VictreebelPicBack
	db $4f	; 79	'O'
	db $4e	; 78	'N'
	db $33	; 51	'3'
	db $4b	; 75	'K'
	db $03	; 3
	db $a4	; 164
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $48	; 72	'H'
	db $28	; 40
	db $28	; 40
	db $23	; 35
	db $46	; 70	'F'
	db $64	; 100	'd'
	db $15	; 21
	db $03	; 3
	db $be	; 190
	db $69	; 105	'i'
	db $55	; 85	'U'
	dw TentacoolPicFront
	dw TentacoolPicBack
	db $33	; 51	'3'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $24	; 36
	db $3f	; 63
	db $18	; 24
	db $c0	; 192
	db $83	; 131
	db $08	; 8
	db $16	; 22
	db $00	; 0
	db $49	; 73	'I'
	db $50	; 80	'P'
	db $46	; 70	'F'
	db $41	; 65	'A'
	db $64	; 100	'd'
	db $78	; 120	'x'
	db $15	; 21
	db $03	; 3
	db $3c	; 60
	db $cd	; 205
	db $66	; 102	'f'
	dw TentacruelPicFront
	dw TentacruelPicBack
	db $33	; 51	'3'
	db $30	; 48	'0'
	db $23	; 35
	db $00	; 0
	db $05	; 5
	db $24	; 36
	db $7f	; 127
	db $18	; 24
	db $c0	; 192
	db $83	; 131
	db $08	; 8
	db $16	; 22
	db $00	; 0
	db $4a	; 74	'J'
	db $28	; 40
	db $50	; 80	'P'
	db $64	; 100	'd'
	db $14	; 20
	db $1e	; 30
	db $05	; 5
	db $04	; 4
	db $ff	; 255
	db $56	; 86	'V'
	db $55	; 85	'U'
	dw GeodudePicFront
	dw GeodudePicBack
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $a1	; 161
	db $03	; 3
	db $0f	; 15
	db $ce	; 206
	db $2e	; 46
	db $c8	; 200
	db $22	; 34
	db $00	; 0
	db $4b	; 75	'K'
	db $37	; 55	'7'
	db $5f	; 95
	db $73	; 115	's'
	db $23	; 35
	db $2d	; 45
	db $05	; 5
	db $04	; 4
	db $78	; 120	'x'
	db $86	; 134
	db $66	; 102	'f'
	dw GravelerPicFront
	dw GravelerPicBack
	db $21	; 33
	db $6f	; 111	'o'
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $a1	; 161
	db $03	; 3
	db $0f	; 15
	db $ce	; 206
	db $2e	; 46
	db $c8	; 200
	db $22	; 34
	db $00	; 0
	db $4c	; 76	'L'
	db $50	; 80	'P'
	db $6e	; 110	'n'
	db $82	; 130
	db $2d	; 45
	db $37	; 55	'7'
	db $05	; 5
	db $04	; 4
	db $2d	; 45
	db $b1	; 177
	db $66	; 102	'f'
	dw GolemPicFront
	dw GolemPicBack
	db $21	; 33
	db $6f	; 111	'o'
	db $00	; 0
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $43	; 67	'C'
	db $0f	; 15
	db $ce	; 206
	db $2e	; 46
	db $c8	; 200
	db $22	; 34
	db $00	; 0
	db $4d	; 77	'M'
	db $32	; 50	'2'
	db $55	; 85	'U'
	db $37	; 55	'7'
	db $5a	; 90	'Z'
	db $41	; 65	'A'
	db $14	; 20
	db $14	; 20
	db $be	; 190
	db $98	; 152
	db $66	; 102	'f'
	dw PonytaPicFront
	dw PonytaPicBack
	db $34	; 52	'4'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $e0	; 224
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $4e	; 78	'N'
	db $41	; 65	'A'
	db $64	; 100	'd'
	db $46	; 70	'F'
	db $69	; 105	'i'
	db $50	; 80	'P'
	db $14	; 20
	db $14	; 20
	db $3c	; 60
	db $c0	; 192
	db $77	; 119	'w'
	dw RapidashPicFront
	dw RapidashPicBack
	db $34	; 52	'4'
	db $27	; 39
	db $17	; 23
	db $2d	; 45
	db $00	; 0
	db $e0	; 224
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $4f	; 79	'O'
	db $5a	; 90	'Z'
	db $41	; 65	'A'
	db $41	; 65	'A'
	db $0f	; 15
	db $28	; 40
	db $15	; 21
	db $18	; 24
	db $be	; 190
	db $63	; 99	'c'
	db $55	; 85	'U'
	dw SlowpokePicFront
	dw SlowpokePicBack
	db $5d	; 93
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $bf	; 191
	db $08	; 8
	db $fe	; 254
	db $e3	; 227
	db $38	; 56	'8'
	db $73	; 115	's'
	db $00	; 0
	db $50	; 80	'P'
	db $5f	; 95
	db $4b	; 75	'K'
	db $6e	; 110	'n'
	db $1e	; 30
	db $50	; 80	'P'
	db $15	; 21
	db $18	; 24
	db $4b	; 75	'K'
	db $a4	; 164
	db $77	; 119	'w'
	dw SlowbroPicFront
	dw SlowbroPicBack
	db $5d	; 93
	db $32	; 50	'2'
	db $1d	; 29
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $ff	; 255
	db $0f	; 15
	db $fe	; 254
	db $e3	; 227
	db $38	; 56	'8'
	db $73	; 115	's'
	db $00	; 0
	db $51	; 81	'Q'
	db $19	; 25
	db $23	; 35
	db $46	; 70	'F'
	db $2d	; 45
	db $5f	; 95
	db $17	; 23
	db $17	; 23
	db $be	; 190
	db $59	; 89	'Y'
	db $55	; 85	'U'
	dw MagnemitePicFront
	dw MagnemitePicBack
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $03	; 3
	db $88	; 136
	db $e1	; 225
	db $43	; 67	'C'
	db $18	; 24
	db $42	; 66	'B'
	db $00	; 0
	db $52	; 82	'R'
	db $32	; 50	'2'
	db $3c	; 60
	db $5f	; 95
	db $46	; 70	'F'
	db $78	; 120	'x'
	db $17	; 23
	db $17	; 23
	db $3c	; 60
	db $a1	; 161
	db $66	; 102	'f'
	dw MagnetonPicFront
	dw MagnetonPicBack
	db $21	; 33
	db $31	; 49	'1'
	db $54	; 84	'T'
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $43	; 67	'C'
	db $88	; 136
	db $e1	; 225
	db $43	; 67	'C'
	db $18	; 24
	db $42	; 66	'B'
	db $00	; 0
	db $53	; 83	'S'
	db $34	; 52	'4'
	db $41	; 65	'A'
	db $37	; 55	'7'
	db $3c	; 60
	db $3a	; 58
	db $00	; 0
	db $02	; 2
	db $2d	; 45
	db $5e	; 94
	db $66	; 102	'f'
	dw FarfetchdPicFront
	dw FarfetchdPicBack
	db $40	; 64
	db $1c	; 28
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $ae	; 174
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $c3	; 195
	db $08	; 8
	db $0e	; 14
	db $00	; 0
	db $54	; 84	'T'
	db $23	; 35
	db $55	; 85	'U'
	db $2d	; 45
	db $4b	; 75	'K'
	db $23	; 35
	db $00	; 0
	db $02	; 2
	db $be	; 190
	db $60	; 96
	db $55	; 85	'U'
	dw DoduoPicFront
	dw DoduoPicBack
	db $40	; 64
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a8	; 168
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $83	; 131
	db $0c	; 12
	db $0b	; 11
	db $00	; 0
	db $55	; 85	'U'
	db $3c	; 60
	db $6e	; 110	'n'
	db $46	; 70	'F'
	db $64	; 100	'd'
	db $3c	; 60
	db $00	; 0
	db $02	; 2
	db $2d	; 45
	db $9e	; 158
	db $77	; 119	'w'
	dw DodrioPicFront
	dw DodrioPicBack
	db $40	; 64
	db $2d	; 45
	db $1f	; 31
	db $00	; 0
	db $00	; 0
	db $a8	; 168
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $83	; 131
	db $0c	; 12
	db $0b	; 11
	db $00	; 0
	db $56	; 86	'V'
	db $41	; 65	'A'
	db $2d	; 45
	db $37	; 55	'7'
	db $2d	; 45
	db $46	; 70	'F'
	db $15	; 21
	db $15	; 21
	db $be	; 190
	db $64	; 100	'd'
	db $66	; 102	'f'
	dw SeelPicFront
	dw SeelPicBack
	db $1d	; 29
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $e0	; 224
	db $bf	; 191
	db $08	; 8
	db $c0	; 192
	db $82	; 130
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $57	; 87	'W'
	db $5a	; 90	'Z'
	db $46	; 70	'F'
	db $50	; 80	'P'
	db $46	; 70	'F'
	db $5f	; 95
	db $15	; 21
	db $19	; 25
	db $4b	; 75	'K'
	db $b0	; 176
	db $66	; 102	'f'
	dw DewgongPicFront
	dw DewgongPicBack
	db $1d	; 29
	db $2d	; 45
	db $3e	; 62
	db $00	; 0
	db $00	; 0
	db $e0	; 224
	db $ff	; 255
	db $08	; 8
	db $c0	; 192
	db $82	; 130
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $58	; 88	'X'
	db $50	; 80	'P'
	db $50	; 80	'P'
	db $32	; 50	'2'
	db $19	; 25
	db $28	; 40
	db $03	; 3
	db $03	; 3
	db $be	; 190
	db $5a	; 90	'Z'
	db $55	; 85	'U'
	dw GrimerPicFront
	dw GrimerPicBack
	db $01	; 1
	db $32	; 50	'2'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $00	; 0
	db $98	; 152
	db $c1	; 193
	db $2a	; 42
	db $48	; 72	'H'
	db $02	; 2
	db $00	; 0
	db $59	; 89	'Y'
	db $69	; 105	'i'
	db $69	; 105	'i'
	db $4b	; 75	'K'
	db $32	; 50	'2'
	db $41	; 65	'A'
	db $03	; 3
	db $03	; 3
	db $4b	; 75	'K'
	db $9d	; 157
	db $77	; 119	'w'
	dw MukPicFront
	dw MukPicBack
	db $01	; 1
	db $32	; 50	'2'
	db $8b	; 139
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $40	; 64
	db $98	; 152
	db $c1	; 193
	db $2a	; 42
	db $48	; 72	'H'
	db $02	; 2
	db $00	; 0
	db $5a	; 90	'Z'
	db $1e	; 30
	db $41	; 65	'A'
	db $64	; 100	'd'
	db $28	; 40
	db $2d	; 45
	db $15	; 21
	db $15	; 21
	db $be	; 190
	db $61	; 97	'a'
	db $55	; 85	'U'
	dw ShellderPicFront
	dw ShellderPicBack
	db $21	; 33
	db $6e	; 110	'n'
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $20	; 32
	db $3f	; 63
	db $08	; 8
	db $e0	; 224
	db $4b	; 75	'K'
	db $48	; 72	'H'
	db $13	; 19
	db $00	; 0
	db $5b	; 91
	db $32	; 50	'2'
	db $5f	; 95
	db $b4	; 180
	db $46	; 70	'F'
	db $55	; 85	'U'
	db $15	; 21
	db $19	; 25
	db $3c	; 60
	db $cb	; 203
	db $77	; 119	'w'
	dw CloysterPicFront
	dw CloysterPicBack
	db $6e	; 110	'n'
	db $30	; 48	'0'
	db $80	; 128
	db $3e	; 62
	db $05	; 5
	db $20	; 32
	db $7f	; 127
	db $08	; 8
	db $e0	; 224
	db $4b	; 75	'K'
	db $48	; 72	'H'
	db $13	; 19
	db $00	; 0
	db $5c	; 92
	db $1e	; 30
	db $23	; 35
	db $1e	; 30
	db $50	; 80	'P'
	db $64	; 100	'd'
	db $08	; 8
	db $03	; 3
	db $be	; 190
	db $5f	; 95
	db $77	; 119	'w'
	dw GastlyPicFront
	dw GastlyPicBack
	db $7a	; 122	'z'
	db $6d	; 109	'm'
	db $65	; 101	'e'
	db $00	; 0
	db $03	; 3
	db $20	; 32
	db $00	; 0
	db $98	; 152
	db $d1	; 209
	db $0a	; 10
	db $6a	; 106	'j'
	db $02	; 2
	db $00	; 0
	db $5d	; 93
	db $2d	; 45
	db $32	; 50	'2'
	db $2d	; 45
	db $5f	; 95
	db $73	; 115	's'
	db $08	; 8
	db $03	; 3
	db $5a	; 90	'Z'
	db $7e	; 126
	db $66	; 102	'f'
	dw HaunterPicFront
	dw HaunterPicBack
	db $7a	; 122	'z'
	db $6d	; 109	'm'
	db $65	; 101	'e'
	db $00	; 0
	db $03	; 3
	db $20	; 32
	db $00	; 0
	db $98	; 152
	db $d1	; 209
	db $0a	; 10
	db $6a	; 106	'j'
	db $02	; 2
	db $00	; 0
	db $5e	; 94
	db $3c	; 60
	db $41	; 65	'A'
	db $3c	; 60
	db $6e	; 110	'n'
	db $82	; 130
	db $08	; 8
	db $03	; 3
	db $2d	; 45
	db $be	; 190
	db $66	; 102	'f'
	dw GengarPicFront
	dw GengarPicBack
	db $7a	; 122	'z'
	db $6d	; 109	'm'
	db $65	; 101	'e'
	db $00	; 0
	db $03	; 3
	db $b1	; 177
	db $43	; 67	'C'
	db $9f	; 159
	db $d1	; 209
	db $8e	; 142
	db $6a	; 106	'j'
	db $22	; 34
	db $00	; 0
	db $5f	; 95
	db $23	; 35
	db $2d	; 45
	db $a0	; 160
	db $46	; 70	'F'
	db $1e	; 30
	db $05	; 5
	db $04	; 4
	db $2d	; 45
	db $6c	; 108	'l'
	db $77	; 119	'w'
	dw OnixPicFront
	dw OnixPicBack
	db $21	; 33
	db $67	; 103	'g'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $03	; 3
	db $08	; 8
	db $ce	; 206
	db $8a	; 138
	db $c8	; 200
	db $22	; 34
	db $00	; 0
	db $60	; 96
	db $3c	; 60
	db $30	; 48	'0'
	db $2d	; 45
	db $2a	; 42
	db $5a	; 90	'Z'
	db $18	; 24
	db $18	; 24
	db $be	; 190
	db $66	; 102	'f'
	db $66	; 102	'f'
	dw DrowzeePicFront
	dw DrowzeePicBack
	db $01	; 1
	db $5f	; 95
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $f0	; 240
	db $87	; 135
	db $3a	; 58
	db $43	; 67	'C'
	db $00	; 0
	db $61	; 97	'a'
	db $55	; 85	'U'
	db $49	; 73	'I'
	db $46	; 70	'F'
	db $43	; 67	'C'
	db $73	; 115	's'
	db $18	; 24
	db $18	; 24
	db $4b	; 75	'K'
	db $a5	; 165
	db $77	; 119	'w'
	dw HypnoPicFront
	dw HypnoPicBack
	db $01	; 1
	db $5f	; 95
	db $32	; 50	'2'
	db $5d	; 93
	db $00	; 0
	db $b1	; 177
	db $43	; 67	'C'
	db $0f	; 15
	db $f0	; 240
	db $87	; 135
	db $3a	; 58
	db $43	; 67	'C'
	db $00	; 0
	db $62	; 98	'b'
	db $1e	; 30
	db $69	; 105	'i'
	db $5a	; 90	'Z'
	db $32	; 50	'2'
	db $19	; 25
	db $15	; 21
	db $15	; 21
	db $e1	; 225
	db $73	; 115	's'
	db $55	; 85	'U'
	dw KrabbyPicFront
	dw KrabbyPicBack
	db $91	; 145
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $3f	; 63
	db $08	; 8
	db $c0	; 192
	db $02	; 2
	db $08	; 8
	db $36	; 54	'6'
	db $00	; 0
	db $63	; 99	'c'
	db $37	; 55	'7'
	db $82	; 130
	db $73	; 115	's'
	db $4b	; 75	'K'
	db $32	; 50	'2'
	db $15	; 21
	db $15	; 21
	db $3c	; 60
	db $ce	; 206
	db $77	; 119	'w'
	dw KinglerPicFront
	dw KinglerPicBack
	db $91	; 145
	db $2b	; 43
	db $0b	; 11
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $7f	; 127
	db $08	; 8
	db $c0	; 192
	db $02	; 2
	db $08	; 8
	db $36	; 54	'6'
	db $00	; 0
	db $64	; 100	'd'
	db $28	; 40
	db $1e	; 30
	db $32	; 50	'2'
	db $64	; 100	'd'
	db $37	; 55	'7'
	db $17	; 23
	db $17	; 23
	db $be	; 190
	db $67	; 103	'g'
	db $55	; 85	'U'
	dw VoltorbPicFront
	dw VoltorbPicBack
	db $21	; 33
	db $67	; 103	'g'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $01	; 1
	db $88	; 136
	db $e1	; 225
	db $4b	; 75	'K'
	db $58	; 88	'X'
	db $42	; 66	'B'
	db $00	; 0
	db $65	; 101	'e'
	db $3c	; 60
	db $32	; 50	'2'
	db $46	; 70	'F'
	db $8c	; 140
	db $50	; 80	'P'
	db $17	; 23
	db $17	; 23
	db $3c	; 60
	db $96	; 150
	db $55	; 85	'U'
	dw ElectrodePicFront
	dw ElectrodePicBack
	db $21	; 33
	db $67	; 103	'g'
	db $31	; 49	'1'
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $41	; 65	'A'
	db $88	; 136
	db $e1	; 225
	db $cb	; 203
	db $58	; 88	'X'
	db $42	; 66	'B'
	db $00	; 0
	db $66	; 102	'f'
	db $3c	; 60
	db $28	; 40
	db $50	; 80	'P'
	db $28	; 40
	db $3c	; 60
	db $16	; 22
	db $18	; 24
	db $5a	; 90	'Z'
	db $62	; 98	'b'
	db $77	; 119	'w'
	dw ExeggcutePicFront
	dw ExeggcutePicBack
	db $8c	; 140
	db $5f	; 95
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $20	; 32
	db $03	; 3
	db $08	; 8
	db $f0	; 240
	db $1b	; 27
	db $68	; 104	'h'
	db $02	; 2
	db $00	; 0
	db $67	; 103	'g'
	db $5f	; 95
	db $5f	; 95
	db $55	; 85	'U'
	db $37	; 55	'7'
	db $7d	; 125
	db $16	; 22
	db $18	; 24
	db $2d	; 45
	db $d4	; 212
	db $77	; 119	'w'
	dw ExeggutorPicFront
	dw ExeggutorPicBack
	db $8c	; 140
	db $5f	; 95
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $20	; 32
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $f0	; 240
	db $1b	; 27
	db $68	; 104	'h'
	db $22	; 34
	db $00	; 0
	db $68	; 104	'h'
	db $32	; 50	'2'
	db $32	; 50	'2'
	db $5f	; 95
	db $23	; 35
	db $28	; 40
	db $04	; 4
	db $04	; 4
	db $be	; 190
	db $57	; 87	'W'
	db $55	; 85	'U'
	dw CubonePicFront
	dw CubonePicBack
	db $7d	; 125
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $3f	; 63
	db $0f	; 15
	db $ce	; 206
	db $a2	; 162
	db $08	; 8
	db $22	; 34
	db $00	; 0
	db $69	; 105	'i'
	db $3c	; 60
	db $50	; 80	'P'
	db $6e	; 110	'n'
	db $2d	; 45
	db $32	; 50	'2'
	db $04	; 4
	db $04	; 4
	db $4b	; 75	'K'
	db $7c	; 124
	db $66	; 102	'f'
	dw MarowakPicFront
	dw MarowakPicBack
	db $7d	; 125
	db $2d	; 45
	db $2b	; 43
	db $74	; 116	't'
	db $00	; 0
	db $b1	; 177
	db $7f	; 127
	db $0f	; 15
	db $ce	; 206
	db $a2	; 162
	db $08	; 8
	db $22	; 34
	db $00	; 0
	db $6a	; 106	'j'
	db $32	; 50	'2'
	db $78	; 120	'x'
	db $35	; 53	'5'
	db $57	; 87	'W'
	db $23	; 35
	db $01	; 1
	db $01	; 1
	db $2d	; 45
	db $8b	; 139
	db $77	; 119	'w'
	dw HitmonleePicFront
	dw HitmonleePicBack
	db $18	; 24
	db $60	; 96
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $c0	; 192
	db $c6	; 198
	db $08	; 8
	db $22	; 34
	db $00	; 0
	db $6b	; 107	'k'
	db $32	; 50	'2'
	db $69	; 105	'i'
	db $4f	; 79	'O'
	db $4c	; 76	'L'
	db $23	; 35
	db $01	; 1
	db $01	; 1
	db $2d	; 45
	db $8c	; 140
	db $66	; 102	'f'
	dw HitmonchanPicFront
	dw HitmonchanPicBack
	db $04	; 4
	db $61	; 97	'a'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $03	; 3
	db $0f	; 15
	db $c0	; 192
	db $c6	; 198
	db $08	; 8
	db $22	; 34
	db $00	; 0
	db $6c	; 108	'l'
	db $5a	; 90	'Z'
	db $37	; 55	'7'
	db $4b	; 75	'K'
	db $1e	; 30
	db $3c	; 60
	db $00	; 0
	db $00	; 0
	db $2d	; 45
	db $7f	; 127
	db $77	; 119	'w'
	dw LickitungPicFront
	dw LickitungPicBack
	db $23	; 35
	db $30	; 48	'0'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b5	; 181
	db $7f	; 127
	db $8f	; 143
	db $c7	; 199
	db $a2	; 162
	db $08	; 8
	db $36	; 54	'6'
	db $00	; 0
	db $6d	; 109	'm'
	db $28	; 40
	db $41	; 65	'A'
	db $5f	; 95
	db $23	; 35
	db $3c	; 60
	db $03	; 3
	db $03	; 3
	db $be	; 190
	db $72	; 114	'r'
	db $66	; 102	'f'
	dw KoffingPicFront
	dw KoffingPicBack
	db $21	; 33
	db $7b	; 123
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $00	; 0
	db $88	; 136
	db $c1	; 193
	db $2a	; 42
	db $48	; 72	'H'
	db $02	; 2
	db $00	; 0
	db $6e	; 110	'n'
	db $41	; 65	'A'
	db $5a	; 90	'Z'
	db $78	; 120	'x'
	db $3c	; 60
	db $55	; 85	'U'
	db $03	; 3
	db $03	; 3
	db $3c	; 60
	db $ad	; 173
	db $77	; 119	'w'
	dw WeezingPicFront
	dw WeezingPicBack
	db $21	; 33
	db $7b	; 123
	db $7c	; 124
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $40	; 64
	db $88	; 136
	db $c1	; 193
	db $2a	; 42
	db $48	; 72	'H'
	db $02	; 2
	db $00	; 0
	db $6f	; 111	'o'
	db $50	; 80	'P'
	db $55	; 85	'U'
	db $5f	; 95
	db $19	; 25
	db $1e	; 30
	db $04	; 4
	db $05	; 5
	db $78	; 120	'x'
	db $87	; 135
	db $77	; 119	'w'
	dw RhyhornPicFront
	dw RhyhornPicBack
	db $1e	; 30
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $e0	; 224
	db $03	; 3
	db $88	; 136
	db $cf	; 207
	db $a2	; 162
	db $88	; 136
	db $22	; 34
	db $00	; 0
	db $70	; 112	'p'
	db $69	; 105	'i'
	db $82	; 130
	db $78	; 120	'x'
	db $28	; 40
	db $2d	; 45
	db $04	; 4
	db $05	; 5
	db $3c	; 60
	db $cc	; 204
	db $77	; 119	'w'
	dw RhydonPicFront
	dw RhydonPicBack
	db $1e	; 30
	db $17	; 23
	db $27	; 39
	db $1f	; 31
	db $05	; 5
	db $f1	; 241
	db $ff	; 255
	db $8f	; 143
	db $cf	; 207
	db $a2	; 162
	db $88	; 136
	db $32	; 50	'2'
	db $00	; 0
	db $71	; 113	'q'
	db $fa	; 250
	db $05	; 5
	db $05	; 5
	db $32	; 50	'2'
	db $69	; 105	'i'
	db $00	; 0
	db $00	; 0
	db $1e	; 30
	db $ff	; 255
	db $66	; 102	'f'
	dw ChanseyPicFront
	dw ChanseyPicBack
	db $01	; 1
	db $03	; 3
	db $00	; 0
	db $00	; 0
	db $04	; 4
	db $b1	; 177
	db $7f	; 127
	db $af	; 175
	db $f1	; 241
	db $b7	; 183
	db $39	; 57	'9'
	db $63	; 99	'c'
	db $00	; 0
	db $72	; 114	'r'
	db $41	; 65	'A'
	db $37	; 55	'7'
	db $73	; 115	's'
	db $3c	; 60
	db $64	; 100	'd'
	db $16	; 22
	db $16	; 22
	db $2d	; 45
	db $a6	; 166
	db $66	; 102	'f'
	dw TangelaPicFront
	dw TangelaPicBack
	db $84	; 132
	db $14	; 20
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a4	; 164
	db $43	; 67	'C'
	db $38	; 56	'8'
	db $c0	; 192
	db $82	; 130
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $73	; 115	's'
	db $69	; 105	'i'
	db $5f	; 95
	db $50	; 80	'P'
	db $5a	; 90	'Z'
	db $28	; 40
	db $00	; 0
	db $00	; 0
	db $2d	; 45
	db $af	; 175
	db $77	; 119	'w'
	dw KangaskhanPicFront
	dw KangaskhanPicBack
	db $04	; 4
	db $63	; 99	'c'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $7f	; 127
	db $8f	; 143
	db $c7	; 199
	db $a2	; 162
	db $88	; 136
	db $32	; 50	'2'
	db $00	; 0
	db $74	; 116	't'
	db $1e	; 30
	db $28	; 40
	db $46	; 70	'F'
	db $3c	; 60
	db $46	; 70	'F'
	db $15	; 21
	db $15	; 21
	db $e1	; 225
	db $53	; 83	'S'
	db $55	; 85	'U'
	dw HorseaPicFront
	dw HorseaPicBack
	db $91	; 145
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $3f	; 63
	db $08	; 8
	db $c0	; 192
	db $c2	; 194
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $75	; 117	'u'
	db $37	; 55	'7'
	db $41	; 65	'A'
	db $5f	; 95
	db $55	; 85	'U'
	db $5f	; 95
	db $15	; 21
	db $15	; 21
	db $4b	; 75	'K'
	db $9b	; 155
	db $66	; 102	'f'
	dw SeadraPicFront
	dw SeadraPicBack
	db $91	; 145
	db $6c	; 108	'l'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $7f	; 127
	db $08	; 8
	db $c0	; 192
	db $c2	; 194
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $76	; 118	'v'
	db $2d	; 45
	db $43	; 67	'C'
	db $3c	; 60
	db $3f	; 63
	db $32	; 50	'2'
	db $15	; 21
	db $15	; 21
	db $e1	; 225
	db $6f	; 111	'o'
	db $66	; 102	'f'
	dw GoldeenPicFront
	dw GoldeenPicBack
	db $40	; 64
	db $27	; 39
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $60	; 96
	db $3f	; 63
	db $08	; 8
	db $c0	; 192
	db $c2	; 194
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $77	; 119	'w'
	db $50	; 80	'P'
	db $5c	; 92
	db $41	; 65	'A'
	db $44	; 68	'D'
	db $50	; 80	'P'
	db $15	; 21
	db $15	; 21
	db $3c	; 60
	db $aa	; 170
	db $77	; 119	'w'
	dw SeakingPicFront
	dw SeakingPicBack
	db $40	; 64
	db $27	; 39
	db $30	; 48	'0'
	db $00	; 0
	db $00	; 0
	db $60	; 96
	db $7f	; 127
	db $08	; 8
	db $c0	; 192
	db $c2	; 194
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $78	; 120	'x'
	db $1e	; 30
	db $2d	; 45
	db $37	; 55	'7'
	db $55	; 85	'U'
	db $46	; 70	'F'
	db $15	; 21
	db $15	; 21
	db $e1	; 225
	db $6a	; 106	'j'
	db $66	; 102	'f'
	dw StaryuPicFront
	dw StaryuPicBack
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $20	; 32
	db $3f	; 63
	db $88	; 136
	db $f1	; 241
	db $c3	; 195
	db $38	; 56	'8'
	db $53	; 83	'S'
	db $00	; 0
	db $79	; 121	'y'
	db $3c	; 60
	db $4b	; 75	'K'
	db $55	; 85	'U'
	db $73	; 115	's'
	db $64	; 100	'd'
	db $15	; 21
	db $18	; 24
	db $3c	; 60
	db $cf	; 207
	db $66	; 102	'f'
	dw StarmiePicFront
	dw StarmiePicBack
	db $21	; 33
	db $37	; 55	'7'
	db $6a	; 106	'j'
	db $00	; 0
	db $05	; 5
	db $20	; 32
	db $7f	; 127
	db $88	; 136
	db $f1	; 241
	db $c3	; 195
	db $38	; 56	'8'
	db $53	; 83	'S'
	db $00	; 0
	db $7a	; 122	'z'
	db $28	; 40
	db $2d	; 45
	db $41	; 65	'A'
	db $5a	; 90	'Z'
	db $64	; 100	'd'
	db $18	; 24
	db $18	; 24
	db $2d	; 45
	db $88	; 136
	db $66	; 102	'f'
	dw MrMimePicFront
	dw MrMimePicBack
	db $5d	; 93
	db $70	; 112	'p'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $43	; 67	'C'
	db $af	; 175
	db $f1	; 241
	db $87	; 135
	db $38	; 56	'8'
	db $42	; 66	'B'
	db $00	; 0
	db $7b	; 123
	db $46	; 70	'F'
	db $6e	; 110	'n'
	db $50	; 80	'P'
	db $69	; 105	'i'
	db $37	; 55	'7'
	db $07	; 7
	db $02	; 2
	db $2d	; 45
	db $bb	; 187
	db $77	; 119	'w'
	dw ScytherPicFront
	dw ScytherPicBack
	db $62	; 98	'b'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $24	; 36
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $c2	; 194
	db $08	; 8
	db $06	; 6
	db $00	; 0
	db $7c	; 124
	db $41	; 65	'A'
	db $32	; 50	'2'
	db $23	; 35
	db $5f	; 95
	db $5f	; 95
	db $19	; 25
	db $18	; 24
	db $2d	; 45
	db $89	; 137
	db $66	; 102	'f'
	dw JynxPicFront
	dw JynxPicBack
	db $01	; 1
	db $8e	; 142
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $7f	; 127
	db $0f	; 15
	db $f0	; 240
	db $87	; 135
	db $28	; 40
	db $02	; 2
	db $00	; 0
	db $7d	; 125
	db $41	; 65	'A'
	db $53	; 83	'S'
	db $39	; 57	'9'
	db $69	; 105	'i'
	db $55	; 85	'U'
	db $17	; 23
	db $17	; 23
	db $2d	; 45
	db $9c	; 156
	db $66	; 102	'f'
	dw ElectabuzzPicFront
	dw ElectabuzzPicBack
	db $62	; 98	'b'
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $43	; 67	'C'
	db $8f	; 143
	db $f1	; 241
	db $c7	; 199
	db $38	; 56	'8'
	db $62	; 98	'b'
	db $00	; 0
	db $7e	; 126
	db $41	; 65	'A'
	db $5f	; 95
	db $39	; 57	'9'
	db $5d	; 93
	db $55	; 85	'U'
	db $14	; 20
	db $14	; 20
	db $2d	; 45
	db $a7	; 167
	db $66	; 102	'f'
	dw MagmarPicFront
	dw MagmarPicBack
	db $34	; 52	'4'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $b1	; 177
	db $43	; 67	'C'
	db $0f	; 15
	db $f0	; 240
	db $a6	; 166
	db $28	; 40
	db $22	; 34
	db $00	; 0
	db $7f	; 127
	db $41	; 65	'A'
	db $7d	; 125
	db $64	; 100	'd'
	db $55	; 85	'U'
	db $37	; 55	'7'
	db $07	; 7
	db $07	; 7
	db $2d	; 45
	db $c8	; 200
	db $77	; 119	'w'
	dw PinsirPicFront
	dw PinsirPicBack
	db $0b	; 11
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $a4	; 164
	db $43	; 67	'C'
	db $0d	; 13
	db $c0	; 192
	db $02	; 2
	db $08	; 8
	db $26	; 38
	db $00	; 0
	db $80	; 128
	db $4b	; 75	'K'
	db $64	; 100	'd'
	db $5f	; 95
	db $6e	; 110	'n'
	db $46	; 70	'F'
	db $00	; 0
	db $00	; 0
	db $2d	; 45
	db $d3	; 211
	db $77	; 119	'w'
	dw TaurosPicFront
	dw TaurosPicBack
	db $21	; 33
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $e0	; 224
	db $73	; 115	's'
	db $88	; 136
	db $c7	; 199
	db $a2	; 162
	db $08	; 8
	db $22	; 34
	db $00	; 0
	db $81	; 129
	db $14	; 20
	db $0a	; 10
	db $37	; 55	'7'
	db $50	; 80	'P'
	db $14	; 20
	db $15	; 21
	db $15	; 21
	db $ff	; 255
	db $14	; 20
	db $66	; 102	'f'
	dw MagikarpPicFront
	dw MagikarpPicBack
	db $96	; 150
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $82	; 130
	db $5f	; 95
	db $7d	; 125
	db $4f	; 79	'O'
	db $51	; 81	'Q'
	db $64	; 100	'd'
	db $15	; 21
	db $02	; 2
	db $2d	; 45
	db $d6	; 214
	db $77	; 119	'w'
	dw GyaradosPicFront
	dw GyaradosPicBack
	db $2c	; 44
	db $52	; 82	'R'
	db $2b	; 43
	db $38	; 56	'8'
	db $05	; 5
	db $a0	; 160
	db $7f	; 127
	db $c8	; 200
	db $c1	; 193
	db $a3	; 163
	db $08	; 8
	db $32	; 50	'2'
	db $00	; 0
	db $83	; 131
	db $82	; 130
	db $55	; 85	'U'
	db $50	; 80	'P'
	db $3c	; 60
	db $5f	; 95
	db $15	; 21
	db $19	; 25
	db $2d	; 45
	db $db	; 219
	db $77	; 119	'w'
	dw LaprasPicFront
	dw LaprasPicBack
	db $37	; 55	'7'
	db $2d	; 45
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $e0	; 224
	db $7f	; 127
	db $e8	; 232
	db $d1	; 209
	db $83	; 131
	db $28	; 40
	db $32	; 50	'2'
	db $00	; 0
	db $84	; 132
	db $30	; 48	'0'
	db $30	; 48	'0'
	db $30	; 48	'0'
	db $30	; 48	'0'
	db $30	; 48	'0'
	db $00	; 0
	db $00	; 0
	db $23	; 35
	db $3d	; 61
	db $55	; 85	'U'
	dw DittoPicFront
	dw DittoPicBack
	db $90	; 144
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $85	; 133
	db $37	; 55	'7'
	db $37	; 55	'7'
	db $32	; 50	'2'
	db $37	; 55	'7'
	db $41	; 65	'A'
	db $00	; 0
	db $00	; 0
	db $2d	; 45
	db $5c	; 92
	db $55	; 85	'U'
	dw EeveePicFront
	dw EeveePicBack
	db $21	; 33
	db $1c	; 28
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $03	; 3
	db $08	; 8
	db $c0	; 192
	db $c3	; 195
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $86	; 134
	db $82	; 130
	db $41	; 65	'A'
	db $3c	; 60
	db $41	; 65	'A'
	db $6e	; 110	'n'
	db $15	; 21
	db $15	; 21
	db $2d	; 45
	db $c4	; 196
	db $66	; 102	'f'
	dw VaporeonPicFront
	dw VaporeonPicBack
	db $21	; 33
	db $1c	; 28
	db $62	; 98	'b'
	db $37	; 55	'7'
	db $00	; 0
	db $a0	; 160
	db $7f	; 127
	db $08	; 8
	db $c0	; 192
	db $c3	; 195
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $87	; 135
	db $41	; 65	'A'
	db $41	; 65	'A'
	db $3c	; 60
	db $82	; 130
	db $6e	; 110	'n'
	db $17	; 23
	db $17	; 23
	db $2d	; 45
	db $c5	; 197
	db $66	; 102	'f'
	dw JolteonPicFront
	dw JolteonPicBack
	db $21	; 33
	db $1c	; 28
	db $62	; 98	'b'
	db $54	; 84	'T'
	db $00	; 0
	db $a0	; 160
	db $43	; 67	'C'
	db $88	; 136
	db $c1	; 193
	db $c3	; 195
	db $18	; 24
	db $42	; 66	'B'
	db $00	; 0
	db $88	; 136
	db $41	; 65	'A'
	db $82	; 130
	db $3c	; 60
	db $41	; 65	'A'
	db $6e	; 110	'n'
	db $14	; 20
	db $14	; 20
	db $2d	; 45
	db $c6	; 198
	db $66	; 102	'f'
	dw FlareonPicFront
	dw FlareonPicBack
	db $21	; 33
	db $1c	; 28
	db $62	; 98	'b'
	db $34	; 52	'4'
	db $00	; 0
	db $a0	; 160
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $e3	; 227
	db $08	; 8
	db $02	; 2
	db $00	; 0
	db $89	; 137
	db $41	; 65	'A'
	db $3c	; 60
	db $46	; 70	'F'
	db $28	; 40
	db $4b	; 75	'K'
	db $00	; 0
	db $00	; 0
	db $2d	; 45
	db $82	; 130
	db $66	; 102	'f'
	dw PorygonPicFront
	dw PorygonPicBack
	db $21	; 33
	db $9f	; 159
	db $a0	; 160
	db $00	; 0
	db $00	; 0
	db $20	; 32
	db $73	; 115	's'
	db $88	; 136
	db $f1	; 241
	db $c3	; 195
	db $38	; 56	'8'
	db $43	; 67	'C'
	db $00	; 0
	db $8a	; 138
	db $23	; 35
	db $28	; 40
	db $64	; 100	'd'
	db $23	; 35
	db $5a	; 90	'Z'
	db $05	; 5
	db $15	; 21
	db $2d	; 45
	db $78	; 120	'x'
	db $55	; 85	'U'
	dw OmanytePicFront
	dw OmanytePicBack
	db $37	; 55	'7'
	db $6e	; 110	'n'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $3f	; 63
	db $08	; 8
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $8b	; 139
	db $46	; 70	'F'
	db $3c	; 60
	db $7d	; 125
	db $37	; 55	'7'
	db $73	; 115	's'
	db $05	; 5
	db $15	; 21
	db $2d	; 45
	db $c7	; 199
	db $66	; 102	'f'
	dw OmastarPicFront
	dw OmastarPicBack
	db $37	; 55	'7'
	db $6e	; 110	'n'
	db $1e	; 30
	db $00	; 0
	db $00	; 0
	db $e0	; 224
	db $7f	; 127
	db $0d	; 13
	db $c0	; 192
	db $83	; 131
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $8c	; 140
	db $1e	; 30
	db $50	; 80	'P'
	db $5a	; 90	'Z'
	db $37	; 55	'7'
	db $2d	; 45
	db $05	; 5
	db $15	; 21
	db $2d	; 45
	db $77	; 119	'w'
	db $55	; 85	'U'
	dw KabutoPicFront
	dw KabutoPicBack
	db $0a	; 10
	db $6a	; 106	'j'
	db $00	; 0
	db $00	; 0
	db $00	; 0
	db $a0	; 160
	db $3f	; 63
	db $08	; 8
	db $c0	; 192
	db $03	; 3
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $8d	; 141
	db $3c	; 60
	db $73	; 115	's'
	db $69	; 105	'i'
	db $50	; 80	'P'
	db $46	; 70	'F'
	db $05	; 5
	db $15	; 21
	db $2d	; 45
	db $c9	; 201
	db $66	; 102	'f'
	dw KabutopsPicFront
	dw KabutopsPicBack
	db $0a	; 10
	db $6a	; 106	'j'
	db $47	; 71	'G'
	db $00	; 0
	db $00	; 0
	db $b6	; 182
	db $7f	; 127
	db $0d	; 13
	db $c0	; 192
	db $83	; 131
	db $08	; 8
	db $12	; 18
	db $00	; 0
	db $8e	; 142
	db $50	; 80	'P'
	db $69	; 105	'i'
	db $41	; 65	'A'
	db $82	; 130
	db $3c	; 60
	db $05	; 5
	db $02	; 2
	db $2d	; 45
	db $ca	; 202
	db $77	; 119	'w'
	dw AerodactylPicFront
	dw AerodactylPicBack
	db $11	; 17
	db $61	; 97	'a'
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $2a	; 42
	db $43	; 67	'C'
	db $48	; 72	'H'
	db $c0	; 192
	db $63	; 99	'c'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $8f	; 143
	db $a0	; 160
	db $6e	; 110	'n'
	db $41	; 65	'A'
	db $1e	; 30
	db $41	; 65	'A'
	db $00	; 0
	db $00	; 0
	db $19	; 25
	db $9a	; 154
	db $77	; 119	'w'
	dw SnorlaxPicFront
	dw SnorlaxPicBack
	db $1d	; 29
	db $85	; 133
	db $9c	; 156
	db $00	; 0
	db $05	; 5
	db $b1	; 177
	db $ff	; 255
	db $af	; 175
	db $d7	; 215
	db $af	; 175
	db $a8	; 168
	db $32	; 50	'2'
	db $00	; 0
	db $90	; 144
	db $5a	; 90	'Z'
	db $55	; 85	'U'
	db $64	; 100	'd'
	db $55	; 85	'U'
	db $7d	; 125
	db $19	; 25
	db $02	; 2
	db $03	; 3
	db $d7	; 215
	db $77	; 119	'w'
	dw ArticunoPicFront
	dw ArticunoPicBack
	db $40	; 64
	db $3a	; 58
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $2a	; 42
	db $7f	; 127
	db $08	; 8
	db $c0	; 192
	db $43	; 67	'C'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $91	; 145
	db $5a	; 90	'Z'
	db $5a	; 90	'Z'
	db $55	; 85	'U'
	db $64	; 100	'd'
	db $7d	; 125
	db $17	; 23
	db $02	; 2
	db $03	; 3
	db $d8	; 216
	db $77	; 119	'w'
	dw ZapdosPicFront
	dw ZapdosPicBack
	db $54	; 84	'T'
	db $41	; 65	'A'
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $2a	; 42
	db $43	; 67	'C'
	db $88	; 136
	db $c1	; 193
	db $43	; 67	'C'
	db $1c	; 28
	db $4a	; 74	'J'
	db $00	; 0
	db $92	; 146
	db $5a	; 90	'Z'
	db $64	; 100	'd'
	db $5a	; 90	'Z'
	db $5a	; 90	'Z'
	db $7d	; 125
	db $14	; 20
	db $02	; 2
	db $03	; 3
	db $d9	; 217
	db $77	; 119	'w'
	dw MoltresPicFront
	dw MoltresPicBack
	db $40	; 64
	db $53	; 83	'S'
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $2a	; 42
	db $43	; 67	'C'
	db $08	; 8
	db $c0	; 192
	db $63	; 99	'c'
	db $0c	; 12
	db $0a	; 10
	db $00	; 0
	db $93	; 147
	db $29	; 41
	db $40	; 64
	db $2d	; 45
	db $32	; 50	'2'
	db $32	; 50	'2'
	db $1a	; 26
	db $1a	; 26
	db $2d	; 45
	db $43	; 67	'C'
	db $55	; 85	'U'
	dw DratiniPicFront
	dw DratiniPicBack
	db $23	; 35
	db $2b	; 43
	db $00	; 0
	db $00	; 0
	db $05	; 5
	db $a0	; 160
	db $3f	; 63
	db $c8	; 200
	db $c1	; 193
	db $e3	; 227
	db $18	; 24
	db $12	; 18
	db $00	; 0
	db $94	; 148
	db $3d	; 61
	db $54	; 84	'T'
	db $41	; 65	'A'
	db $46	; 70	'F'
	db $46	; 70	'F'
	db $1a	; 26
	db $1a	; 26
	db $2d	; 45
	db $90	; 144
	db $66	; 102	'f'
	dw DragonairPicFront
	dw DragonairPicBack
	db $23	; 35
	db $2b	; 43
	db $56	; 86	'V'
	db $00	; 0
	db $05	; 5
	db $e0	; 224
	db $3f	; 63
	db $c8	; 200
	db $c1	; 193
	db $e3	; 227
	db $18	; 24
	db $12	; 18
	db $00	; 0
	db $95	; 149
	db $5b	; 91
	db $86	; 134
	db $5f	; 95
	db $50	; 80	'P'
	db $64	; 100	'd'
	db $1a	; 26
	db $02	; 2
	db $2d	; 45
	db $da	; 218
	db $77	; 119	'w'
	dw DragonitePicFront
	dw DragonitePicBack
	db $23	; 35
	db $2b	; 43
	db $56	; 86	'V'
	db $61	; 97	'a'
	db $05	; 5
	db $e2	; 226
	db $7f	; 127
	db $c8	; 200
	db $c1	; 193
	db $e3	; 227
	db $18	; 24
	db $32	; 50	'2'
	db $00	; 0
	db $96	; 150
	db $6a	; 106	'j'
	db $6e	; 110	'n'
	db $5a	; 90	'Z'
	db $82	; 130
	db $9a	; 154
	db $18	; 24
	db $18	; 24
	db $03	; 3
	db $dc	; 220
	db $77	; 119	'w'
	dw MewtwoPicFront
	dw MewtwoPicBack
	db $5d	; 93
	db $32	; 50	'2'
	db $81	; 129
	db $5e	; 94
	db $05	; 5
	db $b1	; 177
	db $ff	; 255
	db $af	; 175
	db $f1	; 241
	db $af	; 175
	db $38	; 56	'8'
	db $63	; 99	'c'
	db $00	; 0
