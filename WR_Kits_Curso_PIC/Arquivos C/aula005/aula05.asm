
_main:

;aula05.c,6 :: 		void main() {
;aula05.c,7 :: 		ANSEL = 0; // sem conversores A/D somente portas digitais
	CLRF       ANSEL+0
;aula05.c,8 :: 		CMCON = 7; // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula05.c,9 :: 		TRISIO0_bit = 0; // pino de I/O 0 como saída
	BCF        TRISIO0_bit+0, 0
;aula05.c,10 :: 		TRISIO1_bit = 0; // pino de I/O 1 como saída
	BCF        TRISIO1_bit+0, 1
;aula05.c,12 :: 		GPIO = 0; // GPIO inicia em nível baixo
	CLRF       GPIO+0
;aula05.c,14 :: 		while(1){
L_main0:
;aula05.c,16 :: 		gpio.f0 = 1;
	BSF        GPIO+0, 0
;aula05.c,17 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;aula05.c,18 :: 		gpio.f0 = 0;
	BCF        GPIO+0, 0
;aula05.c,19 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula05.c,22 :: 		gpio.f1 = 1;
	BSF        GPIO+0, 1
;aula05.c,23 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;aula05.c,24 :: 		gpio.f1 = 0;
	BCF        GPIO+0, 1
;aula05.c,25 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;aula05.c,26 :: 		}
	GOTO       L_main0
;aula05.c,28 :: 		}
	GOTO       $+0
; end of _main
