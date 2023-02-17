
_main:

;aula042.c,46 :: 		void main() {
;aula042.c,47 :: 		CMCON = 0b00000111;   // desabilita comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula042.c,49 :: 		T1CON = 0b00000011;   // T1CKPS1:T1CKPS0<5:4> 0:0 -> prescaler 1:1,
	MOVLW      3
	MOVWF      T1CON+0
;aula042.c,53 :: 		TMR1H = 0;            // carga inicial do registrador Timer 1
	CLRF       TMR1H+0
;aula042.c,54 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;aula042.c,57 :: 		TRISB= 0;
	CLRF       TRISB+0
;aula042.c,58 :: 		PORTB = 0;
	CLRF       PORTB+0
;aula042.c,59 :: 		TRISC = 0b00000001;
	MOVLW      1
	MOVWF      TRISC+0
;aula042.c,60 :: 		PORTC = 0;
	CLRF       PORTC+0
;aula042.c,62 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula042.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula042.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula042.c,68 :: 		while(1){
L_main0:
;aula042.c,70 :: 		pulse = (TMR1H << 8) + TMR1L;
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _pulse+0
	MOVF       R0+1, 0
	MOVWF      _pulse+1
;aula042.c,71 :: 		IntToStr(pulse, texto);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;aula042.c,72 :: 		Lcd_Out(1, 1, "    CONTADOR    ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_aula042+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula042.c,73 :: 		Lcd_Out(2, 1, "Pulsos: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_aula042+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula042.c,74 :: 		Lcd_Out(2, 9, texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula042.c,75 :: 		if(pulse%10 == 0){
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _pulse+0, 0
	MOVWF      R0+0
	MOVF       _pulse+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main4
	MOVLW      0
	XORWF      R0+0, 0
L__main4:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;aula042.c,76 :: 		RC4_bit = ~RC4_bit;
	MOVLW      16
	XORWF      RC4_bit+0, 1
;aula042.c,77 :: 		delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;aula042.c,78 :: 		}
L_main2:
;aula042.c,81 :: 		}
	GOTO       L_main0
;aula042.c,84 :: 		}
	GOTO       $+0
; end of _main
