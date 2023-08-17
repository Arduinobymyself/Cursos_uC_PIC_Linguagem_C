;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula 001, Aula002, Aula003, Aula004, Aula005
;
; MCU: PIC16F84A clock: 4MHz
;
; Autor: Marcelo Moraes
; Data: Junho 2023
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			list p=16f84a			;uC utilizado
			
			
;+++++ inclus�o de arquivos +++++
			#include <p16f84a.inc>		;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
			;clock 4MHz, watch dog disabled, power up timer disabled, code protection disabled
			__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
			
;+++++ pagina��o de mem�ria +++++
			#define	bank0 bcf STATUS, RP0	;cria mnem�nico para o banco 0 de mem�ria
			#define bank1 bsf STATUS, RP0	;cria mnem�nico para o banco 1 de mem�ria
			
;+++++ entradas e sa�das +++++
			#define button1 PORTB, RB0		;bot�o 1 ligado em RB0
			#define LED1 PORTB, RB7			;LED 1 ligado em RB7
			
;+++++ vetor de reset +++++
			org H'0000'						;origem do programa
			goto inicio						;desvia da interrup��o

;+++++ vetor de interrup��o +++++
			org H'0004'						;todas as interrup��es apontam para este endere�o
			retfie							;retorna da interrup��o

;+++++ programa principal +++++
inicio:
			bank1							;seleciona banco 1 de mem�ria
			movlw H'1F'						;W = B'00011111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'7F'						;W = B'0111111'
			;como padr�o deixamos os pinos n�o utilizados configurados como entrada
			movwf TRISB						;trisb recebe W (apenas RB7 do PORT B como sa�da)
			bank0							;seleciona banco 0 de me�ria
			movlw H'80'						;W = B'10000000'
			movwf PORTB						;RB7 inicia em n�vel alto (high)
			
			goto $							;loop infinito
			
			
			end								;fim do programa principal 