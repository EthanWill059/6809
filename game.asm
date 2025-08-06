screen EQU $0400    ; start of screen
keyboard EQU $FF83 
START:
    bsr GETCH
    sta TARGET
    bsr GUESS
    rts
GUESS:
    bsr GETCH
    sta TMPGUESS
    bsr CHECK
    rts
CHECK:
    cmpa TARGET
    bhi AFTER
    blo BEFORE
    beq YES
    rts
YES:
    ldx #screen
    ldb #'Y'
    stb 0,x+
    rts
BEFORE:
    ldx #screen
    ldb #'B'
    stb 0,x+
    bra GUESS
AFTER:
    ldx #screen
    ldb #'A'
    stb 0,x+
    bra GUESS
GETCH:
    clr keyboard
    lda keyboard
    bmi GETCH
    rts
TARGET:
    .byte $00
TMPGUESS:
    .byte $00