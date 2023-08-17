	TITLE		"AULA54- TIMER 0"
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

	AUXILIAR	EQU			0X0C
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
	
	BCF			INC_TIMER0					;INCREMENTO DO TIMER 0 VIA OSCILADOR
	BCF			PRESCALER					;PRESCALER PARA TIMER 0
	BSF			BIT_PS2						;PRESCALER 1:256
	BSF			BIT_PS1
	BSF			BIT_PS0
	
	BANCO0									;PODERIA USAR: BANKSEL PORTB
	CLRF		PORTB
	CLRF 		TMR0
	;MOVLW		D'253'
	;MOVWF		TMR0

LOOP:
	COMF		PORTB
	CALL		DELAY
	GOTO		LOOP
	
DELAY:
	MOVLW		D'100'
	MOVWF		AUXILIAR
M2
	BCF			FLAG
	CLRF		TMR0
	;MOVLW		D'253'
	;MOVWF		TMR0
M1:
	BTFSS		FLAG
	GOTO		M1
	DECFSZ		AUXILIAR
	GOTO		M2		

	RETURN
		
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
