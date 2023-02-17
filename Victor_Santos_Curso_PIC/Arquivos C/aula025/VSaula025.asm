
_main:

;VSaula025.c,61 :: 		void main() {
;VSaula025.c,63 :: 		ADCON0 = 0b00000000; // Fosc/4
	CLRF       ADCON0+0
;VSaula025.c,64 :: 		ADCON1 = 0b11000100; // justificado a direita, canais RA0/AN0, RA1/AN1 e RA3/AN3 configurados como analógico
	MOVLW      196
	MOVWF      ADCON1+0
;VSaula025.c,65 :: 		TRISA = 0b00000011;  // cnais AN0 e AN1 como entrada
	MOVLW      3
	MOVWF      TRISA+0
;VSaula025.c,67 :: 		TRISC = 0x00;  // port C como saída
	CLRF       TRISC+0
;VSaula025.c,68 :: 		PORTC = 0x00;  // port C inicia em nível baixo
	CLRF       PORTC+0
;VSaula025.c,69 :: 		TRISB = 0x03;  // RB0 e RB1 como entrada
	MOVLW      3
	MOVWF      TRISB+0
;VSaula025.c,70 :: 		PORTB = 0x03;  // resistores de pull-up
	MOVLW      3
	MOVWF      PORTB+0
;VSaula025.c,71 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula025.c,72 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula025.c,74 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula025.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025.c,76 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025.c,77 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025.c,79 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,80 :: 		Lcd_Out(2, 1, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,81 :: 		delay_ms(2000);
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
;VSaula025.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025.c,83 :: 		Lcd_Out(1, 1, "AN0 = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula025+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,84 :: 		Lcd_Out(2, 1, "AN1 = ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula025+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,86 :: 		while(1){
L_main1:
;VSaula025.c,88 :: 		ADCON0.CHS2 = 0;       // selecionam o canal AN0
	BCF        ADCON0+0, 5
;VSaula025.c,89 :: 		ADCON0.CHS1 = 0;
	BCF        ADCON0+0, 4
;VSaula025.c,90 :: 		ADCON0.CHS0 = 0;
	BCF        ADCON0+0, 3
;VSaula025.c,91 :: 		ADCON0.ADON = 1;       // ativa conversor A/D, liga o módulo
	BSF        ADCON0+0, 0
;VSaula025.c,92 :: 		delay_us(20);          // tempo de espera da ativação e carga do capacitor de conversão
	MOVLW      13
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
;VSaula025.c,93 :: 		ADCON0.GO_DONE = 1;    // inicia o processo de conversão
	BSF        ADCON0+0, 2
;VSaula025.c,94 :: 		while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado
L_main4:
	BTFSS      ADCON0+0, 2
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;VSaula025.c,96 :: 		valorAD0 = (ADRESH << 8) + ADRESL; // pega o valor da conversão
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _valorAD0+0
	MOVF       R0+1, 0
	MOVWF      _valorAD0+1
;VSaula025.c,99 :: 		valorAD0 = valorAD0*4.88758;  // valorAD0*5000/1023 = valorAD0*4.88758
	CALL       _Word2Double+0
	MOVLW      14
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
;VSaula025.c,101 :: 		ADCON0.ADON = 0;
	BCF        ADCON0+0, 0
;VSaula025.c,102 :: 		delay_us(20);
	MOVLW      13
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
;VSaula025.c,104 :: 		converte(valorAd0);
	MOVF       _valorAD0+0, 0
	MOVWF      FARG_converte_valor+0
	MOVF       _valorAD0+1, 0
	MOVWF      FARG_converte_valor+1
	CALL       _converte+0
;VSaula025.c,105 :: 		Lcd_Out(1, 7, texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,106 :: 		Lcd_Out(1, 12, "V");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_VSaula025+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,109 :: 		ADCON0.CHS2 = 0;       // selecionam o canal AN1
	BCF        ADCON0+0, 5
;VSaula025.c,110 :: 		ADCON0.CHS1 = 0;
	BCF        ADCON0+0, 4
;VSaula025.c,111 :: 		ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 3
;VSaula025.c,112 :: 		ADCON0.ADON = 1;       // ativa conversor A/D
	BSF        ADCON0+0, 0
;VSaula025.c,113 :: 		delay_us(20);          // tempo de espera da ativação
	MOVLW      13
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
;VSaula025.c,114 :: 		ADCON0.GO_DONE = 1;    // inicia o processo de conversão
	BSF        ADCON0+0, 2
;VSaula025.c,115 :: 		while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado
L_main8:
	BTFSS      ADCON0+0, 2
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;VSaula025.c,117 :: 		valorAD1 = (ADRESH << 8) + ADRESL; // pega o valor da conversão
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _valorAD1+0
	MOVF       R0+1, 0
	MOVWF      _valorAD1+1
;VSaula025.c,119 :: 		valorAD1 = valorAD1*4.88758;   // valorAD1*5000/1023 = valorAD1*4.88758
	CALL       _Word2Double+0
	MOVLW      14
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
	MOVWF      _valorAD1+0
	MOVF       R0+1, 0
	MOVWF      _valorAD1+1
;VSaula025.c,121 :: 		ADCON0.ADON = 0;
	BCF        ADCON0+0, 0
;VSaula025.c,122 :: 		delay_us(20);
	MOVLW      13
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
;VSaula025.c,124 :: 		converte(valorAD1);
	MOVF       _valorAD1+0, 0
	MOVWF      FARG_converte_valor+0
	MOVF       _valorAD1+1, 0
	MOVWF      FARG_converte_valor+1
	CALL       _converte+0
;VSaula025.c,125 :: 		Lcd_Out(2, 7, texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,126 :: 		Lcd_Out(2, 12, "V");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_VSaula025+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025.c,129 :: 		}
	GOTO       L_main1
;VSaula025.c,131 :: 		}
	GOTO       $+0
; end of _main

_converte:

;VSaula025.c,135 :: 		void converte(unsigned int valor){
;VSaula025.c,137 :: 		texto[0] = valor/1000+48;      // 1234/1000 = 1.234 pega o 1, o resto 234(é desconsiderado, devido a variável ser char)
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_converte_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converte_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+0
;VSaula025.c,138 :: 		texto[1] = '.';                // caracter ponto
	MOVLW      46
	MOVWF      _texto+1
;VSaula025.c,139 :: 		texto[2] = (valor/100)%10+48;  // 1234/100 = 12.34 ... 12/10 = 1.2 pega o resto 2
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converte_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converte_valor+1, 0
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
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+2
;VSaula025.c,140 :: 		texto[3] = (valor/10)%10+48;   // 1234/10 = 123.4 ... 123/10 = 12.3 pega o resto 3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converte_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converte_valor+1, 0
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
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+3
;VSaula025.c,141 :: 		texto[4] = (valor/1)%10+48;    // 1234/1 = 1234 ... 1234/10 = 123.4 pega o resto 4
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_converte_valor+0, 0
	MOVWF      R0+0
	MOVF       FARG_converte_valor+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+4
;VSaula025.c,143 :: 		}
	RETURN
; end of _converte
