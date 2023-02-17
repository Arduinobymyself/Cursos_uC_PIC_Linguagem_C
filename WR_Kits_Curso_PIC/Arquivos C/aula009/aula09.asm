
_main:

;aula09.c,14 :: 		void main() {
;aula09.c,15 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;aula09.c,16 :: 		TRISA = 3; // S1 e S2 entradas
	MOVLW      3
	MOVWF      TRISA+0
;aula09.c,17 :: 		PORTA = 0;
	CLRF       PORTA+0
;aula09.c,19 :: 		while(1){
L_main0:
;aula09.c,20 :: 		numbers = rand(); // numbers receberá um número aleatório entre 0  e 32767
	CALL       _rand+0
	MOVF       R0+0, 0
	MOVWF      _numbers+0
	MOVF       R0+1, 0
	MOVWF      _numbers+1
;aula09.c,21 :: 		L1 = numbers;
	BTFSC      R0+0, 0
	GOTO       L__main11
	BCF        RA3_bit+0, 3
	GOTO       L__main12
L__main11:
	BSF        RA3_bit+0, 3
L__main12:
;aula09.c,22 :: 		L2 = ~L1; // se L1 aceso, L2 estará apagado
	BTFSC      RA3_bit+0, 3
	GOTO       L__main13
	BSF        RA2_bit+0, 2
	GOTO       L__main14
L__main13:
	BCF        RA2_bit+0, 2
L__main14:
;aula09.c,24 :: 		while(L1){ // enquanto L1 aceso
L_main2:
	BTFSS      RA3_bit+0, 3
	GOTO       L_main3
;aula09.c,25 :: 		if(S1 == 0) L1 = 0; // se pressionou S1, apaga L1
	BTFSC      RA1_bit+0, 1
	GOTO       L_main4
	BCF        RA3_bit+0, 3
L_main4:
;aula09.c,26 :: 		delay_ms(70); // debouncing
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;aula09.c,27 :: 		}
	GOTO       L_main2
L_main3:
;aula09.c,28 :: 		while(L2){ // enquanto L2 aceso
L_main6:
	BTFSS      RA2_bit+0, 2
	GOTO       L_main7
;aula09.c,29 :: 		if(S2 == 0) L2 = 0; // se pressionado S2, apaga L2
	BTFSC      RA0_bit+0, 0
	GOTO       L_main8
	BCF        RA2_bit+0, 2
L_main8:
;aula09.c,30 :: 		delay_ms(70); // debouncing
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;aula09.c,31 :: 		}
	GOTO       L_main6
L_main7:
;aula09.c,32 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;aula09.c,33 :: 		}
	GOTO       L_main0
;aula09.c,35 :: 		}
	GOTO       $+0
; end of _main
