
_main:

;hello_world.c,1 :: 		void main() {
;hello_world.c,2 :: 		TRISB = 0;
	CLRF       TRISB+0
;hello_world.c,3 :: 		PORTB = 0;
	CLRF       PORTB+0
;hello_world.c,4 :: 		while(1){
L_main0:
;hello_world.c,5 :: 		PORTB.RB0 = 1;
	BSF        PORTB+0, 0
;hello_world.c,6 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;hello_world.c,7 :: 		PORTB.RB0 = 0;
	BCF        PORTB+0, 0
;hello_world.c,8 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;hello_world.c,9 :: 		}
	GOTO       L_main0
;hello_world.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
