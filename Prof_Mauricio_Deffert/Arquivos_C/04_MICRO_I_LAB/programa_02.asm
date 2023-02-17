
_main:

;programa_02.c,9 :: 		void main() {
;programa_02.c,10 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_02.c,11 :: 		TRISB = 0b11111111;     // configura port B como entrada digital
	MOVLW      255
	MOVWF      TRISB+0
;programa_02.c,12 :: 		TRISC = 0b00000000;     // configura port C como saída digital
	CLRF       TRISC+0
;programa_02.c,13 :: 		PORTB = 0b11111111;     // port B com pull-up
	MOVLW      255
	MOVWF      PORTB+0
;programa_02.c,14 :: 		PORTC = 0b00000000;     // port C inicia em nível baixo
	CLRF       PORTC+0
;programa_02.c,16 :: 		while(1){
L_main0:
;programa_02.c,17 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_02.c,18 :: 		PORTC.RC6 = 1;
	BSF        PORTC+0, 6
;programa_02.c,19 :: 		}
L_main2:
;programa_02.c,20 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;programa_02.c,21 :: 		PORTC.RC6 = 0;
	BCF        PORTC+0, 6
;programa_02.c,22 :: 		}
L_main3:
;programa_02.c,23 :: 		if(PORTB.RB2 == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main4
;programa_02.c,24 :: 		PORTC.RC7 = 1;
	BSF        PORTC+0, 7
;programa_02.c,25 :: 		}
L_main4:
;programa_02.c,26 :: 		if(PORTB.RB3 == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_main5
;programa_02.c,27 :: 		PORTC.RC7 = 0;
	BCF        PORTC+0, 7
;programa_02.c,28 :: 		}
L_main5:
;programa_02.c,31 :: 		}
	GOTO       L_main0
;programa_02.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
