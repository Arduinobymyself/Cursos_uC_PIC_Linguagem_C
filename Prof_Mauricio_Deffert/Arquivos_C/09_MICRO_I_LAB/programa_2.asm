
_main:

;programa_2.c,12 :: 		void main() {
;programa_2.c,13 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_2.c,14 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_2.c,15 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,16 :: 		TRISC.RC4 = 0;
	BCF        TRISC+0, 4
;programa_2.c,17 :: 		PORTC.RC4 = 1; // liga display 1
	BSF        PORTC+0, 4
;programa_2.c,19 :: 		while(1){
L_main0:
;programa_2.c,20 :: 		if(indice == 10) indice = 0;
	MOVF       _indice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	CLRF       _indice+0
L_main2:
;programa_2.c,21 :: 		PORTD = texto[indice];
	MOVF       _indice+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_2.c,22 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;programa_2.c,23 :: 		indice++;
	INCF       _indice+0, 1
;programa_2.c,24 :: 		}
	GOTO       L_main0
;programa_2.c,26 :: 		}
	GOTO       $+0
; end of _main
