
_main:

;VSaula021.c,54 :: 		void main() {
;VSaula021.c,55 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula021.c,56 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula021.c,57 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula021.c,58 :: 		TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1
	MOVLW      3
	MOVWF      TRISB+0
;VSaula021.c,60 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula021.c,61 :: 		Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula021.c,62 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula021.c,63 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula021.c,65 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,66 :: 		Lcd_Out(2, 1, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,69 :: 		while(1){
L_main0:
;VSaula021.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula021.c,84 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,85 :: 		for(i = 1; i < 16; i++){ // rola para direita e sai pela direita
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      16
	SUBWF      _i+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;VSaula021.c,86 :: 		Lcd_Out(2, i, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,87 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;VSaula021.c,88 :: 		Lcd_Out(2, 1, "                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula021+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,85 :: 		for(i = 1; i < 16; i++){ // rola para direita e sai pela direita
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;VSaula021.c,89 :: 		}
	GOTO       L_main2
L_main3:
;VSaula021.c,90 :: 		for(i = -16; i < 16; i++){ // entra pela esquerda, rola e sai pela direita
	MOVLW      240
	MOVWF      _i+0
	MOVLW      255
	MOVWF      _i+1
L_main6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      16
	SUBWF      _i+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;VSaula021.c,91 :: 		Lcd_Out(2, i, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,92 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;VSaula021.c,93 :: 		Lcd_Out(2, 1, "                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula021+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,90 :: 		for(i = -16; i < 16; i++){ // entra pela esquerda, rola e sai pela direita
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;VSaula021.c,94 :: 		}
	GOTO       L_main6
L_main7:
;VSaula021.c,95 :: 		for(i = 16; i >= 1; i--){ // entra pela direita e rola para esquerda
	MOVLW      16
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main10:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      1
	SUBWF      _i+0, 0
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;VSaula021.c,96 :: 		Lcd_Out(2, i, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,97 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
;VSaula021.c,98 :: 		Lcd_Out(2, 1, "                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_VSaula021+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula021.c,95 :: 		for(i = 16; i >= 1; i--){ // entra pela direita e rola para esquerda
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;VSaula021.c,99 :: 		}
	GOTO       L_main10
L_main11:
;VSaula021.c,100 :: 		}
	GOTO       L_main0
;VSaula021.c,102 :: 		}
	GOTO       $+0
; end of _main
