;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula000
;
;
; cristal oscilator externo 4Mhz			_XT_OSC
; watch dog timer desabilitado				_WDT_OFF
; power up timer habilitado (72ms)			_PWRTE_OFF
; master clear habilitado					_MCLRE_ON					
; brown out desabilitado					_BOREN_OFF
; sem programa��o por baixa tens�o			_LVP_OFF
; sem prote��o de mem�ria de dados			_CPD_OFF
; sem prote��o de c�digo					_CP_OFF
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
			
			
;+++++ inclus�o de arquivos +++++
	#include <p16f84a.inc>			;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
	;clock 4MHz, watch dog disabled, power up timer disabled, code protection disabled
	__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
			
;+++++ pagina��o de mem�ria +++++
	#define	banco0 bcf STATUS, RP0	;cria mnem�nico para o banco 0 de mem�ria
	#define banco1 bsf STATUS, RP0	;cria mnem�nico para o banco 1 de mem�ria
			
;+++++ entradas e sa�das +++++
	#define botao1 PORTB, RB0		;bot�o 1 ligado em RB0
	#define botao2 PORTB, RB2       ;bot�o 2 ligado em RB2
	#define LED1 PORTB, RB1			;LED 1 ligado em RB1
	#define LED2 PORTB, RB3			;LED 2 ligado em RB3
			
;+++++ registradores de uso geral +++++
			
;+++++ vetor de reset +++++
	org H'0000'						;origem do programa
	goto inicio						;desvia da interrup��o

;+++++ vetor de interrup��o +++++
	org H'0004'						;todas as interrup��es apontam para este endere�o
	;TRATAMENTO DAS INTERRUP��ES AQUI
	retfie							;retorna da interrup��o

;+++++ programa principal +++++
inicio:
	banco1							;seleciona banco 1 de mem�ria
	movlw H'1F'						;W = B'00011111'
	movwf TRISA						;todos os bits do PORT A como entrada
	movlw H'F5'						;W = B'1110101'
	movwf TRISB						;trisb recebe W
			
	banco0							;seleciona banco 0 de me�ria
	movlw H'F5'						;W = B'11110101'
	movwf PORTB						;os dois LED iniciam em n�vel baixo (low)
			
loop:										;loop infinito
	;SEU C�DIGO AQUI

	goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

	end								;fim do programa principal 