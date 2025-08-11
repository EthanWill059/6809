screen  equ $0400

START:  
    ldx #screen
    ldd #$0001
    std fact
    clr n
LOOP:   
    ldd fact
	bsr PUTHEX_D
	lda n
	cmpa #6
	beq DONE
	lda #','
	sta 0,x+
	inc n
	bsr MULTIPLY_FACTORIAL
	bra LOOP
DONE:   
	rts

MULTIPLY_FACTORIAL:
	lda fact+1
	ldb n
	mul
	stb fact+1
	sta carry
	lda fact
	ldb n
	mul
	addb carry
	adca #$00
	stb fact
	rts

PUTHEX_D:
	pshs b
	bsr PUTHEX_BYTE
	puls a
	bsr PUTHEX_BYTE
	rts

PUTHEX_BYTE:
	pshs a
	anda #$f0
	lsra
	lsra
	lsra
	lsra
	bsr PUTHEX_NIBBLE
	puls a
	anda #$0f
	bsr PUTHEX_NIBBLE
	rts

PUTHEX_NIBBLE:
	adda #$30
	cmpa #$39
	bls PHN_STORE
	adda #$07
PHN_STORE:
	sta 0,x
	leax 1,x
	rts

n       rmb 1
fact    rmb 2
carry   rmb 1
