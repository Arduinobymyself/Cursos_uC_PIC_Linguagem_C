
_main:

;codigo_3.c,14 :: 		void main() {
;codigo_3.c,16 :: 		ADCON1 = 7;           // desabilita comparadores internos
	MOVLW      7
	MOVWF      ADCON1+0
;codigo_3.c,17 :: 		TRISD = 0;            // port D omo saída
	CLRF       TRISD+0
;codigo_3.c,18 :: 		PORTD = 0;            // port D inicia em LOW
	CLRF       PORTD+0
;codigo_3.c,19 :: 		TRISB.RB0 = 1;        // port B RB0 como entrada
	BSF        TRISB+0, 0
;codigo_3.c,20 :: 		PORTB.RB0 = 1;        // port B RB0 com pull-up
	BSF        PORTB+0, 0
;codigo_3.c,22 :: 		while(TRUE){
L_main0:
;codigo_3.c,24 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;codigo_3.c,25 :: 		PORTD++; // incrementa o port D
	INCF       PORTD+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;codigo_3.c,26 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;codigo_3.c,27 :: 		}
L_main2:
;codigo_3.c,29 :: 		}
	GOTO       L_main0
;codigo_3.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
