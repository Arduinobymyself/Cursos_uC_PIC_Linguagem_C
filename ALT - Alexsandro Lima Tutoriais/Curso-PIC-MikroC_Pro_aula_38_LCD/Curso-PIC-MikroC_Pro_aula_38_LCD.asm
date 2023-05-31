
_main:

;Curso-PIC-MikroC_Pro_aula_38_LCD.c,26 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,33 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,34 :: 		Lcd_Chr(1,6,'A');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      65
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,35 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,36 :: 		Lcd_Chr(1,7,'B');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      66
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,37 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,38 :: 		Lcd_Chr(1,8,'M');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      77
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,39 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,40 :: 		Lcd_Chr(1,9,'S');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      83
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,41 :: 		delay_ms(500);
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
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,42 :: 		Lcd_Out(2,1,"ArduinoByMySelf");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Curso_45PIC_45MikroC_Pro_aula_38_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,43 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,45 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_38_LCD.c,47 :: 		}
	GOTO       $+0
; end of _main
