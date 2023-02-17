
_graus:

;VSaula032.c,32 :: 		void graus(char pos_row, char pos_char) {
;VSaula032.c,34 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,35 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       graus_i_L0+0
L_graus0:
	MOVF       graus_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_graus1
	MOVF       graus_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
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
	INCF       graus_i_L0+0, 1
	GOTO       L_graus0
L_graus1:
;VSaula032.c,36 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,37 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_graus_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_graus_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,38 :: 		}
	RETURN
; end of _graus

_main:

;VSaula032.c,43 :: 		void main() {
;VSaula032.c,45 :: 		ADCON0 = 0b10100001;
	MOVLW      161
	MOVWF      ADCON0+0
;VSaula032.c,46 :: 		ADCON1 = 0b11000000;
	MOVLW      192
	MOVWF      ADCON1+0
;VSaula032.c,47 :: 		TRISA = 0b000000001;
	MOVLW      1
	MOVWF      TRISA+0
;VSaula032.c,48 :: 		TRISE = 0b000000011;
	MOVLW      3
	MOVWF      TRISE+0
;VSaula032.c,51 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;VSaula032.c,52 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,53 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,56 :: 		Lcd_Out(1, 1, "  ABMS Telecom  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula032+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula032.c,57 :: 		Lcd_Out(2, 1, " Seja Bem Vindo!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula032+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula032.c,58 :: 		delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;VSaula032.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula032.c,61 :: 		Lcd_Out(1, 1, "LM35-1" );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_VSaula032+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula032.c,62 :: 		Lcd_Out(2, 1, "LM35-2" );
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_VSaula032+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula032.c,65 :: 		while(1){
L_main4:
;VSaula032.c,69 :: 		valorAD0 = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _valorAD0+0
	MOVF       R0+1, 0
	MOVWF      _valorAD0+1
;VSaula032.c,70 :: 		valorAD5 = ADC_Get_Sample(5);
	MOVLW      5
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _valorAD5+0
	MOVF       R0+1, 0
	MOVWF      _valorAD5+1
;VSaula032.c,71 :: 		valorAD6 = ADC_Get_Sample(6);
	MOVLW      6
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _valorAD6+0
	MOVF       R0+1, 0
	MOVWF      _valorAD6+1
;VSaula032.c,73 :: 		valorAD0 = valorAD0*4.8876;   // 5000mv/1023 = 4.8876...
	MOVF       _valorAD0+0, 0
	MOVWF      R0+0
	MOVF       _valorAD0+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      56
	MOVWF      R4+0
	MOVLW      103
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valorAD0+0
	MOVF       R0+1, 0
	MOVWF      _valorAD0+1
;VSaula032.c,74 :: 		Lcd_Print(1, 8, valorAD0);
	MOVLW      1
	MOVWF      FARG_Lcd_Print_linha+0
	MOVLW      8
	MOVWF      FARG_Lcd_Print_coluna+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Print_valor+0
	MOVF       R0+1, 0
	MOVWF      FARG_Lcd_Print_valor+1
	CALL       _Lcd_Print+0
;VSaula032.c,77 :: 		valorDif = valorAD5 - valorAD6;
	MOVF       _valorAD6+0, 0
	SUBWF      _valorAD5+0, 0
	MOVWF      R0+0
	MOVF       _valorAD6+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _valorAD5+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _valorDif+0
	MOVF       R0+1, 0
	MOVWF      _valorDif+1
;VSaula032.c,78 :: 		valorDif = valorDif*4.8876;   // 5000mv/1023 = 4.8876...
	CALL       _Int2Double+0
	MOVLW      56
	MOVWF      R4+0
	MOVLW      103
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _valorDif+0
	MOVF       R0+1, 0
	MOVWF      _valorDif+1
;VSaula032.c,79 :: 		Lcd_Print(2, 8, valorDif);
	MOVLW      2
	MOVWF      FARG_Lcd_Print_linha+0
	MOVLW      8
	MOVWF      FARG_Lcd_Print_coluna+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Print_valor+0
	MOVF       R0+1, 0
	MOVWF      FARG_Lcd_Print_valor+1
	CALL       _Lcd_Print+0
;VSaula032.c,81 :: 		delay_ms(100);
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
;VSaula032.c,82 :: 		}
	GOTO       L_main4
;VSaula032.c,84 :: 		}
	GOTO       $+0
; end of _main

_Lcd_Print:

;VSaula032.c,86 :: 		void Lcd_Print(char linha, char coluna, signed int valor){
;VSaula032.c,87 :: 		if(valor < 0){
	MOVLW      128
	XORWF      FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_Print9
	MOVLW      0
	SUBWF      FARG_Lcd_Print_valor+0, 0
L__Lcd_Print9:
	BTFSC      STATUS+0, 0
	GOTO       L_Lcd_Print7
;VSaula032.c,88 :: 		Lcd_Chr(linha, coluna, '-');
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,89 :: 		valor = valor * (-1);
	MOVF       FARG_Lcd_Print_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	MOVLW      255
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Print_valor+0
	MOVF       R0+1, 0
	MOVWF      FARG_Lcd_Print_valor+1
;VSaula032.c,90 :: 		} else {
	GOTO       L_Lcd_Print8
L_Lcd_Print7:
;VSaula032.c,91 :: 		Lcd_Chr(linha, coluna, ' ');
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,92 :: 		}
L_Lcd_Print8:
;VSaula032.c,93 :: 		texto[0] = (valor/1000)%10+48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_Lcd_Print_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+0
;VSaula032.c,94 :: 		texto[1] = (valor/100)%10+48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Lcd_Print_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+1
;VSaula032.c,95 :: 		texto[2] = (valor/10)%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Lcd_Print_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+2
;VSaula032.c,96 :: 		texto[3] = (valor/1)%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Lcd_Print_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Print_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+3
;VSaula032.c,98 :: 		Lcd_Chr(linha, coluna+1, texto[0]);
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _texto+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,99 :: 		Lcd_Chr(linha, coluna+2, texto[1]);
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	ADDWF      FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _texto+1, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,100 :: 		Lcd_Chr(linha, coluna+3, texto[2]);
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	ADDWF      FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _texto+2, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula032.c,101 :: 		graus(linha, coluna+4);
	MOVF       FARG_Lcd_Print_linha+0, 0
	MOVWF      FARG_graus_pos_row+0
	MOVLW      4
	ADDWF      FARG_Lcd_Print_coluna+0, 0
	MOVWF      FARG_graus_pos_char+0
	CALL       _graus+0
;VSaula032.c,102 :: 		Lcd_Chr_CP('C');
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;VSaula032.c,103 :: 		}
	RETURN
; end of _Lcd_Print
