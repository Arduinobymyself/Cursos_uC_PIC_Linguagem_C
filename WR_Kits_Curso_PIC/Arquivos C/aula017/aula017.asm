
_main:

;aula017.c,8 :: 		void main() {
;aula017.c,9 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula017.c,10 :: 		TRISA = 0b00000001;        // port A pino RA0 como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;aula017.c,11 :: 		PORTA = 0b00000000;        // inicializa o port A em nível baixo
	CLRF       PORTA+0
;aula017.c,12 :: 		TRISB = 0b00000000;        // port B como saída digital
	CLRF       TRISB+0
;aula017.c,13 :: 		PORTB = 0b00000000;        // port B inicia em nível Low
	CLRF       PORTB+0
;aula017.c,15 :: 		while(1){
L_main0:
;aula017.c,16 :: 		if(RA0_bit)
	BTFSS      RA0_bit+0, 0
	GOTO       L_main2
;aula017.c,18 :: 		RB1_bit = 1;      // liga LED no pino RB1
	BSF        RB1_bit+0, 1
;aula017.c,19 :: 		delay_ms(1000);    // aguada 500 milisegundos
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
;aula017.c,20 :: 		RB1_bit = 0;      // desliga LED no pino RB1
	BCF        RB1_bit+0, 1
;aula017.c,21 :: 		}
L_main2:
;aula017.c,23 :: 		}
	GOTO       L_main0
;aula017.c,26 :: 		}
	GOTO       $+0
; end of _main
