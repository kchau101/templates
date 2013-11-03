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

;Program Entry vector 
.PGM	CODE 0x0000
PGM:
	call setup	; 0x0000
	goto MAIN	; 0x0001
	
.MAIN	CODE 
MAIN:
	banksel PORTB
	bsf	PORTB, 1
    nop
    goto MAIN
END