screen  EQU    $0400

START:
    ldx    #screen
    ldd    #$FDCB
    bsr    PUTHEX_D
    lda    #' '
    sta    0,X+
    ldd    #$1234
    bsr    PUTHEX_D
    rts

PUTHEX_D:
    pshs   B
    bsr    PUTHEX_BYTE
    puls   A
    bsr    PUTHEX_BYTE
    rts

PUTHEX_BYTE:
    pshs   A
    anda   #$F0
    lsra
    lsra
    lsra
    lsra
    bsr    PUTHEX_NIBBLE
    puls   A
    anda   #$0F
    bsr    PUTHEX_NIBBLE
    rts

PUTHEX_NIBBLE:
    adda   #$30
    cmpa   #$39
    bls    PHN_STORE
    adda   #$07
PHN_STORE:
    sta    0,X
    leax   1,X
    rts