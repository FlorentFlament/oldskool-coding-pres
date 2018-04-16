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
        CLEAN_START

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

fx_vblank:
        inc frame_cnt
        lda frame_cnt
        lsr
        sta COLUPF
	rts

fx_kernel SUBROUTINE
	ldx #240 ; Displaying 240 lines
.kernel_loop:
	sta WSYNC
	dex
	txa
	and #$08 ; Testing 4th bit i.e
	bne .odd
	
	lda #$55
	sta PF0
	sta PF2
	lda #$aa
	sta PF1
	jmp .continue
.odd:
	lda #$aa
	sta PF0
	sta PF2
	lda #$55
	sta PF1
	
.continue:
	txa
	bne .kernel_loop

	; Clear playfield
	lda #$00
	sta PF0
	sta PF1
	sta PF2
	rts
	

;---------- Reset Vector ----------
        SEG reset
        ORG $FFFA
        DC.W main_loop ; NMI
        DC.W main_loop ; RESET
        DC.W main_loop ; IRQ / BRK
