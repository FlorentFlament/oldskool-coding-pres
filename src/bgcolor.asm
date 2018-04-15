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

        ; Vblank header logic
        inc frame_cnt
        lda frame_cnt
        lsr
        sta COLUBK

        ; Count 44 lines for VBLANK
        ldx #44
vblank_loop:
        sta WSYNC
        dex
        bne vblank_loop

        ; Write '0' to D1 of VBLANK
        lda #$00
        sta VBLANK

        ; Count 312 - 48 = 264 lines
        ; in two passes of 132 (max counter value is 255)
        ldy #2
outer_loop:
        ldx #132
inner_loop:
        sta WSYNC
        dex
        bne inner_loop
        dey
        bne outer_loop

        jmp main_loop

;---------- Reset Vector ----------
        SEG reset
        ORG $FFFA
        DC.W main_loop ; NMI
        DC.W main_loop ; RESET
        DC.W main_loop ; IRQ / BRK
