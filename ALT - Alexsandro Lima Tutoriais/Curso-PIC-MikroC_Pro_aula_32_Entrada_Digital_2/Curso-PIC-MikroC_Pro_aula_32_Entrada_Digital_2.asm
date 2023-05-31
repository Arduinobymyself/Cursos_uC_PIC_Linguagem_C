
_main:

;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,6 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,7 :: 		TRISA = 0b00011111;// RA0 - RA4 entradas
	MOVLW      31
	MOVWF      TRISA+0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,8 :: 		TRISB = 0b00000000;// RB0 - RB7 saídas
	CLRF       TRISB+0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,9 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,10 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,12 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,16 :: 		if(!PORTA.RA0 && PORTA.RA1){// se RA0 pressionado e RA1 não pressionado
	BTFSC      PORTA+0, 0
	GOTO       L_main4
	BTFSS      PORTA+0, 1
	GOTO       L_main4
L__main11:
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,17 :: 		delay_ms(50);// espera tempo para debouncing
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
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,18 :: 		PORTB.RB0 = 1;// Acende o LED
	BSF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,19 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,20 :: 		if(PORTA.RA0 && !PORTA.RA1){// se RA0 não pressionado e RA1 pressionado
	BTFSS      PORTA+0, 0
	GOTO       L_main8
	BTFSC      PORTA+0, 1
	GOTO       L_main8
L__main10:
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,21 :: 		delay_ms(50);// espera tempo para debouncing
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
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,22 :: 		PORTB.RB0 = 0;// apaga o LED
	BCF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,23 :: 		}
L_main8:
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,24 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c,25 :: 		}
	GOTO       $+0
; end of _main
