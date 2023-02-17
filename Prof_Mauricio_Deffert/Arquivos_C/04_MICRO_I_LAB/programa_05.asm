
_main:

;programa_05.c,8 :: 		void main() {
;programa_05.c,9 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_05.c,10 :: 		TRISB = 0b11111111;     // configura port B como entrada digital
	MOVLW      255
	MOVWF      TRISB+0
;programa_05.c,11 :: 		TRISC = 0b00000000;     // configura port C como saída digital
	CLRF       TRISC+0
;programa_05.c,12 :: 		PORTB = 0b11111111;     // port B com pull-up
	MOVLW      255
	MOVWF      PORTB+0
;programa_05.c,13 :: 		PORTC = 0b00000000;     // port C inicia em nível baixo
	CLRF       PORTC+0
;programa_05.c,16 :: 		while(1){
L_main0:
;programa_05.c,17 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_05.c,18 :: 		PORTC.RC3 = 1;
	BSF        PORTC+0, 3
;programa_05.c,19 :: 		}
L_main2:
;programa_05.c,20 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;programa_05.c,21 :: 		PORTC.RC3 = 0;
	BCF        PORTC+0, 3
;programa_05.c,22 :: 		}
L_main3:
;programa_05.c,23 :: 		}
	GOTO       L_main0
;programa_05.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
