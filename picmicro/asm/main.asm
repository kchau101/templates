;*******************************************************************************
;                                   PIC Micro ASM
;*******************************************************************************
;Author:    Kevin Chau
;Date:      
;
;Project:   
;File:      main.asm
;Desc:
;*******************************************************************************
include "p16f88.inc"
.MAIN	CODE 
MAIN:
	banksel PORTB
	bsf	PORTB, 1
    nop
    goto MAIN
END