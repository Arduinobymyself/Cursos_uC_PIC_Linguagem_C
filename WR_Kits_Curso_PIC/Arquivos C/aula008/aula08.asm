
_main:

;aula08.c,8 :: 		void main() {
;aula08.c,10 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;aula08.c,11 :: 		TRISA = 0x03; // 0b00000011 port A pinos 0 e 1 como entrada  e pinos 2 e 3 como saída
	MOVLW      3
	MOVWF      TRISA+0
;aula08.c,12 :: 		PORTA = 0x00; // 0b00000000
	CLRF       PORTA+0
;aula08.c,14 :: 		while(1){
L_main0:
;aula08.c,15 :: 		if(S1 == 0){
	BTFSC      RA1_bit+0, 1
	GOTO       L_main2
;aula08.c,16 :: 		while(1){
L_main3:
;aula08.c,17 :: 		L1 = 1;
	BSF        RA3_bit+0, 3
;aula08.c,18 :: 		L2 = 0;
	BCF        RA2_bit+0, 2
;aula08.c,19 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;aula08.c,20 :: 		L1 = 0;
	BCF        RA3_bit+0, 3
;aula08.c,21 :: 		L2 = 1;
	BSF        RA2_bit+0, 2
;aula08.c,22 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;aula08.c,23 :: 		}
	GOTO       L_main3
;aula08.c,24 :: 		}
L_main2:
;aula08.c,25 :: 		if(S2 == 0){
	BTFSC      RA0_bit+0, 0
	GOTO       L_main7
;aula08.c,26 :: 		while(1){
L_main8:
;aula08.c,27 :: 		L1 = 1;
	BSF        RA3_bit+0, 3
;aula08.c,28 :: 		L2 = 1;
	BSF        RA2_bit+0, 2
;aula08.c,29 :: 		delay_ms(500);
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
;aula08.c,30 :: 		L1 = 0;
	BCF        RA3_bit+0, 3
;aula08.c,31 :: 		L2 = 0;
	BCF        RA2_bit+0, 2
;aula08.c,32 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;aula08.c,33 :: 		}
	GOTO       L_main8
;aula08.c,34 :: 		}
L_main7:
;aula08.c,35 :: 		}
	GOTO       L_main0
;aula08.c,38 :: 		}
	GOTO       $+0
; end of _main
