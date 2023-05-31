
_main:

;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,10 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,11 :: 		TRISA = 0b00011111;// RA0 -RA4 entradas
	MOVLW      31
	MOVWF      TRISA+0
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,12 :: 		TRISB = 0b00000000;// RB0 - RB7 saídas
	CLRF       TRISB+0
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,13 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,14 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,18 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,22 :: 		if(!PORTA.RA0 && estado==0){// se RA0 pressionado e estado = 0
	BTFSC      PORTA+0, 0
	GOTO       L_main4
	BTFSC      _estado+0, BitPos(_estado+0)
	GOTO       L_main4
L__main11:
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,23 :: 		delay_ms(50);// espera tempo para debouncing
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
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,24 :: 		PORTB.RB7 = ~PORTB.RB7;// inverte estado do LED
	MOVLW      128
	XORWF      PORTB+0, 1
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,25 :: 		estado = 1;// faz estado = 1
	BSF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,26 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,27 :: 		if(PORTA.RA0 && estado==1){// se RA0 não pressionado e estado = 1
	BTFSS      PORTA+0, 0
	GOTO       L_main8
	BTFSS      _estado+0, BitPos(_estado+0)
	GOTO       L_main8
L__main10:
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,28 :: 		delay_ms(50);// espera tempo para debouncing
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
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,29 :: 		estado = 0;//faz estado = 0
	BCF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,30 :: 		}
L_main8:
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,31 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c,32 :: 		}
	GOTO       $+0
; end of _main
