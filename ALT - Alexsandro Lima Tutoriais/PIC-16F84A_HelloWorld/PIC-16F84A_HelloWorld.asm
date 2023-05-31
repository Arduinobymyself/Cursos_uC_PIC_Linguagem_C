
_main:

;PIC-16F84A_HelloWorld.c,3 :: 		void main() {
;PIC-16F84A_HelloWorld.c,4 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;PIC-16F84A_HelloWorld.c,5 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;PIC-16F84A_HelloWorld.c,7 :: 		while(1){
L_main0:
;PIC-16F84A_HelloWorld.c,8 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;PIC-16F84A_HelloWorld.c,9 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;PIC-16F84A_HelloWorld.c,10 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;PIC-16F84A_HelloWorld.c,11 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;PIC-16F84A_HelloWorld.c,12 :: 		}
	GOTO       L_main0
;PIC-16F84A_HelloWorld.c,13 :: 		}
	GOTO       $+0
; end of _main
