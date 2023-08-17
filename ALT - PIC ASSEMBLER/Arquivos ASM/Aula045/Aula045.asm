	TITLE		"AULA45 - INTERRUP��O EXTERNA POR RB0"
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG 	_XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	;REGISTRADORES BANCO 0
	#DEFINE		CH_GERAL	INTCON, GIE				;BIT 7
	#DEFINE		CH_EXTERNA	INTCON, INTE			;BIT 4
	#DEFINE		FLAG		INTCON, INTF			;BIT 1
	;REGISTRADORES BANCO 1
	#DEFINE		PULL_UP		OPTION_REG, NOT_RBPU	;BIT 7		
	#DEFINE		BORDA		OPTION_REG, INTEDG		;BIT 6
	;GERAL
	#DEFINE		BANCO0		BSF		STATUS, RP0		;BIT 5
	#DEFINE		BANCO1		BCF		STATUS, RP0		;BIT 5
	#DEFINE		LED1		PORTB, RB7
	#DEFINE		LED2		PORTB, RB6
	#DEFINE		LED3		PORTB, RB5
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	TEMPO1		EQU			0X0C
	TEMPO2		EQU			0X0D

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	BCF			LED2
	BCF			LED3
	BSF			LED1
	CALL 		DELAY
	CALL		DELAY
	CALL		DELAY
	CALL		DELAY
	BCF			FLAG
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	
	BANCO0									;PODERIA USAR: BANKSEL TRISB
	MOVLW		B'00011111'					;RB7 E RB6 COMO SA�DA
	MOVWF		TRISB
	CLRF		INTCON						;INICIA/LIMPA TODAS AS INTERRUP��ES E FLAGS
	BSF			BORDA						;BORDA DE DESCIDA
	BCF			PULL_UP						;RESISTORES DE PULL-UP INTERNOS
	
	BANCO1									;PODERIA USAR: BANKSEL PORTB
	CLRF		PORTB
	BSF			CH_GERAL
	BSF			CH_EXTERNA

L1:
	BCF			LED1
	BCF			LED2
	BSF			LED3
	CALL		DELAY
	GOTO		L2
	
L2:
	BCF			LED1
	BSF			LED2
	BCF			LED3
	CALL		DELAY
	GOTO		L1


DELAY:
	MOVLW		D'249'
	MOVWF		TEMPO1
M2:	
	MOVLW		D'251'
	MOVWF		TEMPO2
	
M1:
	NOP
	NOP
	NOP
	NOP
	NOP
	
	DECFSZ		TEMPO2
	GOTO M1
	
	DECFSZ		TEMPO1
	GOTO M2	
	
	RETURN

	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
