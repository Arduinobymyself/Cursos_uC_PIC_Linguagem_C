			TITLE "Meu Primeiro Programa em Assember"           ;TÍTULO DO PROGRAMA
			LIST P=16F84A                                       ;uC UTILIZADO
			#INCLUDE <P16F84A.INC>                              ;BIBLIOTECA
			__CONFIG _XT_OSC & _CP_OFF & _WDT_OFF & _PWRTE_ON   ;FUSE BITS
			#DEFINE BANCO_0 BCF STATUS, RP0
			#DEFINE BANCO_1 BSF STATUS, RP0

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++			
			
			ORG 0x00               ;VETOR DE INÍCIO
			GOTO INICIO            ;VAI PARA O INÍCIO DO PROGRAMA   
			TEMPO1 EQU 0X0C
			TEMPO2 EQU 0X0D  
			TEMPO3 EQU 0X0E 

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
			CALL DELAY
DELAY
			MOVLW D'152'
			MOVWF TEMPO1
M3
			MOVLW D'152'
			MOVWF TEMPO2
M2
			MOVLW D'152'
			MOVWF TEMPO3
M1
			NOP
			NOP
			NOP
			NOP
			NOP
	
			DECFSZ TEMPO3
			GOTO M1

			DECFSZ TEMPO2
			GOTO M2

			DECFSZ TEMPO1
			GOTO M3

			GOTO DENOVO            ;LOOP INFINITO

			END
			