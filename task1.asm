screen EQU $0400    ; start of screen
START:
    ldx #screen
LOAD:
    ldy #TABLE
ROTATE:
    ldb ,y+
    stb 0,x
    cmpy #$4017
    beq LOAD
    bra ROTATE
TABLE .byte $2D, $21, $2F, $5C    ; '-' '!' '/' '\'