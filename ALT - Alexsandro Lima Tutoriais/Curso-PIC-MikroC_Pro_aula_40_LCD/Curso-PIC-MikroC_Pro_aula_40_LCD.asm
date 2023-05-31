
_main:

;Curso-PIC-MikroC_Pro_aula_40_LCD.c,24 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,25 :: 		TRISB.RB7 = 0;
	BCF        TRISB+0, 7
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,26 :: 		TRISA.RB0 = 1;
	BSF        TRISA+0, 0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,27 :: 		PORTB.RB7 = 0;
	BCF        PORTB+0, 7
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,28 :: 		PORTA.RA0 = 0;
	BCF        PORTA+0, 0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,30 :: 		Lcd_Init();// inicializa o LCD
	CALL       _Lcd_Init+0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,31 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);// não mostrar o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,33 :: 		Lcd_Out(1,1,"ArduinoByMySelf     "); // apresenta mensagem Inicial
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Curso_45PIC_45MikroC_Pro_aula_40_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,36 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,37 :: 		if(Button(&PORTA, 0, 50, 0) && (estado == 0)){// se RA0 pressionado e estado = 0
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
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,38 :: 		Lcd_Out(2,1,"BOTAO PRESSIONADO   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Curso_45PIC_45MikroC_Pro_aula_40_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,39 :: 		PORTB.RB7 = ~PORTB.RB7;// inverte estado do LED
	MOVLW      128
	XORWF      PORTB+0, 1
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,40 :: 		estado = 1;// faz estado = 1
	BSF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,41 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,42 :: 		if(!Button(&PORTA, 0, 50, 0) && (estado == 1)){// se RA0 não pressionado e estado = 1; soltou botão...
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
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,43 :: 		Lcd_Out(2,1,"BOTAO LIBERADO      ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Curso_45PIC_45MikroC_Pro_aula_40_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,44 :: 		estado = 0;//faz estado = 0
	BCF        _estado+0, BitPos(_estado+0)
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,45 :: 		}
L_main7:
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,46 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_40_LCD.c,47 :: 		}
	GOTO       $+0
; end of _main
