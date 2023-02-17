
_main:

;programa_01.c,10 :: 		void main() {
;programa_01.c,12 :: 		ADCON1 = 7;           // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_01.c,14 :: 		TRISD = 0;            // configura port D como saída
	CLRF       TRISD+0
;programa_01.c,15 :: 		PORTD = 0;            // port D inicia em nível LOW (todos os LEDs desligados)
	CLRF       PORTD+0
;programa_01.c,17 :: 		while(1){
L_main0:
;programa_01.c,18 :: 		PORTD.RD1 = 1;      // liga LED 1
	BSF        PORTD+0, 1
;programa_01.c,19 :: 		delay_ms(1000);     // aguarda 1s
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;programa_01.c,20 :: 		PORTD.RD1 = 0;      // desliga LED 1
	BCF        PORTD+0, 1
;programa_01.c,21 :: 		delay_ms(1000);     // aguarda 1s
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
;programa_01.c,22 :: 		}
	GOTO       L_main0
;programa_01.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
