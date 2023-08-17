	TITLE		"AULA67 - LEITURA DA MEMÓRIA EEPROM"
	
	PROCESSOR	16F84A
	#INCLUDE	<P16F84A.INC>
	__CONFIG 	_XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	;REGISTRADORES BANCO 0
	
	;REGISTRADORES BANCO 1
	
	;REGISTRADORES DE USO GERAL
	#DEFINE		BANCO0		BCF		STATUS, RP0		;BIT 5, (0) = BANCO 0
	#DEFINE		BANCO1		BSF		STATUS, RP0		;BIT 5, (1) = BANCO 1
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	CBLOCK		0X0C
	ENDERECO	
	VALOR
	TEMPO1
	TEMPO2
	TEMPO3
	ENDC		
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	ORG			0X00
	GOTO 		INICIO
	
	ORG			0X04
	RETFIE
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO:
	
	BANCO0
	CLRF		ENDERECO					;ENDERECO = 0X00
	MOVLW		D'1'
	MOVWF		VALOR
	
LOOP:
	;+++++++++ ESCRITA +++++++++ 
	MOVF		ENDERECO, W					;W = ENDERECO (0X00)
	MOVWF		EEADR						;EEADR = W (ENDERECO)
	MOVF		VALOR, W					;W = VALOR (D'1')
	MOVWF		EEDATA						;EEDATA = W (0XAB)
	
	BANCO1
	CLRF		TRISB	
	BSF			EECON1, WREN				;LIGA A CHAVE DE ESCRITA NA EEPROM
	MOVLW		0X55						;W = 0X55
	MOVWF		EECON2						;EECON2 = 0X55
	MOVLW		0XAA						;W = 0XAA
	MOVWF		EECON2						;EECON2 = 0XAA
	BSF			EECON1, WR					;INICIA A ESCRITA NA EEPROM
	;CALL		DELAY_5MS					;ESPERA TEMPO MÍNIMO PARA GRAVAÇÃO NA EEPROM
	NOP
	NOP
	
	
	;+++++++++ LEITURA +++++++++ 
	
	BANCO0
	MOVF		ENDERECO, W					;W = ENDERECO (0X00)
	MOVWF		EEADR						;EEADR = W (ENDERECO)
	BANCO1
	CLRF		EECON1						;LIMPA REGISTRADOR EECON1
	BSF			EECON1, RD					;SETA BIT PARA LEITURA NA EEPROM
	BANCO0
	MOVF		EEDATA, W					;W = EEDATA (VALOR)
	MOVWF		PORTB						;PORTB = VALOR (D'1')
	INCF		ENDERECO					;PRÓXIMO ENDEREÇO/DADO
	INCF		VALOR						;INCREMENTA O VALOR
	GOTO		LOOP						;VOLTA A ESCREVER/LER UM NOVO VALOR NUM NOVO ENDEREÇO
	


	
DELAY_5MS:									;APROXIMADAMENTE 500MS
	MOVLW		D'5'
	MOVWF		TEMPO1
M2:
	MOVLW		D'249'
	MOVWF		TEMPO2
M1:	
	NOP
	NOP
	NOP
	NOP
	NOP
	
	DECFSZ		TEMPO2
	GOTO		M1
	
	DECFSZ		TEMPO1
	GOTO		M2
	
	RETURN
		
	END
	
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
