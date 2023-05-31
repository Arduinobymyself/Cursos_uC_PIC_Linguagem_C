
_CustomChar:

;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,26 :: 		void CustomChar(char pos_row, char pos_char) {
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,28 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,29 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(smile[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _smile+0
	MOVWF      R0+0
	MOVLW      hi_addr(_smile+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,30 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,31 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,32 :: 		}
	RETURN
; end of _CustomChar

_main:

;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,34 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,35 :: 		Lcd_Init();// inicializa o LCD
	CALL       _Lcd_Init+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);// não mostrar o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,37 :: 		Lcd_Out(1,1,"     ABMS"); // apresenta mensagem Inicial
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Curso_45PIC_45MikroC_Pro_aula_42_LCD_Message_Shift+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,38 :: 		CustomChar(1,11);
	MOVLW      1
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      11
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,39 :: 		Lcd_Out(2,1,"ArduinoByMySelf");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Curso_45PIC_45MikroC_Pro_aula_42_LCD_Message_Shift+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,43 :: 		while(1){
L_main3:
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,44 :: 		for(contador = 0; contador < 16; contador++){
	CLRF       _contador+0
L_main5:
	MOVLW      16
	SUBWF      _contador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,45 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,46 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,44 :: 		for(contador = 0; contador < 16; contador++){
	INCF       _contador+0, 1
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,47 :: 		}
	GOTO       L_main5
L_main6:
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,48 :: 		for(contador = 0; contador < 32; contador++){
	CLRF       _contador+0
L_main9:
	MOVLW      32
	SUBWF      _contador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,49 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,50 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,48 :: 		for(contador = 0; contador < 32; contador++){
	INCF       _contador+0, 1
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,51 :: 		}
	GOTO       L_main9
L_main10:
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,52 :: 		for(contador = 0; contador < 16; contador++){
	CLRF       _contador+0
L_main13:
	MOVLW      16
	SUBWF      _contador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,53 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,54 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,52 :: 		for(contador = 0; contador < 16; contador++){
	INCF       _contador+0, 1
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,55 :: 		}
	GOTO       L_main13
L_main14:
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,56 :: 		}
	GOTO       L_main3
;Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c,57 :: 		}
	GOTO       $+0
; end of _main
