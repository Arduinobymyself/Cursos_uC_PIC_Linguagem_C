
_config_mcu:

;LCD_Modo_8bits.c,13 :: 		void config_mcu(){
;LCD_Modo_8bits.c,14 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;LCD_Modo_8bits.c,15 :: 		TRISD = 0;
	CLRF       TRISD+0
;LCD_Modo_8bits.c,16 :: 		TRISE = 0;
	CLRF       TRISE+0
;LCD_Modo_8bits.c,17 :: 		}
	RETURN
; end of _config_mcu

_pulse_en:

;LCD_Modo_8bits.c,19 :: 		void pulse_en(){
;LCD_Modo_8bits.c,20 :: 		EN = 0;
	BCF        PORTE+0, 1
;LCD_Modo_8bits.c,21 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en0:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en0
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en0
	NOP
	NOP
;LCD_Modo_8bits.c,22 :: 		EN = 1;
	BSF        PORTE+0, 1
;LCD_Modo_8bits.c,23 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en1:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en1
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en1
	NOP
	NOP
;LCD_Modo_8bits.c,24 :: 		EN = 0;
	BCF        PORTE+0, 1
;LCD_Modo_8bits.c,25 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pulse_en2:
	DECFSZ     R13+0, 1
	GOTO       L_pulse_en2
	DECFSZ     R12+0, 1
	GOTO       L_pulse_en2
	NOP
	NOP
;LCD_Modo_8bits.c,26 :: 		}
	RETURN
; end of _pulse_en

_inicializa_lcd:

;LCD_Modo_8bits.c,28 :: 		void inicializa_lcd(){
;LCD_Modo_8bits.c,29 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_inicializa_lcd3:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd3
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd3
	NOP
;LCD_Modo_8bits.c,30 :: 		RS = 0;
	BCF        PORTE+0, 2
;LCD_Modo_8bits.c,32 :: 		PORTD = 0x38;       // seleção matraiz 5x7 e modo 8 bits
	MOVLW      56
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,33 :: 		pulse_en();         // envia comando
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,34 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd4:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd4
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd4
;LCD_Modo_8bits.c,36 :: 		PORTD = 0x38;       // seleção matraiz 5x7 e modo 8 bits
	MOVLW      56
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,37 :: 		pulse_en();         // envia comando
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,38 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd5:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd5
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd5
;LCD_Modo_8bits.c,40 :: 		PORTD = 0x06;       // sentido de deslocamento cursor para a direita
	MOVLW      6
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,41 :: 		pulse_en();         // envia comando
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,42 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd6:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd6
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd6
;LCD_Modo_8bits.c,44 :: 		PORTD = 0x0C;       // cursor desativado 0x0C, ativado 0x0E
	MOVLW      12
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,45 :: 		pulse_en();         // envia comando
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,46 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd7:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd7
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd7
;LCD_Modo_8bits.c,48 :: 		PORTD = 0x01;       // limpa e vai para home
	MOVLW      1
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,49 :: 		pulse_en();         // envia comando
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,50 :: 		delay_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_inicializa_lcd8:
	DECFSZ     R13+0, 1
	GOTO       L_inicializa_lcd8
	DECFSZ     R12+0, 1
	GOTO       L_inicializa_lcd8
;LCD_Modo_8bits.c,52 :: 		}
	RETURN
; end of _inicializa_lcd

_lcd_texto:

;LCD_Modo_8bits.c,54 :: 		void lcd_texto(char letra){
;LCD_Modo_8bits.c,55 :: 		RS = 1;
	BSF        PORTE+0, 2
;LCD_Modo_8bits.c,56 :: 		PORTD = letra;
	MOVF       FARG_lcd_texto_letra+0, 0
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,57 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,58 :: 		}
	RETURN
; end of _lcd_texto

_print:

;LCD_Modo_8bits.c,60 :: 		void print(char texto[16]){
;LCD_Modo_8bits.c,62 :: 		for(i = 0; i < 15; i++){
	CLRF       print_i_L0+0
L_print9:
	MOVLW      15
	SUBWF      print_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print10
;LCD_Modo_8bits.c,63 :: 		lcd_texto(texto[i]);
	MOVF       print_i_L0+0, 0
	ADDWF      FARG_print_texto+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_lcd_texto_letra+0
	CALL       _lcd_texto+0
;LCD_Modo_8bits.c,62 :: 		for(i = 0; i < 15; i++){
	INCF       print_i_L0+0, 1
;LCD_Modo_8bits.c,64 :: 		}
	GOTO       L_print9
L_print10:
;LCD_Modo_8bits.c,65 :: 		}
	RETURN
; end of _print

_lcd_comando:

;LCD_Modo_8bits.c,67 :: 		void lcd_comando(int comando){
;LCD_Modo_8bits.c,68 :: 		RS = 0;
	BCF        PORTE+0, 2
;LCD_Modo_8bits.c,69 :: 		PORTD = comando;
	MOVF       FARG_lcd_comando_comando+0, 0
	MOVWF      PORTD+0
;LCD_Modo_8bits.c,70 :: 		pulse_en();
	CALL       _pulse_en+0
;LCD_Modo_8bits.c,71 :: 		}
	RETURN
; end of _lcd_comando

_main:

;LCD_Modo_8bits.c,73 :: 		void main() {
;LCD_Modo_8bits.c,74 :: 		config_mcu();
	CALL       _config_mcu+0
;LCD_Modo_8bits.c,75 :: 		inicializa_lcd();
	CALL       _inicializa_lcd+0
;LCD_Modo_8bits.c,98 :: 		while(1){
L_main12:
;LCD_Modo_8bits.c,100 :: 		lcd_comando(linha_1);
	MOVLW      128
	MOVWF      FARG_lcd_comando_comando+0
	CLRF       FARG_lcd_comando_comando+1
	CALL       _lcd_comando+0
;LCD_Modo_8bits.c,101 :: 		print("  ABMS Telecom  ");
	MOVLW      ?lstr1_LCD_Modo_8bits+0
	MOVWF      FARG_print_texto+0
	CALL       _print+0
;LCD_Modo_8bits.c,102 :: 		lcd_comando(linha_2);
	MOVLW      192
	MOVWF      FARG_lcd_comando_comando+0
	CLRF       FARG_lcd_comando_comando+1
	CALL       _lcd_comando+0
;LCD_Modo_8bits.c,103 :: 		print(" Seja Bem Vindo!");
	MOVLW      ?lstr2_LCD_Modo_8bits+0
	MOVWF      FARG_print_texto+0
	CALL       _print+0
;LCD_Modo_8bits.c,104 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;LCD_Modo_8bits.c,105 :: 		lcd_comando(limpaLCD);
	MOVLW      1
	MOVWF      FARG_lcd_comando_comando+0
	MOVLW      0
	MOVWF      FARG_lcd_comando_comando+1
	CALL       _lcd_comando+0
;LCD_Modo_8bits.c,106 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;LCD_Modo_8bits.c,107 :: 		}
	GOTO       L_main12
;LCD_Modo_8bits.c,111 :: 		}
	GOTO       $+0
; end of _main
