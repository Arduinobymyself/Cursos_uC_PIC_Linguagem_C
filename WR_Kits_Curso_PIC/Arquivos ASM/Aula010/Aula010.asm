;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Curso: Assembly para Microcontroladores PIC 
; Conte�do: Aula010 - DELAY E O CICLO DE M�QUINA
;
; aciona o LED 1 ligado em RB1 e apaga o LED 2 ligado em RB3
; aguarda 500ms
; apaga o LED 1 ligado em RB1 e aciona o LED 2 ligado em RB3
; aguarda 500ms
; volta a executar o c�digo em loop inifinito
;
; LEDs - current sourcing:
; '0' - apaga
; '1' - acende
;
; Ciclo de m�quina
; CM = 1/(Fosc/4) = 1/(4M/4) = 1us
;
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
			;tempo1 equ H'0C'
			;tempo2 equ H'0D'
			cblock H'0C'					;in�cio do bloco de mem�ria de uso geral
			tempo1							;H'0C'
			tempo2							;H'0D'
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
			movlw H'1F'						;W = B'00011111'
			movwf TRISA						;todos os bits do PORT A como entrada
			movlw H'F5'						;W = B'1110101'
			movwf TRISB						;trisb recebe W
			
			banco0							;seleciona banco 0 de me�ria
			movlw H'F5'						;W = B'11110101'
			movwf PORTB						;os dois LED iniciam em n�vel baixo (low)
			
loop:										;loop infinito
			bsf LED1						;liga LED 1
			bcf LED2						;apaga LED 2
			call delay_500ms				;rotina de delay para 500ms (gasta 2 CM)
			bcf LED1						;apaga LED 1
			bsf LED2						;liga LED 2
			call delay_500ms				;rotina de delay para 500ms
							

			goto loop
			
;+++++ desenvolvimento das sub-rotinas +++++
			
delay_500ms:
			movlw D'221'					;move 221 para registradoe W
			movwf tempo1					;move W para a primeira posi��o de mem�ria de uso geral
											;gasto 2 CM
aux1:
			movlw D'251'					;move 251 para o registrador W
			movwf tempo2					;move W para a segunda posi��o de mem�ria de uso geral
											;gasto 2 CM
aux2:
			nop								;conjunto de nops para gastar tempo
			nop								;gasto 6 CM
			nop
			nop
			nop
			nop
			;nop
			
			decfsz tempo2					;decrementa o contador 1
			goto aux2
			
			decfsz tempo1					;decrementa o contador 2
			goto aux1
			
			return
			
			
			end								;fim do programa principal 