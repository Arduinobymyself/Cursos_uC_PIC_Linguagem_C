;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula012 - INSTRU��ES ARITM�TICAS
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
			cblock H'0C'					;bloco de mem�ria de registradores de uso geral
			reg1							;reg1 localizado em H'0C'
			reg2							;reg2 localizado em H'0D'
			endc
			
;+++++ vetor de reset +++++
			org H'0000'						;origem do programa
			goto inicio						;desvia da interrup��o

;+++++ vetor de interrup��o +++++
			org H'0004'						;todas as interrup��es apontam para este endere�o
			retfie							;retorna da interrup��o

;+++++ programa principal +++++
inicio:
			banco1							;seleciona banco 1 de mem�ria
			movlw H'FF'						;W = B'11111111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'FF'						;W = B'11111111'
			movwf TRISB						;trisb recebe W
			
			banco0							;seleciona banco 0 de me�ria
			clrf reg1
			clrf reg2
			
loop:										;loop infinito
			movlw D'10'
			addlw D'35'						;W = 10+35 = 45
			
			movlw H'AC'
			movwf reg1
			addwf reg1, w					;AC+AC = 158 W=58 e carry = 1
			
			movlw D'40'
			sublw D'20'
			
			movlw H'AC'
			movwf reg2
			subwf reg2, w					;AC-AC = 0

			goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			

			
			end								;fim do programa principal 
			
;====================================================
; INSTRU��ES ARITM�TICAS
;====================================================
;
; ADDLW k				W = W + k
;
; ADDWF f, d			d = W + f
; d = 0 (W) ou d = 1 (f)
;
; RLF f, d				d = f << 1 (rotaciona o registrador f um bit para a esquerda 'multiplica��o por 2')
; d = 0 (W) ou d = 1 (f)
;
; RRF f, d				d = f >> 1 (rotaciona o registrador f um bit para a direita 'divis�o por 2')
; d = 0 (W) ou d = 1 (f)
;
; SUBLW k				W = W - k
;
; SUBWF					W = W - f				
; d = 0 (W) ou d = 1 (f)
;
;
;
;
;
;
;
