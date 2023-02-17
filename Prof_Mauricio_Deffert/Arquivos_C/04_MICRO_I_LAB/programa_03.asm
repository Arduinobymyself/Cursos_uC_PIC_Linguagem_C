
_main:

;programa_03.c,9 :: 		void main() {
;programa_03.c,10 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_03.c,11 :: 		TRISB = 0b11111111;     // configura port B como entrada digital
	MOVLW      255
	MOVWF      TRISB+0
;programa_03.c,12 :: 		TRISC = 0b00000000;     // configura port C como saída digital
	CLRF       TRISC+0
;programa_03.c,13 :: 		TRISD = 0b00000000;     // configura port D como saída digital
	CLRF       TRISD+0
;programa_03.c,14 :: 		PORTB = 0b11111111;     // port B com pull-up
	MOVLW      255
	MOVWF      PORTB+0
;programa_03.c,15 :: 		PORTC = 0b00000000;     // port C inicia em nível baixo
	CLRF       PORTC+0
;programa_03.c,16 :: 		PORTD = 0b00000000;     // port D inicia em nível baixo
	CLRF       PORTD+0
;programa_03.c,18 :: 		while(1){
L_main0:
;programa_03.c,19 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_03.c,20 :: 		PORTD = 0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
;programa_03.c,21 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;programa_03.c,22 :: 		}
L_main2:
;programa_03.c,23 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;programa_03.c,24 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;programa_03.c,25 :: 		}
L_main3:
;programa_03.c,26 :: 		if(PORTB.RB2 == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main4
;programa_03.c,27 :: 		PORTD = 0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
;programa_03.c,28 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;programa_03.c,29 :: 		}
L_main4:
;programa_03.c,30 :: 		if(PORTB.RB3 == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_main5
;programa_03.c,31 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;programa_03.c,32 :: 		}
L_main5:
;programa_03.c,35 :: 		}
	GOTO       L_main0
;programa_03.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
