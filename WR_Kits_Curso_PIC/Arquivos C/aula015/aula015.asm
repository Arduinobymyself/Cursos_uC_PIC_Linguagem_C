
_main:
;aula015.c,34 :: 		void main() {
;aula015.c,35 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula015.c,36 :: 		TRISA = 0X03; // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula015.c,37 :: 		PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
	MOVLW      3
	MOVWF      PORTA+0
;aula015.c,39 :: 		while(1){
L_main0:
;aula015.c,40 :: 		L1 = 1;
	BSF        RA3_bit+0, 3
;aula015.c,41 :: 		L2 = 0;
	BCF        RA2_bit+0, 2
;aula015.c,42 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;aula015.c,43 :: 		L1 = 0;
	BCF        RA3_bit+0, 3
;aula015.c,44 :: 		L2 = 1;
	BSF        RA2_bit+0, 2
;aula015.c,45 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula015.c,46 :: 		}
	GOTO       L_main0
;aula015.c,48 :: 		}
	GOTO       $+0
; end of _main
