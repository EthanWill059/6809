keyboard EQU $FF83
screen EQU $0400
START:
    bsr GETCH
    ldx #screen
    sta 0,x+
    rts
GETCH:
    clr keyboard
    lda keyboard
    bmi GETCH
    rts
