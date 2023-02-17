
_main:
;aula02.c,3 :: 		void main() {
;aula02.c,4 :: 		TRISB = 0b00000000; // todo o port B como saída
	CLRF       TRISB+0
;aula02.c,5 :: 		PORTB = 0b00000000; // todo o port B em nível lógico 0
	CLRF       PORTB+0
;aula02.c,6 :: 		while(1){
L_main0:
;aula02.c,7 :: 		PORTB++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula02.c,8 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;aula02.c,9 :: 		}
	GOTO       L_main0
;aula02.c,10 :: 		}
	GOTO       $+0
; end of _main
