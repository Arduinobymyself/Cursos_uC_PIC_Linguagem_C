	TITLE		"AULA53- TIMER 0"
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG 	_XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	;REGISTRADORES BANCO 0
	#DEFINE		FLAG		INTCON, T0IF			; BIT 3
	
	;REGISTRADORES BANCO 1
	#DEFINE		INC_TIMER0	OPTION_REG, T0CS		; BIT 5
	#DEFINE		PRESCALER	OPTION_REG, PSA			; BIT 3
	#DEFINE		BIT_PS2		OPTION_REG, PS2			; BIT 2
	#DEFINE		BIT_PS1		OPTION_REG, PS1			; BIT 1
	#DEFINE		BIT_PS0		OPTION_REG, PS0			; BIT 0
	
	;GERAL
	#DEFINE		BANCO0		BCF		STATUS, RP0		;BIT 5
	#DEFINE		BANCO1		BSF		STATUS, RP0		;BIT 5
	#DEFINE		LED1		PORTB, RB1
	#DEFINE		LED2		PORTB, RB2
	#DEFINE		LED_RB		PORTA, RA1				;LED DA INTERRUPÇÃO RB
	#DEFINE		LED_RB0		PORTA, RA2				;LED DA INTERRUPÇÃO RB0
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	TEMPO1		EQU			0X0C
	TEMPO2		EQU			0X0D

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	BANCO1									;PODERIA USAR: BANKSEL TRISB
	CLRF		TRISB						;PORT B COMO SAÍDA
	CLRF		INTCON						;INICIA/LIMPA TODAS AS INTERRUPÇÕES E FLAGS
	BCF			INC_TIMER0
	BCF			PRESCALER
	BCF			BIT_PS2
	BCF			BIT_PS1
	BCF			BIT_PS0
	
	BANCO0									;PODERIA USAR: BANKSEL PORTB
	CLRF		PORTB

	MOVLW		D'250'
	MOVWF		TMR0
LOOP:
	GOTO		LOOP
	
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
