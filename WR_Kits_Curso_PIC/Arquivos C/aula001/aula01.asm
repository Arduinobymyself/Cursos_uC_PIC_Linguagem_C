
_main:

;aula01.c,7 :: 		void main() {
;aula01.c,8 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula01.c,9 :: 		TRISB = 0b00000000;        // port B como saída digital
	CLRF       TRISB+0
;aula01.c,10 :: 		PORTB = 0b00000000;        // port B inicia em nível Low
	CLRF       PORTB+0
;aula01.c,12 :: 		while(1){
L_main0:
;aula01.c,13 :: 		RB1_bit = 0;      // liga LED no pino RB1
	BCF        RB1_bit+0, 1
;aula01.c,14 :: 		delay_ms(500);    // aguada 500 milisegundos
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
;aula01.c,15 :: 		RB1_bit = 1;      // desliga LED no pino RB1
	BSF        RB1_bit+0, 1
;aula01.c,16 :: 		delay_ms(500);    // aguanda 500 milisegundos
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
;aula01.c,18 :: 		}
	GOTO       L_main0
;aula01.c,21 :: 		}
	GOTO       $+0
; end of _main
