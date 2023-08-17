			TITLE "Meu Primeiro Programa em Assember"           ;TÍTULO DO PROGRAMA
			LIST P=16F84A                                       ;uC UTILIZADO
			#INCLUDE <P16F84A.INC>                              ;BIBLIOTECA
			__CONFIG _XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON   ;FUSE BITS
			#DEFINE BANCO_0 BCF STATUS, RP0
			#DEFINE BANCO_1 BSF STATUS, RP0

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++			
			
			ORG 0x00               ;VETOR DE INÍCIO
			GOTO INICIO            ;VAI PARA O INÍCIO DO PROGRAMA      

			ORG 0X04               ;VETOR DE RESET
			RETFIE

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO
			;BSF STATUS, RP0
			;BANCO_1
			BANKSEL TRISB

			;MOVLW b'00000000'      ;VALOR 0X00
			;MOVWF TRISB            ;CONFIGURA PORT B COMO SAÍDA
			CLRF TRISB

			;BCF STATUS, RP0
			;BANCO_0
			BANKSEL PORTB
		
DENOVO	
			COMF PORTB             ;INVERTE OS BITS DO PORT B
			MOVLW b'11110000'      ;VALOR 0XF0
			MOVWF PORTB            ;ATRIBUI VALOR AO PORT B
			SWAPF PORTB            ;INVERTE OS NIBBLES DO PORT B
			GOTO DENOVO            ;LOOP INFINITO

			END
			