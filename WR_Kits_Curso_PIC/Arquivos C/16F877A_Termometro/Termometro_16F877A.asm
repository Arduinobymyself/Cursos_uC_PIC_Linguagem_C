
_main:

;Termometro_16F877A.c,31 :: 		void main(){
;Termometro_16F877A.c,32 :: 		ADCON0 = 0b00000001;                //Habilita módulo A/D, Seleciona o pino analógico AN0
	MOVLW      1
	MOVWF      ADCON0+0
;Termometro_16F877A.c,33 :: 		ADCON1 = 0b00001110;                //Apenas RA0 como analógico
	MOVLW      14
	MOVWF      ADCON1+0
;Termometro_16F877A.c,37 :: 		TRISA = 0b11110101;                 //Configura todo PORT A: RD1 a RD3 como saída o restante como entrada
	MOVLW      245
	MOVWF      TRISA+0
;Termometro_16F877A.c,38 :: 		TRISD = 0b00000100;                 //Configura o pino RD2 como entrada
	MOVLW      4
	MOVWF      TRISD+0
;Termometro_16F877A.c,39 :: 		PORTA = 0b00000000;                 //Inicializa os bits em low
	CLRF       PORTA+0
;Termometro_16F877A.c,40 :: 		PORTD = 0b00000001;                 //Inicializa RD0 em high
	MOVLW      1
	MOVWF      PORTD+0
;Termometro_16F877A.c,42 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Termometro_16F877A.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Termometro_16F877A.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Termometro_16F877A.c,46 :: 		text = ("TEMPERATURA");
	MOVLW      ?lstr1_Termometro_16F877A+0
	MOVWF      _text+0
;Termometro_16F877A.c,47 :: 		Lcd_Out(1, 3, text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Termometro_16F877A.c,48 :: 		text = ("Temp =");
	MOVLW      ?lstr2_Termometro_16F877A+0
	MOVWF      _text+0
;Termometro_16F877A.c,49 :: 		Lcd_Out(2, 1, text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Termometro_16F877A.c,52 :: 		while(1){
L_main0:
;Termometro_16F877A.c,53 :: 		store = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	MOVF       R0+1, 0
	MOVWF      _store+1
	CLRF       _store+2
	CLRF       _store+3
;Termometro_16F877A.c,54 :: 		t_Celsius = (store * vdd * factor) / ad_resolution;
	MOVF       _store+0, 0
	MOVWF      R0+0
	MOVF       _store+1, 0
	MOVWF      R0+1
	MOVF       _store+2, 0
	MOVWF      R0+2
	MOVF       _store+3, 0
	MOVWF      R0+3
	MOVLW      5
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+8
	MOVF       R0+1, 0
	MOVWF      FLOC__main+9
	MOVF       R0+2, 0
	MOVWF      FLOC__main+10
	MOVF       R0+3, 0
	MOVWF      FLOC__main+11
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+8, 0
	MOVWF      R0+0
	MOVF       FLOC__main+9, 0
	MOVWF      R0+1
	MOVF       FLOC__main+10, 0
	MOVWF      R0+2
	MOVF       FLOC__main+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+0, 0
	MOVWF      _t_Celsius+0
	MOVF       FLOC__main+1, 0
	MOVWF      _t_Celsius+1
	MOVF       FLOC__main+2, 0
	MOVWF      _t_Celsius+2
	MOVF       FLOC__main+3, 0
	MOVWF      _t_Celsius+3
;Termometro_16F877A.c,55 :: 		dezena = t_Celsius / 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       R0+2, 0
	MOVWF      FLOC__main+6
	MOVF       R0+3, 0
	MOVWF      FLOC__main+7
	MOVF       FLOC__main+4, 0
	MOVWF      _dezena+0
;Termometro_16F877A.c,56 :: 		unidade = t_Celsius % 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _unidade+0
;Termometro_16F877A.c,57 :: 		decimos = (((store * vdd * factor) % ad_resolution) * 10) / ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+8, 0
	MOVWF      R0+0
	MOVF       FLOC__main+9, 0
	MOVWF      R0+1
	MOVF       FLOC__main+10, 0
	MOVWF      R0+2
	MOVF       FLOC__main+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _decimos+0
;Termometro_16F877A.c,58 :: 		centesimos = (((((store * vdd * factor) % ad_resolution) * 10) % ad_resolution) * 10) / ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _centesimos+0
;Termometro_16F877A.c,60 :: 		Lcd_Chr(2, 9, dezena + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FLOC__main+4, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Termometro_16F877A.c,61 :: 		Lcd_Chr_Cp(unidade + 48);
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,62 :: 		Lcd_Chr_Cp('.');
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,63 :: 		Lcd_Chr_Cp(decimos + 48);
	MOVLW      48
	ADDWF      _decimos+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,64 :: 		Lcd_Chr_Cp(centesimos + 48);
	MOVLW      48
	ADDWF      _centesimos+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,66 :: 		delay_ms(800);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;Termometro_16F877A.c,68 :: 		}
	GOTO       L_main0
;Termometro_16F877A.c,70 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_disp_t:

;Termometro_16F877A.c,72 :: 		void disp_t(){
;Termometro_16F877A.c,73 :: 		Lcd_Chr(2, 9, dezena + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _dezena+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Termometro_16F877A.c,74 :: 		Lcd_Chr_CP(unidade + 48);
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,75 :: 		Lcd_Chr_CP('.');
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,76 :: 		Lcd_Chr_CP(decimos + 48);
	MOVLW      48
	ADDWF      _decimos+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,77 :: 		Lcd_Chr_CP(centesimos + 48);
	MOVLW      48
	ADDWF      _centesimos+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Termometro_16F877A.c,78 :: 		}
L_end_disp_t:
	RETURN
; end of _disp_t
