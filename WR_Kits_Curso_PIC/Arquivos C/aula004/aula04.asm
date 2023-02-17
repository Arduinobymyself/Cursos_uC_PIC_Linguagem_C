
_main:

;aula04.c,4 :: 		void main() {
;aula04.c,5 :: 		ANSEL =0;    // desliga as entradas AD
	CLRF       ANSEL+0
;aula04.c,6 :: 		CMCON = 7;   // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula04.c,9 :: 		TRISIO = 0b00010000;
	MOVLW      16
	MOVWF      TRISIO+0
;aula04.c,10 :: 		GPIO = 0;
	CLRF       GPIO+0
;aula04.c,11 :: 		while(1){
L_main0:
;aula04.c,12 :: 		if(GPIO.F5 == 1){    // se botão pressionado
	BTFSS      GPIO+0, 5
	GOTO       L_main2
;aula04.c,13 :: 		GPIO.F0 = 1;     // liga o led
	BSF        GPIO+0, 0
;aula04.c,14 :: 		delay_ms(2000);  // por 2 segundos
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula04.c,15 :: 		} else {
	GOTO       L_main4
L_main2:
;aula04.c,16 :: 		GPIO.F0 = 0;     // desliga o led
	BCF        GPIO+0, 0
;aula04.c,17 :: 		}
L_main4:
;aula04.c,18 :: 		}
	GOTO       L_main0
;aula04.c,20 :: 		}
	GOTO       $+0
; end of _main
