;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula012 - INSTRUÇÕES ARITMÉTICAS
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
			cblock H'0C'					;bloco de memória de registradores de uso geral
			reg1							;reg1 localizado em H'0C'
			reg2							;reg2 localizado em H'0D'
			endc
			
;+++++ vetor de reset +++++
			org H'0000'						;origem do programa
			goto inicio						;desvia da interrupção

;+++++ vetor de interrupção +++++
			org H'0004'						;todas as interrupções apontam para este endereço
			retfie							;retorna da interrupção

;+++++ programa principal +++++
inicio:
			banco1							;seleciona banco 1 de memória
			movlw H'FF'						;W = B'11111111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'FF'						;W = B'11111111'
			movwf TRISB						;trisb recebe W
			
			banco0							;seleciona banco 0 de meória
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
; INSTRUÇÕES ARITMÉTICAS
;====================================================
;
; ADDLW k				W = W + k
;
; ADDWF f, d			d = W + f
; d = 0 (W) ou d = 1 (f)
;
; RLF f, d				d = f << 1 (rotaciona o registrador f um bit para a esquerda 'multiplicação por 2')
; d = 0 (W) ou d = 1 (f)
;
; RRF f, d				d = f >> 1 (rotaciona o registrador f um bit para a direita 'divisão por 2')
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
