;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula018 - FUSE BITS DO PIC 16F628A
;			Aula019 - BANCOS DE MEMÓRIA DO PIC 16F628A
;			Aula020 - INICIALIZAÇÃO DOS REGISTRADORES
;			Aula021 - ENTRADAS E SAÍDAS
;			Aula022 - PRÁTICA COM ENTRADAS E SAÍDAS
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
	list p=16f628a					;uC utilizado
			
			
;+++++ inclusão de arquivos +++++
	#include <p16f628a.inc>			;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
	__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
			
;+++++ paginação de memória +++++
	#define	banco0 bcf STATUS, RP0	;cria mnemônico para o banco 0 de memória
	#define banco1 bsf STATUS, RP0	;cria mnemônico para o banco 1 de memória
			
;+++++ entradas e saídas +++++
	#define S1 PORTB, RB0			;botão 1 ligado em RB0 (resistores de pull-up, pressionado = 0)
	#define S2 PORTB, RB1   	    ;botão 2 ligado em RB2 (resistores de pull-up, pressionado = 0)
	#define LED1 PORTA, RA3			;LED 1 onboard ligado em RA3 (modo current sourcing, 0 - desliga, 1 - liga)
	#define LED2 PORTA, RA2			;LED 2 onboard ligado em RA2 (modo current sourcing, 0 - desliga, 1 - liga)
			
;+++++ registradores de uso geral GFRs +++++
			
;+++++ vetor de reset +++++
	org H'0000'						;origem do programa
	;TRATAMENTO DAS INTERRUPÇÕES AQUI
	goto inicio						;desvia da interrupção

;+++++ vetor de interrupção +++++
	org H'0004'						;todas as interrupções apontam para este endereço
	retfie							;retorna da interrupção


;+++++ programa principal +++++
inicio:
	banco0							;seleciona o banco 0
	movlw H'07'						; W = 0x07 (0b00000111)
	movwf CMCON						; CMCON = 0x07 (desabilita os comparadores I/Os digitais)
	
	banco1							;seleciona banco 1 de memória
	movlw H'00'						;W = B'00000000'
	movwf OPTION_REG				;habilita resistores de pull-up internos no PORT B
	
	movlw H'33'						;W = B'00110011'
	movwf TRISA						;pinos 2 e 3 do PORT A como saída digital
	
	movlw H'FF'						;W = B'11111111'
	movwf TRISB						;todos os bits do PORT B como entrada digital
			
	banco0							;seleciona banco 0 de meória
	bcf LED1						;LED1 inicia desligado
	bcf LED2						;LED2 inicia desligado
	
			
loop:								;loop infinito
	btfss S1						;testa o botão 1 (pressionado) 
	goto led1On						;sim, desvia para ligar LED1
	bcf LED1						;não, desliga LED1
	goto loop						;volta ao loop
	
led1On:
	bsf LED1						;liga LED1
	goto loop						;volta ao loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

		
	end								;fim do programa principal 