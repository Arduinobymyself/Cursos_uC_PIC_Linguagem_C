
_main:

;programa_1_1.c,10 :: 		void main() {
;programa_1_1.c,11 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_1_1.c,12 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_1_1.c,13 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_1_1.c,14 :: 		TRISC = 0;
	CLRF       TRISC+0
;programa_1_1.c,15 :: 		PORTC = 0;
	CLRF       PORTC+0
;programa_1_1.c,17 :: 		while(1){
L_main0:
;programa_1_1.c,18 :: 		PORTD = 79;
	MOVLW      79
	MOVWF      PORTD+0
;programa_1_1.c,19 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;programa_1_1.c,20 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;programa_1_1.c,21 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;programa_1_1.c,23 :: 		PORTD =  109;
	MOVLW      109
	MOVWF      PORTD+0
;programa_1_1.c,24 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;programa_1_1.c,25 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;programa_1_1.c,26 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;programa_1_1.c,27 :: 		}
	GOTO       L_main0
;programa_1_1.c,29 :: 		}
	GOTO       $+0
; end of _main
