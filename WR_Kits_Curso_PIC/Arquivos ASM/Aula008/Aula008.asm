;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conteúdo: Aula008 - SUB-ROTINAS
; Acende LED 1 (RB1) via Botão 1 (RB0)
; Acende LED 2 (RB3) via Botão 2 (RB2)
; 			acionamento simples (aperta acende, solta apaga)
;
; LED no modo current sourcing
; '0' - apaga
; '1' - acende
;
; Botão com resistores de pull-up
; '0' botão acionado
; '1' botão liberado
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
			call trata_botao1
			call trata_botao2
			goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			
trata_botao1:								;faz tratamento do botão 1								
			btfsc botao1					;botão foi pressionado?
			goto apaga_LED1					;não, desvia
			bsf LED1						;sim, liga LED 1
			return							;retorna da subrotina
apaga_LED1:
			bcf LED1						;apaga LED 1
			return							;retorna da subrotina
			
trata_botao2:								;faz tratamento do botão 2
			btfsc botao2					;botão foi pressionado?
			goto apaga_LED2					;não, desvia
			bsf LED2						;sim, liga LED 1
			return
apaga_LED2:
			bcf LED2						;apaga LED 1
			return
			
			end								;fim do programa principal 