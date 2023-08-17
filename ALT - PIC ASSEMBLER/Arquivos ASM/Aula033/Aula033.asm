			TITLE "Aula 033 Saídas Digitais"           ;TÍTULO DO PROGRAMA
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
			CONTADOR EQU 0X0E   

			ORG 0X04               ;VETOR DE RESET
			RETFIE

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INICIO
			BANKSEL TRISB
			CLRF TRISB

			BANKSEL PORTB
MAIN                              ;PROGRAMA PRINCIPAL
			MOVLW B'00000000'
			MOVWF PORTB
	                           
			MOVLW D'8'
			MOVWF CONTADOR
			RLF PORTB
			CALL DELAY_500         ;CHAMADA FUNÇÃO DE TEMPORIZAÇÃO
			DECFSZ CONTADOR
			GOTO $-3
			
			MOVLW D'8'
			MOVWF CONTADOR
			RRF PORTB
			CALL DELAY_500         ;CHAMADA FUNÇÃO DE TEMPORIZAÇÃO
			DECFSZ CONTADOR
			GOTO $-3
				
			GOTO MAIN              ;LOOP INFINITO



DELAY_500                              ;ROTINA DE TEMPORIZAÇÃO
			MOVLW D'249'
			MOVWF TEMPO1
M2
			MOVLW D'251'
			MOVWF TEMPO2
M1
			NOP
			NOP
			NOP
			NOP
			NOP
			DECFSZ TEMPO2
			GOTO M1

			DECFSZ TEMPO1
			GOTO M2

			RETURN            ;RETORNO DA FUNÇÃO
			

			END
			