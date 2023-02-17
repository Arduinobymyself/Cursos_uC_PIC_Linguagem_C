
_main:

;aula03.c,4 :: 		void main() {
;aula03.c,5 :: 		CMCON = 7;       // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula03.c,6 :: 		ANSEL = 0;       // sem conversores AD, somente portas digitais
	CLRF       ANSEL+0
;aula03.c,7 :: 		TRISIO0_bit = 0; // pino de IO 0 como saída
	BCF        TRISIO0_bit+0, 0
;aula03.c,8 :: 		TRISIO1_bit = 0; // pino de IO 1 como saída
	BCF        TRISIO1_bit+0, 1
;aula03.c,10 :: 		GPIO = 0;
	CLRF       GPIO+0
;aula03.c,12 :: 		while(1){
L_main0:
;aula03.c,13 :: 		GPIO.F0 = 1;
	BSF        GPIO+0, 0
;aula03.c,14 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;aula03.c,15 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;aula03.c,16 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;aula03.c,17 :: 		GPIO.F1 = 1;
	BSF        GPIO+0, 1
;aula03.c,18 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;aula03.c,19 :: 		}
	GOTO       L_main0
;aula03.c,20 :: 		}
	GOTO       $+0
; end of _main
