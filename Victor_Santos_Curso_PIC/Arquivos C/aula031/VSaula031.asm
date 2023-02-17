
_main:

;VSaula031.c,29 :: 		void main() {
;VSaula031.c,31 :: 		ADCON0 = 0b00000001;
	MOVLW      1
	MOVWF      ADCON0+0
;VSaula031.c,32 :: 		ADCON1 = 0b11000100;
	MOVLW      196
	MOVWF      ADCON1+0
;VSaula031.c,33 :: 		TRISA = 0b000000011;
	MOVLW      3
	MOVWF      TRISA+0
;VSaula031.c,36 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;VSaula031.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula031.c,38 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula031.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula031.c,41 :: 		Lcd_Out(1, 1, "  ABMS Telecom  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,42 :: 		Lcd_Out(2, 1, " Seja Bem Vindo!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,43 :: 		delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;VSaula031.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula031.c,47 :: 		while(1){
L_main1:
;VSaula031.c,48 :: 		Lcd_Out(1, 1, "AN0 =" );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,49 :: 		Lcd_Out(2, 1, "AN1 =" );
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,50 :: 		valorAD0 = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _valorAD0+0
	MOVF       R0+1, 0
	MOVWF      _valorAD0+1
;VSaula031.c,51 :: 		valorAD1 = ADC_Get_Sample(1);
	MOVLW      1
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _valorAD1+0
	MOVF       R0+1, 0
	MOVWF      _valorAD1+1
;VSaula031.c,53 :: 		if(valor0 != valorAD0){
	MOVF       _valor0+1, 0
	XORWF      _valorAD0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVF       _valorAD0+0, 0
	XORWF      _valor0+0, 0
L__main5:
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;VSaula031.c,54 :: 		valor0 = valorAD0;
	MOVF       _valorAD0+0, 0
	MOVWF      _valor0+0
	MOVF       _valorAD0+1, 0
	MOVWF      _valor0+1
;VSaula031.c,55 :: 		WordToStr(valorAD0, texto);
	MOVF       _valorAD0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valorAD0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula031.c,56 :: 		Lcd_Out(1, 6, "    ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,57 :: 		Lcd_Out(1, 6, Ltrim(texto));
	MOVLW      _texto+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;VSaula031.c,58 :: 		valorAD0 = valorAD0*0.09775171;
	MOVF       _valorAD0+0, 0
	MOVWF      R0+0
	MOVF       _valorAD0+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      12
	MOVWF      R4+0
	MOVLW      50
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valorAD0+0
	MOVF       R0+1, 0
	MOVWF      _valorAD0+1
;VSaula031.c,59 :: 		WordToStr(valorAD0, texto);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula031.c,60 :: 		Lcd_Out(1, 12, "    ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,61 :: 		Lcd_Out(1, 11, Ltrim(texto));
	MOVLW      _texto+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;VSaula031.c,62 :: 		Lcd_Chr_CP('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;VSaula031.c,63 :: 		}
L_main3:
;VSaula031.c,65 :: 		if(valor1 != valorAD1){
	MOVF       _valor1+1, 0
	XORWF      _valorAD1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVF       _valorAD1+0, 0
	XORWF      _valor1+0, 0
L__main6:
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;VSaula031.c,66 :: 		valor1 = valorAD1;
	MOVF       _valorAD1+0, 0
	MOVWF      _valor1+0
	MOVF       _valorAD1+1, 0
	MOVWF      _valor1+1
;VSaula031.c,67 :: 		WordToStr(valorAD1, texto);
	MOVF       _valorAD1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valorAD1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula031.c,68 :: 		Lcd_Out(2, 6, "    ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,69 :: 		Lcd_Out(2, 6, Ltrim(texto));
	MOVLW      _texto+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;VSaula031.c,70 :: 		valorAD1 = 100-valorAD1*0.09775171;
	MOVF       _valorAD1+0, 0
	MOVWF      R0+0
	MOVF       _valorAD1+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      12
	MOVWF      R4+0
	MOVLW      50
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      133
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valorAD1+0
	MOVF       R0+1, 0
	MOVWF      _valorAD1+1
;VSaula031.c,71 :: 		WordToStr(valorAD1, texto);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula031.c,72 :: 		Lcd_Out(2, 12, "    ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_VSaula031+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula031.c,73 :: 		Lcd_Out(2, 11, Ltrim(texto));
	MOVLW      _texto+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;VSaula031.c,74 :: 		Lcd_Chr_CP('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;VSaula031.c,75 :: 		}
L_main4:
;VSaula031.c,82 :: 		}
	GOTO       L_main1
;VSaula031.c,84 :: 		}
	GOTO       $+0
; end of _main

_converter:

;VSaula031.c,86 :: 		void converter(unsigned int valor){
;VSaula031.c,87 :: 		texto[0] = valor/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_converter_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converter_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _texto+0
;VSaula031.c,88 :: 		texto[1] = (valor/100)%10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converter_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converter_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _texto+1
;VSaula031.c,89 :: 		texto[2] = (valor/10)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converter_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converter_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _texto+2
;VSaula031.c,90 :: 		texto[3] = (valor/1)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converter_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converter_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _texto+3
;VSaula031.c,91 :: 		}
	RETURN
; end of _converter
