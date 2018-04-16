;---------- Header ----------
        PROCESSOR 6502
        INCLUDE "vcs.h"         ; Provides RIOT & TIA memory map
        INCLUDE "macro.h"

;---------- RAM segment ----------
        SEG.U ram
        ORG $0080
frame_cnt ds 1

;---------- Code segment ----------
        SEG code
        ORG $F000
init:
        CLEAN_START
	jsr fx_init

main_loop:
        VERTICAL_SYNC

        ; Write '1' to D1 of VBLANK
        lda #$02
        sta VBLANK

	; Count 44 lines for VBLANK
	; By loading 44*76 / 64 = 52 into the TIM64T timer register
	lda #52
	sta TIM64T

	jsr fx_vblank
	jsr wait_timint

        ; Write '0' to D1 of VBLANK
        lda #$00
        sta VBLANK

        ; Waiting for 19 T1024T cycles, leading to 256 scanelines
	; (which is a good compromise).
        lda #19
	sta T1024T

	jsr fx_kernel ; This subroutine should display the picture (kernel)
	jsr wait_timint ; Then we wait for the timer to expire

	; 264 - 256 = 8 remaining scanlines to wait for
        ldx #8
overscan_loop:
        sta WSYNC
        dex
        bne overscan_loop

        jmp main_loop

; Wait for timer to expire
wait_timint:
	lda TIMINT
	beq wait_timint
	rts

fx_init:
        ; (30KHz / 6) / 16 = 312.5 Hz i.e D#4
	lda #$0c
	sta AUDC0
	lda #$10
	sta AUDF0
	lda #$04
	sta AUDV0
	rts

fx_vblank SUBROUTINE
	inc frame_cnt
	lda frame_cnt

	ldx #4
.loop:
	lsr
	dex
	bne .loop

	sta AUDV0
	rts

fx_kernel:
	rts

;---------- Reset Vector ----------
        SEG reset
        ORG $FFFA
        DC.W init ; NMI
        DC.W init ; RESET
        DC.W init ; IRQ / BRK
