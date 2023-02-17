
_main:

;VSaula023.c,58 :: 		void main() {
;VSaula023.c,59 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula023.c,60 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula023.c,61 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula023.c,62 :: 		TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1
	MOVLW      3
	MOVWF      TRISB+0
;VSaula023.c,64 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula023.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula023.c,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula023.c,67 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula023.c,69 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula023.c,70 :: 		Lcd_Out(2, 1, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula023.c,71 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;VSaula023.c,74 :: 		while(1){
L_main1:
;VSaula023.c,90 :: 		i = -16;
	MOVLW      240
	MOVWF      _i+0
	MOVLW      255
	MOVWF      _i+1
;VSaula023.c,91 :: 		Lcd_Out(2, 1, "                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula023+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula023.c,92 :: 		do{
L_main3:
;VSaula023.c,93 :: 		Lcd_Out(2, i, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula023.c,94 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;VSaula023.c,95 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;VSaula023.c,96 :: 		}while(i <= 16);
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       _i+0, 0
	SUBLW      16
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;VSaula023.c,99 :: 		}
	GOTO       L_main1
;VSaula023.c,101 :: 		}
	GOTO       $+0
; end of _main
