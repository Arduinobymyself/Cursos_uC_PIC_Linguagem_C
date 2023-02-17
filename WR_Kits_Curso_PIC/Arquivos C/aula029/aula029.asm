
_main:

;aula029.c,33 :: 		void main() {
;aula029.c,35 :: 		INTCON.GIE = 1; // habilita a interrupção global
	BSF        INTCON+0, 7
;aula029.c,36 :: 		INTCON.PEIE = 1; // habilita a interrupção por periféricos
	BSF        INTCON+0, 6
;aula029.c,37 :: 		PIE1.TMR2IE = 1; // habilita interrupção do Timer 2 por comparação TMR2 com PR2
	BSF        PIE1+0, 1
;aula029.c,38 :: 		T2CON = 0b00011101; // (0), (0011) postscaler 1:4, (1) Timer 2 habilitado, (01) prescaler 1:4
	MOVLW      29
	MOVWF      T2CON+0
;aula029.c,39 :: 		PR2 = 100; //
	MOVLW      100
	MOVWF      PR2+0
;aula029.c,40 :: 		TRISB = 0; // todo port B como saída
	CLRF       TRISB+0
;aula029.c,41 :: 		PORTB = 0; // port B inciando em nível baixo
	CLRF       PORTB+0
;aula029.c,51 :: 		while(1){
L_main0:
;aula029.c,53 :: 		}
	GOTO       L_main0
;aula029.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula029.c,58 :: 		void interrupt(){
;aula029.c,60 :: 		if(PIR1.TMR2IF){ // se houve estouro do Timer 2
	BTFSS      PIR1+0, 1
	GOTO       L_interrupt2
;aula029.c,61 :: 		PORTB = ~PORTB; // inverte o valor do port B
	COMF       PORTB+0, 1
;aula029.c,62 :: 		PIR1.TMR2IF = 0; // limpa a flag de estouro do Timer 2
	BCF        PIR1+0, 1
;aula029.c,63 :: 		}
L_interrupt2:
;aula029.c,65 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
