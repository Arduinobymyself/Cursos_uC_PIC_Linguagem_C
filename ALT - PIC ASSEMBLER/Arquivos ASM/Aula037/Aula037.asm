	TITLE		"AULA037 - ENTRADA DE DADOS - BOTÃO LIGA/DESLIGA - RESISTORES DE PULL-UP"
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG 	_XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	#DEFINE		BOTAO		PORTB, RB0
	#DEFINE		LED			PORTB, RB7
	#DEFINE		PULL_UP		OPTION_REG, 7
	TEMPO1		EQU			0X0C
	TEMPO2		EQU			0X0D

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
	BCF			PULL_UP						;ATIVA OS RESISTORES DE PULL-UP NO PORT B
	
	BANKSEL		PORTB
	CLRF		PORTB

VERIFICA:
	BTFSC		BOTAO						;BOTAO ACIONADO
	GOTO		VERIFICA					;NÃO, MANTÉM CONDIÇÃO ATUAL, VOLTA A TESTAR
	GOTO		ALTERNA						;SIM, ALTERNA ESTADO DO LED

ALTERNA:
	COMF		LED
	GOTO		DEBOUCE						;ANTI-REPIQUE DO BOTÃO (~200MS)
	
DEBOUCE:									;GERA UM TEMPO PARA O DEBOUCE DO BOTÃO
	MOVLW		D'255'
	MOVWF		TEMPO1
M1:
	MOVLW		D'255'
	MOVWF		TEMPO2
M2:
	NOP
	DECFSZ		TEMPO2
	GOTO		M2
	
	DECFSZ		TEMPO1
	GOTO		M1
	
	GOTO 		VERIFICA
	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
