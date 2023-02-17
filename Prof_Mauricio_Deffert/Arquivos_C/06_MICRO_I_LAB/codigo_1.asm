
_main:

;codigo_1.c,5 :: 		void main() {
;codigo_1.c,7 :: 		ADCON1 = 7;           // desabilita comparadores internos
	MOVLW      7
	MOVWF      ADCON1+0
;codigo_1.c,8 :: 		TRISD = 0;            // port D omo saída
	CLRF       TRISD+0
;codigo_1.c,9 :: 		PORTD = 0;            // port D inicia em LOW
	CLRF       PORTD+0
;codigo_1.c,10 :: 		TRISB.RB0 = 1;        // port B RB0 como entrada
	BSF        TRISB+0, 0
;codigo_1.c,11 :: 		PORTB.RB0 = 1;        // port B RB0 com pull-up
	BSF        PORTB+0, 0
;codigo_1.c,13 :: 		while(1){
L_main0:
;codigo_1.c,15 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;codigo_1.c,16 :: 		PORTD.RD0 = 1;
	BSF        PORTD+0, 0
;codigo_1.c,17 :: 		PORTD.RD0 = 0;
	BCF        PORTD+0, 0
;codigo_1.c,18 :: 		delay_ms(10);
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
;codigo_1.c,19 :: 		}
L_main2:
;codigo_1.c,20 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main4
;codigo_1.c,21 :: 		PORTD.RD1 = 1;
	BSF        PORTD+0, 1
;codigo_1.c,22 :: 		} else {
	GOTO       L_main5
L_main4:
;codigo_1.c,23 :: 		PORTD.RD1 = 0;
	BCF        PORTD+0, 1
;codigo_1.c,24 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;codigo_1.c,25 :: 		}
L_main5:
;codigo_1.c,27 :: 		}
	GOTO       L_main0
;codigo_1.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
