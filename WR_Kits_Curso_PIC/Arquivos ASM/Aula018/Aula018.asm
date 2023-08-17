;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula018 - FUSE BITS DO PIC 16F628A
;			Aula019 - BANCOS DE MEM�RIA DO PIC 16F628A
;			Aula020 - INICIALIZA��O DOS REGISTRADORES
;			Aula021 - ENTRADAS E SA�DAS
;			Aula022 - PR�TICA COM ENTRADAS E SA�DAS
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
	list p=16f628a					;uC utilizado
			
			
;+++++ inclus�o de arquivos +++++
	#include <p16f628a.inc>			;incluindo o arquivo do uC
			
;+++++ fuse bits +++++
	__config _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
			
;+++++ pagina��o de mem�ria +++++
	#define	banco0 bcf STATUS, RP0	;cria mnem�nico para o banco 0 de mem�ria
	#define banco1 bsf STATUS, RP0	;cria mnem�nico para o banco 1 de mem�ria
			
;+++++ entradas e sa�das +++++
	#define S1 PORTB, RB0			;bot�o 1 ligado em RB0 (resistores de pull-up, pressionado = 0)
	#define S2 PORTB, RB1   	    ;bot�o 2 ligado em RB2 (resistores de pull-up, pressionado = 0)
	#define LED1 PORTA, RA3			;LED 1 onboard ligado em RA3 (modo current sourcing, 0 - desliga, 1 - liga)
	#define LED2 PORTA, RA2			;LED 2 onboard ligado em RA2 (modo current sourcing, 0 - desliga, 1 - liga)
			
;+++++ registradores de uso geral GFRs +++++
			
;+++++ vetor de reset +++++
	org H'0000'						;origem do programa
	;TRATAMENTO DAS INTERRUP��ES AQUI
	goto inicio						;desvia da interrup��o

;+++++ vetor de interrup��o +++++
	org H'0004'						;todas as interrup��es apontam para este endere�o
	retfie							;retorna da interrup��o


;+++++ programa principal +++++
inicio:
	banco0							;seleciona o banco 0
	movlw H'07'						; W = 0x07 (0b00000111)
	movwf CMCON						; CMCON = 0x07 (desabilita os comparadores I/Os digitais)
	
	banco1							;seleciona banco 1 de mem�ria
	movlw H'00'						;W = B'00000000'
	movwf OPTION_REG				;habilita resistores de pull-up internos no PORT B
	
	movlw H'33'						;W = B'00110011'
	movwf TRISA						;pinos 2 e 3 do PORT A como sa�da digital
	
	movlw H'FF'						;W = B'11111111'
	movwf TRISB						;todos os bits do PORT B como entrada digital
			
	banco0							;seleciona banco 0 de me�ria
	bcf LED1						;LED1 inicia desligado
	bcf LED2						;LED2 inicia desligado
	
			
loop:								;loop infinito
	btfss S1						;testa o bot�o 1 (pressionado) 
	goto led1On						;sim, desvia para ligar LED1
	bcf LED1						;n�o, desliga LED1
	goto loop						;volta ao loop
	
led1On:
	bsf LED1						;liga LED1
	goto loop						;volta ao loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

		
	end								;fim do programa principal 