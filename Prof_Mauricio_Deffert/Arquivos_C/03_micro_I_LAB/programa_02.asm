
_main:

;programa_02.c,8 :: 		void main() {
;programa_02.c,10 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_02.c,11 :: 		TRISD = 0b00000000;     // port D como saída
	CLRF       TRISD+0
;programa_02.c,12 :: 		PORTD = 0b00000000;     // port D inicia em nível LOW LEDs apagados
	CLRF       PORTD+0
;programa_02.c,13 :: 		TRISB = 0b00000001;     // port B pino RB0 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;programa_02.c,14 :: 		PORTB = 0b00000001;     // port B pino RB0 com pull-up
	MOVLW      1
	MOVWF      PORTB+0
;programa_02.c,16 :: 		while(1){
L_main0:
;programa_02.c,18 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_02.c,19 :: 		PORTD.RD0 = 1;  // liga LED 0
	BSF        PORTD+0, 0
;programa_02.c,20 :: 		} else{
	GOTO       L_main3
L_main2:
;programa_02.c,21 :: 		PORTD.RD0 = 0;  // desliga LED 0
	BCF        PORTD+0, 0
;programa_02.c,22 :: 		}
L_main3:
;programa_02.c,24 :: 		}
	GOTO       L_main0
;programa_02.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
