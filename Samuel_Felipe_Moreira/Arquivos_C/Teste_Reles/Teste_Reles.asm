
_main:

;Teste_Reles.c,1 :: 		void main() {
;Teste_Reles.c,2 :: 		ADCON1 = 6;
	MOVLW      6
	MOVWF      ADCON1+0
;Teste_Reles.c,3 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Teste_Reles.c,4 :: 		TRISC.RC0 = 0;
	BCF        TRISC+0, 0
;Teste_Reles.c,5 :: 		TRISE.RE0 = 0;
	BCF        TRISE+0, 0
;Teste_Reles.c,6 :: 		PORTC.RC0 = 0;
	BCF        PORTC+0, 0
;Teste_Reles.c,7 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;Teste_Reles.c,9 :: 		do{
L_main0:
;Teste_Reles.c,11 :: 		PORTC.RC0 = 0;
	BCF        PORTC+0, 0
;Teste_Reles.c,12 :: 		PORTE.RE0 = 1;
	BSF        PORTE+0, 0
;Teste_Reles.c,13 :: 		delay_ms(1000);
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
;Teste_Reles.c,14 :: 		PORTC.RC0 = 1;
	BSF        PORTC+0, 0
;Teste_Reles.c,15 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;Teste_Reles.c,16 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Teste_Reles.c,18 :: 		}while(1);
	GOTO       L_main0
;Teste_Reles.c,19 :: 		}
	GOTO       $+0
; end of _main
