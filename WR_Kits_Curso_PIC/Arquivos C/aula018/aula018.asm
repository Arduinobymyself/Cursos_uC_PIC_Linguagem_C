
_main:

;aula018.c,4 :: 		void main() {
;aula018.c,5 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula018.c,6 :: 		TRISB = 0b00000000;        // port B como saída digital
	CLRF       TRISB+0
;aula018.c,7 :: 		PORTB = 0b00000000;        // port B inicia em nível Low
	CLRF       PORTB+0
;aula018.c,9 :: 		while(1){
L_main0:
;aula018.c,10 :: 		RB1_bit = 0;      // liga LED no pino RB1
	BCF        RB1_bit+0, 1
;aula018.c,11 :: 		delay_ms(100);    // aguada 500 milisegundos
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;aula018.c,12 :: 		RB1_bit = 1;      // desliga LED no pino RB1
	BSF        RB1_bit+0, 1
;aula018.c,13 :: 		delay_ms(100);    // aguada 500 milisegundos
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula018.c,14 :: 		}
	GOTO       L_main0
;aula018.c,17 :: 		}
	GOTO       $+0
; end of _main
