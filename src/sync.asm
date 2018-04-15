;---------- Header ----------
        PROCESSOR 6502
        INCLUDE "vcs.h"         ; Provides RIOT & TIA memory map
        
;---------- Code segment ----------
        SEG code
        ORG $F000
main_loop:
        ; Write '1' to D1 of VSYNC
        lda #$02                ; This corresponds to the 00000010 byte
        sta VSYNC

        ; Wait 3 scanlines
        sta WSYNC
        sta WSYNC
        sta WSYNC

        ; Write '0' to D1 of VSYNC
        lda #$00
        sta VSYNC

        ; Write '1' to D1 of VBLANK
        lda #$02
        sta VBLANK

        ; Count 45 lines for VBLANK
        ldx #45
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
