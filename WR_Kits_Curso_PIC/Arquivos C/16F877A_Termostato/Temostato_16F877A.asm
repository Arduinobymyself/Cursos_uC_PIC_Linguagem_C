
_main:

;Temostato_16F877A.c,59 :: 		void main()
;Temostato_16F877A.c,63 :: 		TRISA = 0b11000001;                 //Configura RA0 como entrada AN0
	MOVLW      193
	MOVWF      TRISA+0
;Temostato_16F877A.c,64 :: 		TRISB = 0x80;                       //Somente RB7 como entrada
	MOVLW      128
	MOVWF      TRISB+0
;Temostato_16F877A.c,65 :: 		TRISD = 0x00;                       //Todo o PORT D como saída
	CLRF       TRISD+0
;Temostato_16F877A.c,67 :: 		CMCON = 0b00000111;
	MOVLW      7
	MOVWF      CMCON+0
;Temostato_16F877A.c,68 :: 		ADCON0 = 0b00000001;                //Ativa o conversor A/D e seleciona o canal analógico AN0
	MOVLW      1
	MOVWF      ADCON0+0
;Temostato_16F877A.c,71 :: 		PORTA = 0x00;                       //Inicializa os bits em low
	CLRF       PORTA+0
;Temostato_16F877A.c,72 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Temostato_16F877A.c,73 :: 		PORTD = 0x00;                       //Inicializa os bits em low
	CLRF       PORTD+0
;Temostato_16F877A.c,75 :: 		Lcd_Init();                         //Inicializa o display
	CALL       _Lcd_Init+0
;Temostato_16F877A.c,76 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);           //Apaga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temostato_16F877A.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);                //Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temostato_16F877A.c,81 :: 		text=("TEMPERATURA");               //Armazena o texto na variável text
	MOVLW      ?lstr1_Temostato_16F877A+0
	MOVWF      _text+0
;Temostato_16F877A.c,82 :: 		lcd_out(1,3,text);                  //Escreve o texto uma vez no display, linha 1, coluna 3
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temostato_16F877A.c,84 :: 		text=("Temp =");                    //Armazena o texto na variável text
	MOVLW      ?lstr2_Temostato_16F877A+0
	MOVWF      _text+0
;Temostato_16F877A.c,85 :: 		lcd_out(2,1,text);                  //Escreve o texto uma vez no display, linha 2, coluna 1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temostato_16F877A.c,88 :: 		while(1)                         //Início do loop infinito
L_main0:
;Temostato_16F877A.c,90 :: 		if(!SW) Celsius();           //Se RD0 estiver em low, exibe temperatura em Celsius
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main2
	CALL       _Celsius+0
	GOTO       L_main3
L_main2:
;Temostato_16F877A.c,92 :: 		else Fahrenheit();           //senão, exibe temperatura em Fahrenheit
	CALL       _Fahrenheit+0
L_main3:
;Temostato_16F877A.c,94 :: 		} //end while
	GOTO       L_main0
;Temostato_16F877A.c,96 :: 		} //end main
L_end_main:
	GOTO       $+0
; end of _main

_Celsius:

;Temostato_16F877A.c,98 :: 		void Celsius(){
;Temostato_16F877A.c,99 :: 		store = average_temp();                       //atribui a média de 100 medidas à variável store
	CALL       _average_temp+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	MOVF       R0+1, 0
	MOVWF      _store+1
	MOVF       R0+2, 0
	MOVWF      _store+2
	MOVF       R0+3, 0
	MOVWF      _store+3
;Temostato_16F877A.c,100 :: 		t_Celsius = (store*vdd*factor)/ad_resolution; //converte o valor para escala Celsius
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
	MOVWF      FLOC__Celsius+8
	MOVF       R0+1, 0
	MOVWF      FLOC__Celsius+9
	MOVF       R0+2, 0
	MOVWF      FLOC__Celsius+10
	MOVF       R0+3, 0
	MOVWF      FLOC__Celsius+11
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+8, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+9, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+10, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Celsius+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Celsius+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Celsius+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Celsius+3
	MOVF       FLOC__Celsius+0, 0
	MOVWF      _t_Celsius+0
	MOVF       FLOC__Celsius+1, 0
	MOVWF      _t_Celsius+1
	MOVF       FLOC__Celsius+2, 0
	MOVWF      _t_Celsius+2
	MOVF       FLOC__Celsius+3, 0
	MOVWF      _t_Celsius+3
;Temostato_16F877A.c,103 :: 		dezena = t_Celsius / 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Celsius+4
	MOVF       R0+1, 0
	MOVWF      FLOC__Celsius+5
	MOVF       R0+2, 0
	MOVWF      FLOC__Celsius+6
	MOVF       R0+3, 0
	MOVWF      FLOC__Celsius+7
	MOVF       FLOC__Celsius+4, 0
	MOVWF      _dezena+0
;Temostato_16F877A.c,104 :: 		unidade = t_Celsius % 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+3, 0
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
;Temostato_16F877A.c,105 :: 		dec1 = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+8, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+9, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+10, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+11, 0
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
	MOVWF      FLOC__Celsius+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Celsius+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Celsius+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Celsius+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _dec1+0
;Temostato_16F877A.c,106 :: 		dec2 = (((((store*vdd*factor)%ad_resolution)*10)%ad_resolution)*10)/ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Celsius+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Celsius+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Celsius+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Celsius+3, 0
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
	MOVWF      _dec2+0
;Temostato_16F877A.c,109 :: 		disp_t;              //chama a macro
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FLOC__Celsius+4, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _dec1+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _dec2+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      14
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;Temostato_16F877A.c,111 :: 		Lcd_Out(2, 15, "C"); //escreve "C" de Celsius no display
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Temostato_16F877A+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temostato_16F877A.c,113 :: 		termostato(20, 24);
	MOVLW      20
	MOVWF      FARG_termostato_tempMin+0
	MOVLW      0
	MOVWF      FARG_termostato_tempMin+1
	MOVLW      24
	MOVWF      FARG_termostato_tempMax+0
	MOVLW      0
	MOVWF      FARG_termostato_tempMax+1
	CALL       _termostato+0
;Temostato_16F877A.c,115 :: 		delay_ms(800);       //taxa de atualização do display e das medidas
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_Celsius4:
	DECFSZ     R13+0, 1
	GOTO       L_Celsius4
	DECFSZ     R12+0, 1
	GOTO       L_Celsius4
	DECFSZ     R11+0, 1
	GOTO       L_Celsius4
;Temostato_16F877A.c,116 :: 		}
L_end_Celsius:
	RETURN
; end of _Celsius

_Fahrenheit:

;Temostato_16F877A.c,118 :: 		void Fahrenheit(){
;Temostato_16F877A.c,119 :: 		store = average_temp();                       //atribui a média de 100 medidas à variável store
	CALL       _average_temp+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	MOVF       R0+1, 0
	MOVWF      _store+1
	MOVF       R0+2, 0
	MOVWF      _store+2
	MOVF       R0+3, 0
	MOVWF      _store+3
;Temostato_16F877A.c,120 :: 		t_Celsius = (store*vdd*factor)/ad_resolution; //converte o valor para escala Celsius
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
	MOVWF      FLOC__Fahrenheit+8
	MOVF       R0+1, 0
	MOVWF      FLOC__Fahrenheit+9
	MOVF       R0+2, 0
	MOVWF      FLOC__Fahrenheit+10
	MOVF       R0+3, 0
	MOVWF      FLOC__Fahrenheit+11
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+8, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+9, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+10, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+11, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _t_Celsius+0
	MOVF       R0+1, 0
	MOVWF      _t_Celsius+1
	MOVF       R0+2, 0
	MOVWF      _t_Celsius+2
	MOVF       R0+3, 0
	MOVWF      _t_Celsius+3
;Temostato_16F877A.c,122 :: 		t_Fahrenheit = (t_Celsius*1.8)+32;            //converte temperatura em Celsius para Fahrenheit
	CALL       _longword2double+0
	MOVLW      102
	MOVWF      R4+0
	MOVLW      102
	MOVWF      R4+1
	MOVLW      102
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2longword+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Fahrenheit+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Fahrenheit+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Fahrenheit+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Fahrenheit+3
	MOVF       FLOC__Fahrenheit+0, 0
	MOVWF      _t_Fahrenheit+0
	MOVF       FLOC__Fahrenheit+1, 0
	MOVWF      _t_Fahrenheit+1
	MOVF       FLOC__Fahrenheit+2, 0
	MOVWF      _t_Fahrenheit+2
	MOVF       FLOC__Fahrenheit+3, 0
	MOVWF      _t_Fahrenheit+3
;Temostato_16F877A.c,126 :: 		dezena = t_Fahrenheit/10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Fahrenheit+4
	MOVF       R0+1, 0
	MOVWF      FLOC__Fahrenheit+5
	MOVF       R0+2, 0
	MOVWF      FLOC__Fahrenheit+6
	MOVF       R0+3, 0
	MOVWF      FLOC__Fahrenheit+7
	MOVF       FLOC__Fahrenheit+4, 0
	MOVWF      _dezena+0
;Temostato_16F877A.c,127 :: 		unidade = t_Fahrenheit % 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+3, 0
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
;Temostato_16F877A.c,128 :: 		dec1 = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+8, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+9, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+10, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+11, 0
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
	MOVWF      FLOC__Fahrenheit+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Fahrenheit+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Fahrenheit+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Fahrenheit+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _dec1+0
;Temostato_16F877A.c,129 :: 		dec2 = (((((store*vdd*factor)%ad_resolution)*10)%ad_resolution)*10)/ad_resolution;
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FLOC__Fahrenheit+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Fahrenheit+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Fahrenheit+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Fahrenheit+3, 0
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
	MOVWF      _dec2+0
;Temostato_16F877A.c,131 :: 		disp_t;              //chama a macro
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FLOC__Fahrenheit+4, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _dec1+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _dec2+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      14
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;Temostato_16F877A.c,133 :: 		Lcd_Out(2, 15, "F"); //escreve "F" de Fahrenheit no display
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Temostato_16F877A+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temostato_16F877A.c,135 :: 		termostato(20, 24);
	MOVLW      20
	MOVWF      FARG_termostato_tempMin+0
	MOVLW      0
	MOVWF      FARG_termostato_tempMin+1
	MOVLW      24
	MOVWF      FARG_termostato_tempMax+0
	MOVLW      0
	MOVWF      FARG_termostato_tempMax+1
	CALL       _termostato+0
;Temostato_16F877A.c,137 :: 		delay_ms(800);       //taxa de atualização do display e das medidas
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_Fahrenheit5:
	DECFSZ     R13+0, 1
	GOTO       L_Fahrenheit5
	DECFSZ     R12+0, 1
	GOTO       L_Fahrenheit5
	DECFSZ     R11+0, 1
	GOTO       L_Fahrenheit5
;Temostato_16F877A.c,139 :: 		}
L_end_Fahrenheit:
	RETURN
; end of _Fahrenheit

_average_temp:

;Temostato_16F877A.c,141 :: 		long average_temp(){
;Temostato_16F877A.c,143 :: 		unsigned long temp_store = 0;
	CLRF       average_temp_temp_store_L0+0
	CLRF       average_temp_temp_store_L0+1
	CLRF       average_temp_temp_store_L0+2
	CLRF       average_temp_temp_store_L0+3
;Temostato_16F877A.c,145 :: 		for(i=0; i<100; i++)
	CLRF       average_temp_i_L0+0
L_average_temp6:
	MOVLW      100
	SUBWF      average_temp_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_average_temp7
;Temostato_16F877A.c,147 :: 		temp_store += ADC_Read(0); //faz o somatório das 100 iterações
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      0
	MOVWF      R0+2
	MOVWF      R0+3
	MOVF       average_temp_temp_store_L0+0, 0
	ADDWF      R0+0, 1
	MOVF       average_temp_temp_store_L0+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     average_temp_temp_store_L0+1, 0
	ADDWF      R0+1, 1
	MOVF       average_temp_temp_store_L0+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     average_temp_temp_store_L0+2, 0
	ADDWF      R0+2, 1
	MOVF       average_temp_temp_store_L0+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     average_temp_temp_store_L0+3, 0
	ADDWF      R0+3, 1
	MOVF       R0+0, 0
	MOVWF      average_temp_temp_store_L0+0
	MOVF       R0+1, 0
	MOVWF      average_temp_temp_store_L0+1
	MOVF       R0+2, 0
	MOVWF      average_temp_temp_store_L0+2
	MOVF       R0+3, 0
	MOVWF      average_temp_temp_store_L0+3
;Temostato_16F877A.c,145 :: 		for(i=0; i<100; i++)
	INCF       average_temp_i_L0+0, 1
;Temostato_16F877A.c,148 :: 		}
	GOTO       L_average_temp6
L_average_temp7:
;Temostato_16F877A.c,150 :: 		return(temp_store/100); //retorna a média das iterações
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       average_temp_temp_store_L0+0, 0
	MOVWF      R0+0
	MOVF       average_temp_temp_store_L0+1, 0
	MOVWF      R0+1
	MOVF       average_temp_temp_store_L0+2, 0
	MOVWF      R0+2
	MOVF       average_temp_temp_store_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
;Temostato_16F877A.c,151 :: 		}
L_end_average_temp:
	RETURN
; end of _average_temp

_CustomChar:

;Temostato_16F877A.c,153 :: 		void CustomChar(char pos_row, char pos_char)  //função gerada pelo mikroC para imprimir caracteres especiais
;Temostato_16F877A.c,156 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temostato_16F877A.c,157 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar9:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar10
	MOVF       CustomChar_i_L0+0, 0
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
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar9
L_CustomChar10:
;Temostato_16F877A.c,158 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temostato_16F877A.c,159 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Temostato_16F877A.c,160 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_termostato:

;Temostato_16F877A.c,162 :: 		void termostato(unsigned int tempMin, unsigned int tempMax){
;Temostato_16F877A.c,163 :: 		if(t_Celsius  < tempMin){
	MOVLW      0
	SUBWF      _t_Celsius+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato26
	MOVLW      0
	SUBWF      _t_Celsius+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato26
	MOVF       FARG_termostato_tempMin+1, 0
	SUBWF      _t_Celsius+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato26
	MOVF       FARG_termostato_tempMin+0, 0
	SUBWF      _t_Celsius+0, 0
L__termostato26:
	BTFSC      STATUS+0, 0
	GOTO       L_termostato12
;Temostato_16F877A.c,165 :: 		ledRED        = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Temostato_16F877A.c,166 :: 		ledBLUE       = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Temostato_16F877A.c,167 :: 		ledGREEN      = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Temostato_16F877A.c,168 :: 		aquecedor     = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;Temostato_16F877A.c,169 :: 		ventilador    = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Temostato_16F877A.c,170 :: 		} else if(t_Celsius  > tempMax){
	GOTO       L_termostato13
L_termostato12:
	MOVF       _t_Celsius+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato27
	MOVF       _t_Celsius+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato27
	MOVF       _t_Celsius+1, 0
	SUBWF      FARG_termostato_tempMax+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__termostato27
	MOVF       _t_Celsius+0, 0
	SUBWF      FARG_termostato_tempMax+0, 0
L__termostato27:
	BTFSC      STATUS+0, 0
	GOTO       L_termostato14
;Temostato_16F877A.c,172 :: 		ledRED        = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Temostato_16F877A.c,173 :: 		ledBLUE       = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Temostato_16F877A.c,174 :: 		ledGREEN      = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Temostato_16F877A.c,175 :: 		aquecedor     = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Temostato_16F877A.c,176 :: 		ventilador    = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Temostato_16F877A.c,177 :: 		} else {
	GOTO       L_termostato15
L_termostato14:
;Temostato_16F877A.c,179 :: 		ledRED        = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Temostato_16F877A.c,180 :: 		ledBLUE       = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Temostato_16F877A.c,181 :: 		ledGREEN      = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;Temostato_16F877A.c,182 :: 		aquecedor     = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Temostato_16F877A.c,183 :: 		ventilador    = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Temostato_16F877A.c,184 :: 		}
L_termostato15:
L_termostato13:
;Temostato_16F877A.c,185 :: 		}
L_end_termostato:
	RETURN
; end of _termostato

_LCD_BusyFlag:

;Temostato_16F877A.c,187 :: 		void LCD_BusyFlag(){
;Temostato_16F877A.c,188 :: 		LCD_D7   = 1;           //Make D7th bit of LCD as i/p
	BSF        RD7_bit+0, BitPos(RD7_bit+0)
;Temostato_16F877A.c,189 :: 		LCD_EN   = 1;           //Make port pin as o/p
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;Temostato_16F877A.c,190 :: 		LCD_RS   = 0;           //Selected command register
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;Temostato_16F877A.c,192 :: 		while(LCD_D7){          //read busy flag again and again till it becomes 0
L_LCD_BusyFlag16:
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_LCD_BusyFlag17
;Temostato_16F877A.c,193 :: 		LCD_EN   = 0;         //Enable H->L
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;Temostato_16F877A.c,194 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_LCD_BusyFlag18:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_BusyFlag18
	DECFSZ     R12+0, 1
	GOTO       L_LCD_BusyFlag18
	NOP
	NOP
;Temostato_16F877A.c,195 :: 		LCD_EN   = 1;         //Enable L->H
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;Temostato_16F877A.c,196 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_LCD_BusyFlag19:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_BusyFlag19
	DECFSZ     R12+0, 1
	GOTO       L_LCD_BusyFlag19
	NOP
	NOP
;Temostato_16F877A.c,197 :: 		}
	GOTO       L_LCD_BusyFlag16
L_LCD_BusyFlag17:
;Temostato_16F877A.c,198 :: 		}
L_end_LCD_BusyFlag:
	RETURN
; end of _LCD_BusyFlag
