;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula 001, Aula002, Aula003, Aula004, Aula005
;
; MCU: PIC16F84A clock: 4MHz
;
; Autor: Marcelo Moraes
; Data: Junho 2023
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			list p=16f84a			;uC utilizado
			
			
;+++++ inclusão de arquivos +++++
			#include <p16f84a.inc>		;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
			;clock 4MHz, watch dog disabled, power up timer disabled, code protection disabled
			__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
			
;+++++ paginação de memória +++++
			#define	bank0 bcf STATUS, RP0	;cria mnemônico para o banco 0 de memória
			#define bank1 bsf STATUS, RP0	;cria mnemônico para o banco 1 de memória
			
;+++++ entradas e saídas +++++
			#define button1 PORTB, RB0		;botão 1 ligado em RB0
			#define LED1 PORTB, RB7			;LED 1 ligado em RB7
			
;+++++ vetor de reset +++++
			org H'0000'						;origem do programa
			goto inicio						;desvia da interrupção

;+++++ vetor de interrupção +++++
			org H'0004'						;todas as interrupções apontam para este endereço
			retfie							;retorna da interrupção

;+++++ programa principal +++++
inicio:
			bank1							;seleciona banco 1 de memória
			movlw H'1F'						;W = B'00011111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'7F'						;W = B'0111111'
			;como padrão deixamos os pinos não utilizados configurados como entrada
			movwf TRISB						;trisb recebe W (apenas RB7 do PORT B como saída)
			bank0							;seleciona banco 0 de meória
			movlw H'80'						;W = B'10000000'
			movwf PORTB						;RB7 inicia em nível alto (high)
			
			goto $							;loop infinito
			
			
			end								;fim do programa principal 