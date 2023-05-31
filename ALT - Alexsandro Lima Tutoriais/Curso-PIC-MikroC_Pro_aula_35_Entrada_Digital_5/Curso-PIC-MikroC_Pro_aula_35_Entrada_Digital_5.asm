
_main:

;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,10 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,11 :: 		TRISA = 0b00011111;// RA0 -RA4 entradas
	MOVLW      31
	MOVWF      TRISA+0
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,12 :: 		TRISB = 0b00000000;// RB0 - RB7 saídas
	CLRF       TRISB+0
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,13 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,14 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,18 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,22 :: 		if(Button(&PORTA, 0, 50, 0) && (estado == 0)){// se RA0 pressionado e estado = 0
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _estado+0, BitPos(_estado+0)
	GOTO       L_main4
L__main9:
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,23 :: 		PORTB.RB7 = ~PORTB.RB7;// inverte estado do LED
	MOVLW      128
	XORWF      PORTB+0, 1
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,24 :: 		estado = 1;// faz estado = 1
	BSF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,25 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,26 :: 		if(!Button(&PORTA, 0, 50, 0) && (estado == 1)){// se RA0 não pressionado e estado = 1; soltou botão...
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _estado+0, BitPos(_estado+0)
	GOTO       L_main7
L__main8:
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,27 :: 		estado = 0;//faz estado = 0
	BCF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,28 :: 		}
L_main7:
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,29 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c,30 :: 		}
	GOTO       $+0
; end of _main
