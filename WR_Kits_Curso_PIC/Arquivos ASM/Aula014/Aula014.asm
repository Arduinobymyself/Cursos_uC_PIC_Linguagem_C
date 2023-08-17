;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula014 - DESVIOS CONDICIONAIS
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
			movlw H'FF'						;W = B'00011111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'FF'						;W = B'1110101'
			movwf TRISB						;trisb recebe W
			
			banco0							;seleciona banco 0 de meória
			movlw H'FF'						;W = B'11110101'
			movwf PORTB						;os dois LED iniciam em nível baixo (low)
			
loop:										;loop infinito
			;SEU CÓDIGO AQUI

			goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

			
			end								;fim do programa principal 
			
			
;====================================================
; INSTRUÇÕES DE DESVIO CONDICIONAL
;====================================================
;
; DECFSZ f, d
; decrementa f (d = f - 1) e desvia se f = 0
; d = 0 (W) ou d = 1 (f)
;
; INCFSZ f, d
; incrementa f (d = f + 1) e desvia se f = 0
; d = 0 (W) ou d = 1 (f)
;
; BTFSZ f, b
; testa bit do registrador f, desvia se igual a zero
;
; BTFSC f, b
; testa bit do registrador f, desvia se igual a zero
;
; BTFSS f, b
; testa bit do registrador f, desvia se igual a um
;

