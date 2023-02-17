
_main:

;12f675_teste_leds.c,4 :: 		void main() {
;12f675_teste_leds.c,5 :: 		ANSEL =0;    // desliga as entradas AD
	CLRF       ANSEL+0
;12f675_teste_leds.c,6 :: 		CMCON = 7;   // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;12f675_teste_leds.c,9 :: 		TRISIO = 0b00000000;
	CLRF       TRISIO+0
;12f675_teste_leds.c,10 :: 		GPIO = 0;
	CLRF       GPIO+0
;12f675_teste_leds.c,11 :: 		while(1){
L_main0:
;12f675_teste_leds.c,12 :: 		GPIO.F0 = 1;
	BSF        GPIO+0, 0
;12f675_teste_leds.c,13 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;12f675_teste_leds.c,14 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;12f675_teste_leds.c,15 :: 		GPIO.F1 = 1;
	BSF        GPIO+0, 1
;12f675_teste_leds.c,16 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;12f675_teste_leds.c,17 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;12f675_teste_leds.c,18 :: 		GPIO.F2 = 1;
	BSF        GPIO+0, 2
;12f675_teste_leds.c,19 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;12f675_teste_leds.c,20 :: 		GPIO.F2 = 0;
	BCF        GPIO+0, 2
;12f675_teste_leds.c,21 :: 		GPIO.F4 = 1;
	BSF        GPIO+0, 4
;12f675_teste_leds.c,22 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;12f675_teste_leds.c,23 :: 		GPIO.F4 = 0;
	BCF        GPIO+0, 4
;12f675_teste_leds.c,25 :: 		}
	GOTO       L_main0
;12f675_teste_leds.c,27 :: 		}
	GOTO       $+0
; end of _main
