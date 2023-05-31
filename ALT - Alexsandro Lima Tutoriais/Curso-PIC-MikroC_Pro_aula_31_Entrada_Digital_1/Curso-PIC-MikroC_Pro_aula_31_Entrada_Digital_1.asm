
_main:

;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,6 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,7 :: 		TRISA = 0b00011111;
	MOVLW      31
	MOVWF      TRISA+0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,8 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,9 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,10 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,12 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,14 :: 		if(PORTA.RA0 && !PORTA.RA1){
	BTFSS      PORTA+0, 0
	GOTO       L_main4
	BTFSC      PORTA+0, 1
	GOTO       L_main4
L__main11:
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,15 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,16 :: 		PORTB.RB0 = 1;
	BSF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,17 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,18 :: 		if(!PORTA.RA0 && PORTA.RA1){
	BTFSC      PORTA+0, 0
	GOTO       L_main8
	BTFSS      PORTA+0, 1
	GOTO       L_main8
L__main10:
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,19 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,20 :: 		PORTB.RB0 = 0;
	BCF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,21 :: 		}
L_main8:
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,22 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_31_Entrada_Digital_1.c,23 :: 		}
	GOTO       $+0
; end of _main
