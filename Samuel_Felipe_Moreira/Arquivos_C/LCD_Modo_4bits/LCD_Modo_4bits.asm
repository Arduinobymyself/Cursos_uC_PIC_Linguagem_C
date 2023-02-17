
_main:

;LCD_Modo_4bits.c,24 :: 		void main() {
;LCD_Modo_4bits.c,26 :: 		config_mcu();
	CALL       _config_mcu+0
;LCD_Modo_4bits.c,27 :: 		inicializa_lcd();
	CALL       _inicializa_lcd+0
;LCD_Modo_4bits.c,28 :: 		RS = 1;
	BSF        PORTE+0, 2
;LCD_Modo_4bits.c,48 :: 		while(1){
L_main0:
;LCD_Modo_4bits.c,51 :: 		lcd_comando(linha_1);
	MOVLW      128
	MOVWF      FARG_lcd_comando_comando+0
	CALL       _lcd_comando+0
;LCD_Modo_4bits.c,52 :: 		print("  ABMS Telecom  ");
	MOVLW      ?lstr1_LCD_Modo_4bits+0
	MOVWF      FARG_print_texto+0
	CALL       _print+0
;LCD_Modo_4bits.c,54 :: 		lcd_comando(linha_2);
	MOVLW      192
	MOVWF      FARG_lcd_comando_comando+0
	CALL       _lcd_comando+0
;LCD_Modo_4bits.c,55 :: 		print(" Seja Bem Vindo!");
	MOVLW      ?lstr2_LCD_Modo_4bits+0
	MOVWF      FARG_print_texto+0
	CALL       _print+0
;LCD_Modo_4bits.c,57 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LCD_Modo_4bits.c,59 :: 		lcd_comando(limpaLCD);
	MOVLW      1
	MOVWF      FARG_lcd_comando_comando+0
	CALL       _lcd_comando+0
;LCD_Modo_4bits.c,61 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;LCD_Modo_4bits.c,63 :: 		print(IntToChar(123));
	MOVLW      123
	MOVWF      FARG_IntToChar_numero+0
	MOVLW      0
	MOVWF      FARG_IntToChar_numero+1
	CALL       _IntToChar+0
	MOVF       R0+0, 0
	MOVWF      FARG_print_texto+0
	CALL       _print+0
;LCD_Modo_4bits.c,65 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;LCD_Modo_4bits.c,68 :: 		}
	GOTO       L_main0
;LCD_Modo_4bits.c,75 :: 		}
	GOTO       $+0
; end of _main

_config_mcu:

;LCD_Modo_4bits.c,80 :: 		void config_mcu(){
;LCD_Modo_4bits.c,81 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;LCD_Modo_4bits.c,82 :: 		TRISD = 0;
	CLRF       TRISD+0
;LCD_Modo_4bits.c,83 :: 		TRISE = 0;
	CLRF       TRISE+0
;LCD_Modo_4bits.c,84 :: 		}
	RETURN
; end of _config_mcu

_pulse_en:

;LCD_Modo_4bits.c,86 :: 		void pulse_en(){
;LCD_Modo_4bits.c,87 :: 		EN = 0;
	BCF        PORTE+0, 1
;LCD_Modo_4bits.c,88 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en5:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en5
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en5
	NOP
	NOP
;LCD_Modo_4bits.c,89 :: 		EN = 1;
	BSF        PORTE+0, 1
;LCD_Modo_4bits.c,90 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en6:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en6
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en6
	NOP
	NOP
;LCD_Modo_4bits.c,91 :: 		EN = 0;
	BCF        PORTE+0, 1
;LCD_Modo_4bits.c,92 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en7:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en7
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en7
	NOP
	NOP
;LCD_Modo_4bits.c,93 :: 		}
	RETURN
; end of _pulse_en

_output:

;LCD_Modo_4bits.c,95 :: 		void output(char dado){
;LCD_Modo_4bits.c,96 :: 		PORTD = dado;
	MOVF       FARG_output_dado+0, 0
	MOVWF      PORTD+0
;LCD_Modo_4bits.c,97 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,98 :: 		}
	RETURN
; end of _output

_inicializa_lcd:

;LCD_Modo_4bits.c,100 :: 		void inicializa_lcd(){
;LCD_Modo_4bits.c,101 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_inicializa_lcd8:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd8
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd8
	NOP
;LCD_Modo_4bits.c,102 :: 		RS = 0; // modo enviar comandos
	BCF        PORTE+0, 2
;LCD_Modo_4bits.c,105 :: 		output(0b00110000);
	MOVLW      48
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,106 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,107 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,108 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_inicializa_lcd9:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd9
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd9
	NOP
	NOP
;LCD_Modo_4bits.c,109 :: 		output(0b00100000);
	MOVLW      32
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,110 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,111 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,112 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_inicializa_lcd10:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd10
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd10
	NOP
	NOP
;LCD_Modo_4bits.c,115 :: 		output(0b00100000);
	MOVLW      32
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,116 :: 		output(0b10000000);
	MOVLW      128
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,117 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd11:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd11
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd11
;LCD_Modo_4bits.c,120 :: 		output(0b00000000);
	CLRF       FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,121 :: 		output(0b01100000);
	MOVLW      96
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,122 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd12:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd12
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd12
;LCD_Modo_4bits.c,125 :: 		output(0b00000000);
	CLRF       FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,126 :: 		output(0b11100000);
	MOVLW      224
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,127 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd13:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd13
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd13
;LCD_Modo_4bits.c,130 :: 		output(0b00000000);
	CLRF       FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,131 :: 		output(0b00010000);
	MOVLW      16
	MOVWF      FARG_output_dado+0
	CALL       _output+0
;LCD_Modo_4bits.c,132 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd14:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd14
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd14
;LCD_Modo_4bits.c,134 :: 		}
	RETURN
; end of _inicializa_lcd

_lcd_nibble:

;LCD_Modo_4bits.c,136 :: 		void lcd_nibble(char dado){
;LCD_Modo_4bits.c,137 :: 		PORTD.RD4 = dado.f0;
	BTFSC      FARG_lcd_nibble_dado+0, 0
	GOTO       L__lcd_nibble22
	BCF        PORTD+0, 4
	GOTO       L__lcd_nibble23
L__lcd_nibble22:
	BSF        PORTD+0, 4
L__lcd_nibble23:
;LCD_Modo_4bits.c,138 :: 		PORTD.RD5 = dado.f1;
	BTFSC      FARG_lcd_nibble_dado+0, 1
	GOTO       L__lcd_nibble24
	BCF        PORTD+0, 5
	GOTO       L__lcd_nibble25
L__lcd_nibble24:
	BSF        PORTD+0, 5
L__lcd_nibble25:
;LCD_Modo_4bits.c,139 :: 		PORTD.RD6 = dado.f2;
	BTFSC      FARG_lcd_nibble_dado+0, 2
	GOTO       L__lcd_nibble26
	BCF        PORTD+0, 6
	GOTO       L__lcd_nibble27
L__lcd_nibble26:
	BSF        PORTD+0, 6
L__lcd_nibble27:
;LCD_Modo_4bits.c,140 :: 		PORTD.RD7 = dado.f3;
	BTFSC      FARG_lcd_nibble_dado+0, 3
	GOTO       L__lcd_nibble28
	BCF        PORTD+0, 7
	GOTO       L__lcd_nibble29
L__lcd_nibble28:
	BSF        PORTD+0, 7
L__lcd_nibble29:
;LCD_Modo_4bits.c,141 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_4bits.c,142 :: 		}
	RETURN
; end of _lcd_nibble

_lcd_texto:

;LCD_Modo_4bits.c,144 :: 		void lcd_texto(char letra){
;LCD_Modo_4bits.c,145 :: 		RS = 1;
	BSF        PORTE+0, 2
;LCD_Modo_4bits.c,146 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_lcd_texto15:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_texto15
	DECFSZ     R12+0, 1
	GOTO       L_lcd_texto15
	NOP
;LCD_Modo_4bits.c,147 :: 		lcd_nibble(letra>>4);
	MOVF       FARG_lcd_texto_letra+0, 0
	MOVWF      FARG_lcd_nibble_dado+0
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	CALL       _lcd_nibble+0
;LCD_Modo_4bits.c,148 :: 		lcd_nibble(letra&0x0F);
	MOVLW      15
	ANDWF      FARG_lcd_texto_letra+0, 0
	MOVWF      FARG_lcd_nibble_dado+0
	CALL       _lcd_nibble+0
;LCD_Modo_4bits.c,149 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_lcd_texto16:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_texto16
	DECFSZ     R12+0, 1
	GOTO       L_lcd_texto16
	NOP
;LCD_Modo_4bits.c,150 :: 		}
	RETURN
; end of _lcd_texto

_print:

;LCD_Modo_4bits.c,152 :: 		void print(char texto[16]){
;LCD_Modo_4bits.c,154 :: 		for(i = 0; i < 15; i++){
	CLRF       print_i_L0+0
L_print17:
	MOVLW      15
	SUBWF      print_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print18
;LCD_Modo_4bits.c,155 :: 		lcd_texto(texto[i]);
	MOVF       print_i_L0+0, 0
	ADDWF      FARG_print_texto+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_lcd_texto_letra+0
	CALL       _lcd_texto+0
;LCD_Modo_4bits.c,154 :: 		for(i = 0; i < 15; i++){
	INCF       print_i_L0+0, 1
;LCD_Modo_4bits.c,156 :: 		}
	GOTO       L_print17
L_print18:
;LCD_Modo_4bits.c,157 :: 		}
	RETURN
; end of _print

_lcd_comando:

;LCD_Modo_4bits.c,159 :: 		void lcd_comando(char comando){
;LCD_Modo_4bits.c,160 :: 		RS = 0;
	BCF        PORTE+0, 2
;LCD_Modo_4bits.c,161 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_lcd_comando20:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_comando20
	DECFSZ     R12+0, 1
	GOTO       L_lcd_comando20
	NOP
;LCD_Modo_4bits.c,162 :: 		lcd_nibble(comando>>4);
	MOVF       FARG_lcd_comando_comando+0, 0
	MOVWF      FARG_lcd_nibble_dado+0
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	RRF        FARG_lcd_nibble_dado+0, 1
	BCF        FARG_lcd_nibble_dado+0, 7
	CALL       _lcd_nibble+0
;LCD_Modo_4bits.c,163 :: 		lcd_nibble(comando&0x0F);
	MOVLW      15
	ANDWF      FARG_lcd_comando_comando+0, 0
	MOVWF      FARG_lcd_nibble_dado+0
	CALL       _lcd_nibble+0
;LCD_Modo_4bits.c,164 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_lcd_comando21:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_comando21
	DECFSZ     R12+0, 1
	GOTO       L_lcd_comando21
	NOP
;LCD_Modo_4bits.c,165 :: 		}
	RETURN
; end of _lcd_comando

_IntToChar:

;LCD_Modo_4bits.c,167 :: 		char IntToChar(int numero){
;LCD_Modo_4bits.c,171 :: 		resultado[4] = 0;
	CLRF       IntToChar_resultado_L0+4
;LCD_Modo_4bits.c,173 :: 		valor = numero/100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_IntToChar_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_IntToChar_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;LCD_Modo_4bits.c,174 :: 		resultado[3] = valor+'0';
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      IntToChar_resultado_L0+3
;LCD_Modo_4bits.c,176 :: 		valor = numero/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_IntToChar_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_IntToChar_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;LCD_Modo_4bits.c,178 :: 		resultado[2] = valor+'0';
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      IntToChar_resultado_L0+2
;LCD_Modo_4bits.c,182 :: 		resultado[1] = valor+'0';
	MOVLW      48
	ADDWF      FARG_IntToChar_numero+0, 0
	MOVWF      IntToChar_resultado_L0+1
;LCD_Modo_4bits.c,184 :: 		return resultado;
	MOVLW      IntToChar_resultado_L0+0
	MOVWF      R0+0
;LCD_Modo_4bits.c,186 :: 		}
	RETURN
; end of _IntToChar
