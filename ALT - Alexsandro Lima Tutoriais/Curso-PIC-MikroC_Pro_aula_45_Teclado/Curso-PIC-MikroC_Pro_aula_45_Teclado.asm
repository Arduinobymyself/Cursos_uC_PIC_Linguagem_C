
_main:

;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,22 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,23 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,26 :: 		ADCON1 = 0xFF;
	MOVLW       255
	MOVWF       ADCON1+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,27 :: 		TRISB = 0xF0;
	MOVLW       240
	MOVWF       TRISB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,28 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,29 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,30 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,32 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,34 :: 		PORTB = 0b00000001;
	MOVLW       1
	MOVWF       PORTB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,35 :: 		if(PORTB.RB4 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_main2
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,37 :: 		Lcd_Out_CP(" Tecla 1");
	MOVLW       ?lstr1_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,38 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,39 :: 		}
L_main2:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,40 :: 		if(PORTB.RB5 == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_main4
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,42 :: 		Lcd_Out_CP(" Tecla 4");
	MOVLW       ?lstr2_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,43 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,44 :: 		}
L_main4:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,45 :: 		if(PORTB.RB6 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_main6
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,47 :: 		Lcd_Out_CP(" Tecla 7");
	MOVLW       ?lstr3_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,48 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,49 :: 		}
L_main6:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,50 :: 		if(PORTB.RB7 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_main8
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,51 :: 		PORTA.RA0 = 1;
	BSF         PORTA+0, 0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,53 :: 		Lcd_Out_CP(" Tecla *");
	MOVLW       ?lstr4_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,54 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,55 :: 		}
L_main8:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,58 :: 		PORTB = 0b00000010;
	MOVLW       2
	MOVWF       PORTB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,59 :: 		if(PORTB.RB4 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_main10
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,61 :: 		Lcd_Out_CP(" Tecla 2");
	MOVLW       ?lstr5_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,62 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,63 :: 		}
L_main10:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,64 :: 		if(PORTB.RB5 == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_main12
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,66 :: 		Lcd_Out_CP(" Tecla 5");
	MOVLW       ?lstr6_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,67 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,68 :: 		}
L_main12:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,69 :: 		if(PORTB.RB6 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_main14
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,71 :: 		Lcd_Out_CP(" Tecla 8");
	MOVLW       ?lstr7_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,72 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,73 :: 		}
L_main14:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,74 :: 		if(PORTB.RB7 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_main16
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,76 :: 		Lcd_Out_CP(" Tecla 0");
	MOVLW       ?lstr8_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,77 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,78 :: 		}
L_main16:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,81 :: 		PORTB = 0b00000100;
	MOVLW       4
	MOVWF       PORTB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,82 :: 		if(PORTB.RB4 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_main18
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,84 :: 		Lcd_Out_CP(" Tecla 3");
	MOVLW       ?lstr9_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,85 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,86 :: 		}
L_main18:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,87 :: 		if(PORTB.RB5 == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_main20
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,88 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,89 :: 		Lcd_Out_CP(" Tecla 6");
	MOVLW       ?lstr10_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr10_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,90 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,91 :: 		}
L_main20:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,92 :: 		if(PORTB.RB6 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_main22
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,94 :: 		Lcd_Out_CP(" Tecla 9");
	MOVLW       ?lstr11_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr11_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,95 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,96 :: 		}
L_main22:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,97 :: 		if(PORTB.RB7 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_main24
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,98 :: 		PORTA.RA0 = 0;
	BCF         PORTA+0, 0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,99 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,100 :: 		Lcd_Out_CP(" Tecla #");
	MOVLW       ?lstr12_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr12_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,101 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,102 :: 		}
L_main24:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,104 :: 		PORTB = 0b00001000;
	MOVLW       8
	MOVWF       PORTB+0 
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,105 :: 		if(PORTB.RB4 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_main26
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,106 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,107 :: 		Lcd_Out_CP(" Tecla A");
	MOVLW       ?lstr13_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr13_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,108 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,109 :: 		}
L_main26:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,110 :: 		if(PORTB.RB5 == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_main28
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,111 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,112 :: 		Lcd_Out_CP(" Tecla B");
	MOVLW       ?lstr14_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr14_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,113 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,114 :: 		}
L_main28:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,115 :: 		if(PORTB.RB6 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_main30
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,117 :: 		Lcd_Out_CP(" Tecla C");
	MOVLW       ?lstr15_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr15_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,118 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,119 :: 		}
L_main30:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,120 :: 		if(PORTB.RB7 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_main32
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,121 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,122 :: 		Lcd_Out_CP(" Tecla D");
	MOVLW       ?lstr16_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr16_Curso_45PIC_45MikroC_Pro_aula_45_Teclado+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,123 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,124 :: 		}
L_main32:
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,127 :: 		}
	GOTO        L_main0
;Curso-PIC-MikroC_Pro_aula_45_Teclado.c,129 :: 		}
	GOTO        $+0
; end of _main
