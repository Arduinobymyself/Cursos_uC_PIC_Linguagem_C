
_main:

;VSaula025b.c,59 :: 		void main() {
;VSaula025b.c,61 :: 		ADCON0 = 0b00000000; // Fosc/4
	CLRF       ADCON0+0
;VSaula025b.c,62 :: 		ADCON1 = 0b11000100; // justificado a direita, canais RA0/AN0, RA1/AN1 e RA3/AN3 configurados como analógico
	MOVLW      196
	MOVWF      ADCON1+0
;VSaula025b.c,63 :: 		TRISA = 0b00000011; // canais AN0 e AN1 como entrada
	MOVLW      3
	MOVWF      TRISA+0
;VSaula025b.c,65 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;VSaula025b.c,66 :: 		TRISB.RB1 = 1;
	BSF        TRISB+0, 1
;VSaula025b.c,67 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula025b.c,68 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula025b.c,69 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;VSaula025b.c,70 :: 		PORTE = 0x00;
	CLRF       PORTE+0
;VSaula025b.c,73 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula025b.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025b.c,75 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025b.c,76 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025b.c,78 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,79 :: 		Lcd_Out(2, 1, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,80 :: 		delay_ms(2000);
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
;VSaula025b.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula025b.c,82 :: 		Lcd_Out(1, 1, "AN0 = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula025b+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,83 :: 		Lcd_Out(2, 1, "AN1 = ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula025b+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,85 :: 		while(1){
L_main1:
;VSaula025b.c,87 :: 		ADCON0.CHS2 = 0;       // selecionam o canal AN0
	BCF        ADCON0+0, 5
;VSaula025b.c,88 :: 		ADCON0.CHS1 = 0;
	BCF        ADCON0+0, 4
;VSaula025b.c,89 :: 		ADCON0.CHS0 = 0;
	BCF        ADCON0+0, 3
;VSaula025b.c,90 :: 		ADCON0.ADON = 1;       // ativa conversor A/D
	BSF        ADCON0+0, 0
;VSaula025b.c,91 :: 		delay_us(20);          // tempo de espera da ativação
	MOVLW      13
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
;VSaula025b.c,92 :: 		ADCON0.GO_DONE = 1;    // inicia o processo de conversão
	BSF        ADCON0+0, 2
;VSaula025b.c,93 :: 		while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado
L_main4:
	BTFSS      ADCON0+0, 2
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;VSaula025b.c,95 :: 		valorAD0 = (ADRESH << 8) + ADRESL; // pega o valor da conversão
	MOVF       ADRESH+0, 0
	MOVWF      _valorAD0+1
	CLRF       _valorAD0+0
	MOVF       ADRESL+0, 0
	ADDWF      _valorAD0+0, 1
	BTFSC      STATUS+0, 0
	INCF       _valorAD0+1, 1
;VSaula025b.c,97 :: 		ADCON0.ADON = 0;
	BCF        ADCON0+0, 0
;VSaula025b.c,98 :: 		delay_us(20);
	MOVLW      13
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
;VSaula025b.c,100 :: 		WordToStr(valorAD0, texto3);
	MOVF       _valorAD0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valorAD0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto3+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula025b.c,101 :: 		Lcd_Out(1, 7, texto3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,104 :: 		ADCON0.CHS2 = 0;       // selecionam o canal AN1
	BCF        ADCON0+0, 5
;VSaula025b.c,105 :: 		ADCON0.CHS1 = 0;
	BCF        ADCON0+0, 4
;VSaula025b.c,106 :: 		ADCON0.CHS0 = 1;
	BSF        ADCON0+0, 3
;VSaula025b.c,107 :: 		ADCON0.ADON = 1;       // ativa conversor A/D
	BSF        ADCON0+0, 0
;VSaula025b.c,108 :: 		delay_us(20);          // tempo de espera da ativação
	MOVLW      13
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
;VSaula025b.c,109 :: 		ADCON0.GO_DONE = 1;    // inicia o processo de conversão
	BSF        ADCON0+0, 2
;VSaula025b.c,110 :: 		while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado
L_main8:
	BTFSS      ADCON0+0, 2
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;VSaula025b.c,112 :: 		valorAD1 = (ADRESH << 8) + ADRESL; // pega o valor da conversão
	MOVF       ADRESH+0, 0
	MOVWF      _valorAD1+1
	CLRF       _valorAD1+0
	MOVF       ADRESL+0, 0
	ADDWF      _valorAD1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _valorAD1+1, 1
;VSaula025b.c,114 :: 		ADCON0.ADON = 0;
	BCF        ADCON0+0, 0
;VSaula025b.c,115 :: 		delay_us(20);
	MOVLW      13
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
;VSaula025b.c,117 :: 		WordToStr(valorAD1, texto4);
	MOVF       _valorAD1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valorAD1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto4+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula025b.c,118 :: 		Lcd_Out(2, 7, texto4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula025b.c,122 :: 		if(!B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main13
L__main18:
;VSaula025b.c,123 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;VSaula025b.c,124 :: 		}
L_main13:
;VSaula025b.c,125 :: 		if(B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main16
L__main17:
;VSaula025b.c,126 :: 		L0 = ~L0;
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula025b.c,127 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;VSaula025b.c,128 :: 		}
L_main16:
;VSaula025b.c,131 :: 		}
	GOTO       L_main1
;VSaula025b.c,133 :: 		}
	GOTO       $+0
; end of _main
