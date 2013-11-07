;*******************************************************************************
;                                   PIC Micro ASM
;*******************************************************************************
;Author:    Kevin Chau
;Date:      
;
;Project:   
;File:      isr.asm
;Desc:		 Interrupt Vector for servicing interrupts
;*******************************************************************************
include "register.asm"

.IVR	CODE	0x0004
ISR:
	nop
	retfie
END