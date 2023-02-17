
_main:

;aula040.c,28 :: 		void main() {
;aula040.c,29 :: 		CMCON = 0b00000111;   // desabilita comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula040.c,31 :: 		T1CON = 0b00110001;   // prescaler 1:8, Timer1 On
	MOVLW      49
	MOVWF      T1CON+0
;aula040.c,33 :: 		TMR1H = 0;            // Timer1 inicia em 0
	CLRF       TMR1H+0
;aula040.c,34 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;aula040.c,36 :: 		TRISC = 0;
	CLRF       TRISC+0
;aula040.c,37 :: 		PORTC = 0;
	CLRF       PORTC+0
;aula040.c,39 :: 		while(1){
L_main0:
;aula040.c,40 :: 		if(TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, 0
	GOTO       L_main2
;aula040.c,41 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, 0
;aula040.c,42 :: 		RC4_bit = ~RC4_bit; // inverte o estado a cada 16ms (prescaler 1:1)
	MOVLW      16
	XORWF      RC4_bit+0, 1
;aula040.c,43 :: 		}
L_main2:
;aula040.c,44 :: 		}
	GOTO       L_main0
;aula040.c,49 :: 		}
	GOTO       $+0
; end of _main
