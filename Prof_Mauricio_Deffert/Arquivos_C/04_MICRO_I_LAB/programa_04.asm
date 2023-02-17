
_main:

;programa_04.c,7 :: 		void main() {
;programa_04.c,8 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_04.c,9 :: 		TRISD = 0b00000000;     // configura port D como saída digital
	CLRF       TRISD+0
;programa_04.c,10 :: 		PORTD = 0b00000000;     // port D inicia em nível baixo
	CLRF       PORTD+0
;programa_04.c,12 :: 		while(1){
L_main0:
;programa_04.c,13 :: 		PORTD++;
	INCF       PORTD+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;programa_04.c,14 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;programa_04.c,15 :: 		}
	GOTO       L_main0
;programa_04.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
