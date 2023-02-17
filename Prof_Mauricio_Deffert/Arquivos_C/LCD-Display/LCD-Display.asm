
_main:

;LCD-Display.c,26 :: 		void main() {
;LCD-Display.c,27 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;LCD-Display.c,28 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;LCD-Display.c,29 :: 		TRISD = 0;
	CLRF       TRISD+0
;LCD-Display.c,30 :: 		PORTD = 0;
	CLRF       PORTD+0
;LCD-Display.c,31 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;LCD-Display.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Display.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Display.c,34 :: 		Lcd_Out(1, 1, txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Display.c,35 :: 		Lcd_Out(2, 1, txt2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Display.c,36 :: 		}
	GOTO       $+0
; end of _main
