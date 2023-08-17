;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula013 - INSTRUÇÕES LÓGICAS
;
;
; MCU: PIC16F84A clock: 4MHz
;
; Autor: Marcelo Moraes
; Data: Junho 2023
; arduinobymyself.blogspot.com.br
; arduinobymyself@gmail.com
;
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			list p=16f84a					;uC utilizado
			
			
;+++++ inclusão de arquivos +++++
			#include <p16f84a.inc>			;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
			;clock 4MHz, watch dog disabled, power up timer disabled, code protection disabled
			__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
			
;+++++ paginação de memória +++++
			#define	banco0 bcf STATUS, RP0	;cria mnemônico para o banco 0 de memória
			#define banco1 bsf STATUS, RP0	;cria mnemônico para o banco 1 de memória
			
;+++++ entradas e saídas +++++
			#define botao1 PORTB, RB0		;botão 1 ligado em RB0
			#define botao2 PORTB, RB2       ;botão 2 ligado em RB2
			#define LED1 PORTB, RB1			;LED 1 ligado em RB1
			#define LED2 PORTB, RB3			;LED 2 ligado em RB3
			
	;+++++ registradores de uso geral +++++
			
;+++++ vetor de reset +++++
			org H'0000'						;origem do programa
			goto inicio						;desvia da interrupção

;+++++ vetor de interrupção +++++
			org H'0004'						;todas as interrupções apontam para este endereço
			retfie							;retorna da interrupção

;+++++ programa principal +++++
inicio:
			banco1							;seleciona banco 1 de memória
			movlw H'1F'						;W = B'00011111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'F5'						;W = B'1110101'
			movwf TRISB						;trisb recebe W
			
			banco0							;seleciona banco 0 de meória
			movlw H'F5'						;W = B'11110101'
			movwf PORTB						;os dois LED iniciam em nível baixo (low)
			
loop:										;loop infinito


			goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

			

			end								;fim do programa principal 
			
			
			
			
;====================================================
; INSTRUÇÕES LÓGICAS
;====================================================
;
; ANDLW k				W = W AND k
; afeta a flag Z do STATUS
;
; ANDWF f, d			d = W AND f
; d = 0 (W) ou d = 1 (f)
;
; COMF f, d				d = NOT f
; d = 0 (W) ou d = 1 (f)
; afeta a flag Z do STATUS
; 			
; IORLW k				W = W OR k			
; afeta a flag Z do STATUS
;
; IORWF f, d			d = W OR f
; d = 0 (W) ou d = 1 (f)
; afeta a flag Z do STATUS
;
; XORLW K				W = W XOR k			
; afeta a flag Z do STATUS
;
; XORWF f, d			d = W XOR f
; d = 0 (W) ou d = 1 (f)
; afeta a flag Z do STATUS
;