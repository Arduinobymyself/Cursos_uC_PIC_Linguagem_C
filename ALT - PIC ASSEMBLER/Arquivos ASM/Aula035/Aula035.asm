	TITLE		"AULA035 ENTRADA DE DADOS - BOTÃO LIGA"
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG _XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	#DEFINE		BOTAO	PORTB, RB0
	#DEFINE		LED		PORTB, RB7

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	BANKSEL		TRISB
	MOVLW		B'01111111'					;APENAS RB7 COMO SAÍDA
	MOVWF		TRISB
	
	BANKSEL		PORTB
	CLRF		PORTB

VERIFICA:
	BTFSC		BOTAO						;BOTAO ACIONADO
	GOTO		APAGAR						;NÃO, APAGA LED
	BSF			LED							;SIM, ACENDE LED
	GOTO		VERIFICA

APAGAR:
	BCF			LED
	GOTO		VERIFICA
	
	
	
	
	
	
	
	
	
	
	
	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
