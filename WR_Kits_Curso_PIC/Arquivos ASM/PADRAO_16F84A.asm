;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula000
;
;
; cristal oscilator externo 4Mhz			_XT_OSC
; watch dog timer desabilitado				_WDT_OFF
; power up timer habilitado (72ms)			_PWRTE_OFF
; master clear habilitado					_MCLRE_ON					
; brown out desabilitado					_BOREN_OFF
; sem programação por baixa tensão			_LVP_OFF
; sem proteção de memória de dados			_CPD_OFF
; sem proteção de código					_CP_OFF
;
;
;
; MCU: PIC16F628A 
; Clock: 4MHz
; CM = 1us
;
; Autor: Marcelo Moraes
; Data: Junho 2023
; arduinobymyself.blogspot.com.br
; arduinobymyself@gmail.com
;
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;+++++ listagem do processador utilizado +++++
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
	;TRATAMENTO DAS INTERRUPÇÕES AQUI
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
	;SEU CÓDIGO AQUI

	goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

	end								;fim do programa principal 