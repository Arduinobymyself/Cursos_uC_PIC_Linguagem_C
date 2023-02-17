
_main:

;programa_01.c,8 :: 		void main() {
;programa_01.c,9 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_01.c,10 :: 		TRISB = 0b11111111;     // configura port B como entrada digital
	MOVLW      255
	MOVWF      TRISB+0
;programa_01.c,11 :: 		TRISD = 0b00000000;     // configura port D como saída digital
	CLRF       TRISD+0
;programa_01.c,12 :: 		PORTB = 0b11111111;     // port B com pull-up
	MOVLW      255
	MOVWF      PORTB+0
;programa_01.c,13 :: 		PORTD = 0b00000000;     // port D inicia em nível baixo (todos os LEDs apagados)
	CLRF       PORTD+0
;programa_01.c,15 :: 		while(1){
L_main0:
;programa_01.c,17 :: 		if(PORTB.RB0 == 0){ // se B0 pressionado, liga LED 0 caso ontrário desliga LED D0
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_01.c,18 :: 		PORTD.RD0 = 1;
	BSF        PORTD+0, 0
;programa_01.c,19 :: 		} else {
	GOTO       L_main3
L_main2:
;programa_01.c,20 :: 		PORTD.RD0 = 0;
	BCF        PORTD+0, 0
;programa_01.c,21 :: 		}
L_main3:
;programa_01.c,22 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main4
;programa_01.c,23 :: 		PORTD.RD1 = 1;
	BSF        PORTD+0, 1
;programa_01.c,24 :: 		} else {
	GOTO       L_main5
L_main4:
;programa_01.c,25 :: 		PORTD.RD1 = 0;
	BCF        PORTD+0, 1
;programa_01.c,26 :: 		}
L_main5:
;programa_01.c,27 :: 		if(PORTB.RB2 == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main6
;programa_01.c,28 :: 		PORTD.RD2 = 1;
	BSF        PORTD+0, 2
;programa_01.c,29 :: 		} else {
	GOTO       L_main7
L_main6:
;programa_01.c,30 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;programa_01.c,31 :: 		}
L_main7:
;programa_01.c,32 :: 		if(PORTB.RB3 == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_main8
;programa_01.c,33 :: 		PORTD.RD3 = 1;
	BSF        PORTD+0, 3
;programa_01.c,34 :: 		} else {
	GOTO       L_main9
L_main8:
;programa_01.c,35 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;programa_01.c,36 :: 		}
L_main9:
;programa_01.c,37 :: 		if(PORTB.RB4 == 0){
	BTFSC      PORTB+0, 4
	GOTO       L_main10
;programa_01.c,38 :: 		PORTD.RD4 = 1;
	BSF        PORTD+0, 4
;programa_01.c,39 :: 		} else {
	GOTO       L_main11
L_main10:
;programa_01.c,40 :: 		PORTD.RD4 = 0;
	BCF        PORTD+0, 4
;programa_01.c,41 :: 		}
L_main11:
;programa_01.c,42 :: 		if(PORTB.RB5 == 0){
	BTFSC      PORTB+0, 5
	GOTO       L_main12
;programa_01.c,43 :: 		PORTD.RD5 = 1;
	BSF        PORTD+0, 5
;programa_01.c,44 :: 		} else {
	GOTO       L_main13
L_main12:
;programa_01.c,45 :: 		PORTD.RD5 = 0;
	BCF        PORTD+0, 5
;programa_01.c,46 :: 		}
L_main13:
;programa_01.c,47 :: 		if(PORTB.RB6 == 0){
	BTFSC      PORTB+0, 6
	GOTO       L_main14
;programa_01.c,48 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;programa_01.c,49 :: 		} else {
	GOTO       L_main15
L_main14:
;programa_01.c,50 :: 		PORTD.RD6 = 0;
	BCF        PORTD+0, 6
;programa_01.c,51 :: 		}
L_main15:
;programa_01.c,52 :: 		if(PORTB.RB7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main16
;programa_01.c,53 :: 		PORTD.RD7 = 1;
	BSF        PORTD+0, 7
;programa_01.c,54 :: 		} else {
	GOTO       L_main17
L_main16:
;programa_01.c,55 :: 		PORTD.RD7 = 0;
	BCF        PORTD+0, 7
;programa_01.c,56 :: 		}
L_main17:
;programa_01.c,58 :: 		delay_ms(50); // cancela o bouncing das chaves mecânicas
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;programa_01.c,60 :: 		}
	GOTO       L_main0
;programa_01.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
