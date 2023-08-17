;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula026 - INVERSÃO DE SAÍDAS OU BITS ESPECÍFICOS
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
	list p=16f628a						;uC utilizado
			
			
;+++++ inclusão de arquivos +++++
	#include <p16f628a.inc>				;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
	__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
			
;+++++ paginação de memória +++++
	#define	banco0 bcf STATUS, RP0		;cria mnemônico para o banco 0 de memória
	#define banco1 bsf STATUS, RP0		;cria mnemônico para o banco 1 de memória
			
;+++++ entradas e saídas +++++
	#define 	S1 PORTB, RB0			;botão 1 ligado em RB0 (resistores de pull-up)
	#define 	S2 PORTB, RB1   	    ;botão 2 ligado em RB2 (resistores de pull-up)
	#define 	LED1 PORTA, RA3			;LED 1 onboard ligado em RA3 (modo current sourcing 0 - desliga, 1 - liga)
	#define 	LED2 PORTA, RA2			;LED 2 onboard ligado em RA2 (modo current sourcing 0 - desliga, 1 - liga)
	#define		SAIDA1 PORTB, 1			;saída 1 definida para RB1
	#define		SAIDA2 PORTB, 4			;saída 2 definida para RB4
	
;+++++ constantes +++++
mask_RB1	equ B'00000010'			;máscara para inversão de RB1
mask_RB4	equ B'00010000'			;máscara para inversão de RB4
			
;+++++ registradores de uso geral GFRs +++++
	cblock		H'20'
				T1						;registrador auxiliar para rotina de delay
				T2						;registrador auxiliar para rotina de delay
	endc
			
;+++++ vetor de reset +++++
	org 		H'0000'					;origem do programa
	;TRATAMENTO DAS INTERRUPÇÕES AQUI
	goto		 inicio					;desvia da interrupção

;+++++ vetor de interrupção +++++
	org 		H'0004'					;todas as interrupções apontam para este endereço
	retfie								;retorna da interrupção


;+++++ programa principal +++++
inicio:
	banco0								;seleciona o banco 0
	movlw		H'07'					; W = 0x07 (0b00000111)
	movwf 		CMCON					; CMCON = 0x07 (desabilita os comparadores I/Os digitais)
	
	banco1								;seleciona banco 1 de memória
	movlw 		H'00'					;W = B'00000000'
	movwf 		TRISB					;todos os bits do PORT B como entrada sáida
			
	banco0								;seleciona banco 0 de meória
	clrf PORTB							;iniciliza o PORT B
	
			
loop:									;loop infinito
	;SEU CÓDIGO AQUI
	movlw		mask_RB1
	xorwf		PORTB, F				;PORTB = PORTB xor mask_RB1
	call		delay_500ms
	movlw		mask_RB4
	xorwf		PORTB, F				;PORTB = PORTB xor mask_RB4
	call		delay_500ms

	goto 		loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			
delay_500ms:
		movlw D'249'
		movwf T1
M1:
		movlw D'251'
		movwf T2
		
M2:
		nop
		nop
		nop
		nop
		nop
		decfsz T2
		goto M2
		
		decfsz T1
		goto M1
		
		return
		
	end									;fim do programa principal 