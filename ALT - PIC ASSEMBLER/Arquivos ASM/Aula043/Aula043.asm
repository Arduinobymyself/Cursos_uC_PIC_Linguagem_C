	TITLE		"AULA43 - INTERRUPÇÃO EXTERNA POR RB0"
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
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	;TESTA SE HOUVE INTERRUPÇÃO
	BTFSC		FLAG
	
	
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	
	BANCO0									;PODERIA USAR: BANKSEL TRISB
	MOVLW		B'01111111'
	MOVWF		TRISB

	BCF			BORDA						;BORDA DE DESCIDA
	BCF			PULL_UP

	
	BANCO1									;PODERIA USAR: BANKSEL PORTB
	CLRF		PORTB
	
	BSF			CH_GERAL
	BSF			CH_EXTERNA


	
	

	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
