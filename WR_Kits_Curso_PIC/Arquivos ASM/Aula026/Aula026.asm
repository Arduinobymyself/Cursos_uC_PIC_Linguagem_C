;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula026 - INVERS�O DE SA�DAS OU BITS ESPEC�FICOS
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
	list p=16f628a						;uC utilizado
			
			
;+++++ inclus�o de arquivos +++++
	#include <p16f628a.inc>				;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
	__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
			
;+++++ pagina��o de mem�ria +++++
	#define	banco0 bcf STATUS, RP0		;cria mnem�nico para o banco 0 de mem�ria
	#define banco1 bsf STATUS, RP0		;cria mnem�nico para o banco 1 de mem�ria
			
;+++++ entradas e sa�das +++++
	#define 	S1 PORTB, RB0			;bot�o 1 ligado em RB0 (resistores de pull-up)
	#define 	S2 PORTB, RB1   	    ;bot�o 2 ligado em RB2 (resistores de pull-up)
	#define 	LED1 PORTA, RA3			;LED 1 onboard ligado em RA3 (modo current sourcing 0 - desliga, 1 - liga)
	#define 	LED2 PORTA, RA2			;LED 2 onboard ligado em RA2 (modo current sourcing 0 - desliga, 1 - liga)
	#define		SAIDA1 PORTB, 1			;sa�da 1 definida para RB1
	#define		SAIDA2 PORTB, 4			;sa�da 2 definida para RB4
	
;+++++ constantes +++++
mask_RB1	equ B'00000010'			;m�scara para invers�o de RB1
mask_RB4	equ B'00010000'			;m�scara para invers�o de RB4
			
;+++++ registradores de uso geral GFRs +++++
	cblock		H'20'
				T1						;registrador auxiliar para rotina de delay
				T2						;registrador auxiliar para rotina de delay
	endc
			
;+++++ vetor de reset +++++
	org 		H'0000'					;origem do programa
	;TRATAMENTO DAS INTERRUP��ES AQUI
	goto		 inicio					;desvia da interrup��o

;+++++ vetor de interrup��o +++++
	org 		H'0004'					;todas as interrup��es apontam para este endere�o
	retfie								;retorna da interrup��o


;+++++ programa principal +++++
inicio:
	banco0								;seleciona o banco 0
	movlw		H'07'					; W = 0x07 (0b00000111)
	movwf 		CMCON					; CMCON = 0x07 (desabilita os comparadores I/Os digitais)
	
	banco1								;seleciona banco 1 de mem�ria
	movlw 		H'00'					;W = B'00000000'
	movwf 		TRISB					;todos os bits do PORT B como entrada s�ida
			
	banco0								;seleciona banco 0 de me�ria
	clrf PORTB							;iniciliza o PORT B
	
			
loop:									;loop infinito
	;SEU C�DIGO AQUI
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