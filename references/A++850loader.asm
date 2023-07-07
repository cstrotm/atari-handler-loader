;;; *** Boot850
;;; *** Boot the external 850 interface
;;; *** returns with carry set on error, other
;;; *** wise with carry clear.
;;; *** BootSpace = $500

        .global Boot850
.proc   Boot850
        ldx #12-1
lp:
        lda Init850Boot,x
        sta SIODeviceId,x
        dex
        bpl lp
        jsr SIOVector
        bmi fail
        ldx #12-1
lp2:
        lda BootSpace,x
        sta SIODeviceId,x
        dex
        bpl lp2
        jsr SIOVector           ; boot the handler
        bmi fail
        jmp BootSpace+6         ; run the boot code
Init850Boot:
        .byte $50,$01           ; RS232-handler, unit 1
        .byte '?',$40           ; get boot parameter, read
        .word BootSpace
        .byte $06,$00           ; timeout
        .word 12,0              ; size, aux1,2
fail:                           ; runs into the following
.endproc
