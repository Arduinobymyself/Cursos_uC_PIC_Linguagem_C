
_main:

;programa_3.c,12 :: 		void main() {
;programa_3.c,13 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_3.c,14 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_3.c,15 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_3.c,16 :: 		TRISC = 0;
	CLRF       TRISC+0
;programa_3.c,17 :: 		PORTC = 0;
	CLRF       PORTC+0
;programa_3.c,19 :: 		while(1){
L_main0:
;programa_3.c,22 :: 		for(cont = 0; cont < 100; cont++){
	CLRF       _cont+0
L_main2:
	MOVLW      100
	SUBWF      _cont+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;programa_3.c,23 :: 		dezena = num/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _num+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _dezena+0
;programa_3.c,24 :: 		PORTD = texto[dezena];
	MOVF       R0+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_3.c,25 :: 		PORTC.RC4 = 1; // habilita display 1
	BSF        PORTC+0, 4
;programa_3.c,26 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;programa_3.c,27 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;programa_3.c,28 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_3.c,30 :: 		unidade = num%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _num+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _unidade+0
;programa_3.c,31 :: 		PORTD = texto[unidade];
	MOVF       R0+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_3.c,32 :: 		PORTC.RC5 = 1; // habilita display 2
	BSF        PORTC+0, 5
;programa_3.c,33 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;programa_3.c,34 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;programa_3.c,35 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_3.c,22 :: 		for(cont = 0; cont < 100; cont++){
	INCF       _cont+0, 1
;programa_3.c,37 :: 		}
	GOTO       L_main2
L_main3:
;programa_3.c,39 :: 		num++;
	INCF       _num+0, 1
;programa_3.c,41 :: 		}
	GOTO       L_main0
;programa_3.c,43 :: 		}
	GOTO       $+0
; end of _main
