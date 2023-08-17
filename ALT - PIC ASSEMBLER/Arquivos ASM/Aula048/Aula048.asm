	TITLE		"AULA48 - INTERRUPÇÃO EXTERNA POR RB"
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG 	_XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	;REGISTRADORES BANCO 0
	#DEFINE		CH_GERAL	INTCON, GIE				;BIT 7
	#DEFINE		INT_RB		INTCON, RBIE			;BIT 3
	#DEFINE		FLAG_RB		INTCON, RBIF			;BIT 0
	;REGISTRADORES BANCO 1

	;GERAL
	#DEFINE		BANCO0		BCF		STATUS, RP0		;BIT 5
	#DEFINE		BANCO1		BSF		STATUS, RP0		;BIT 5
	#DEFINE		LED1		PORTB, RB0
	#DEFINE		LED2		PORTB, RB1
	#DEFINE		LED3		PORTB, RB2
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	TEMPO1		EQU			0X0C
	TEMPO2		EQU			0X0D

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	BCF			LED1
	BCF			LED2
	BSF			LED3
	CALL 		DELAY
	CALL		DELAY
	CALL		DELAY
	CALL		DELAY
	BCF			FLAG_RB
	BCF			LED3
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	BANCO1									;PODERIA USAR: BANKSEL TRISB
	MOVLW		B'10000000'					;APENAS RB7 COMO ENTRADA
	MOVWF		TRISB
	CLRF		INTCON						;INICIA/LIMPA TODAS AS INTERRUPÇÕES E FLAGS
	
	BANCO0									;PODERIA USAR: BANKSEL PORTB
	CLRF		PORTB
	BSF			CH_GERAL
	BSF			INT_RB


L1:
	BSF			LED1
	BCF			LED2
	CALL		DELAY
	GOTO		L2
	
L2:
	BCF			LED1
	BSF			LED2
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
	GOTO 		M1
	
	DECFSZ		TEMPO1
	GOTO 		M2	
	
	RETURN

	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
