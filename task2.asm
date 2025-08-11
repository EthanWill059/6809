screen EQU $0400      
N RMB $1     
I RMB $1           
FACT RMB $1          
START:
    ldx #screen     
    clr N          
    bra OUTER
    rts
OUTER:
    lda #$1        
    sta FACT
    clr I          
INNER:
    lda I          
    inca
    sta I
    lda I          
    cmpa N
    bhi INNER_DONE
    lda FACT       
    ldb I
    mul            
    stb FACT   
    bra INNER
INNER_DONE:
    lda FACT   
    adda #'0'
    sta 0,X+

    lda N      
    inca
    sta N
    cmpa #4
    blo OUTER  

    bra $400B