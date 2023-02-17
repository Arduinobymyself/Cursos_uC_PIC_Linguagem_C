
_main:

;VSaula020.c,58 :: 		void main() {
;VSaula020.c,59 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula020.c,60 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula020.c,61 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula020.c,62 :: 		TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1
	MOVLW      3
	MOVWF      TRISB+0
;VSaula020.c,64 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula020.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula020.c,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula020.c,67 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula020.c,69 :: 		escreve_lcd();
	CALL       _escreve_lcd+0
;VSaula020.c,70 :: 		delay_ms(2000);
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
;VSaula020.c,72 :: 		while(1){
L_main1:
;VSaula020.c,74 :: 		if(!B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main5
L__main10:
;VSaula020.c,75 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;VSaula020.c,76 :: 		}
L_main5:
;VSaula020.c,77 :: 		if(B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main8
L__main9:
;VSaula020.c,78 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;VSaula020.c,79 :: 		inverte_led();
	CALL       _inverte_led+0
;VSaula020.c,80 :: 		cont++;
	INCF       _cont+0, 1
;VSaula020.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula020.c,82 :: 		ByteToStrWithZeros(cont, texto3);
	MOVF       _cont+0, 0
	MOVWF      FARG_ByteToStrWithZeros_input+0
	MOVLW      _texto3+0
	MOVWF      FARG_ByteToStrWithZeros_output+0
	CALL       _ByteToStrWithZeros+0
;VSaula020.c,83 :: 		Lcd_Out(2, 1, "B0 = ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula020+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula020.c,84 :: 		Lcd_Out(2, 6, texto3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula020.c,85 :: 		}
L_main8:
;VSaula020.c,87 :: 		}
	GOTO       L_main1
;VSaula020.c,89 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_inverte_led:

;VSaula020.c,92 :: 		void inverte_led(){
;VSaula020.c,93 :: 		L0 = ~L0;
	MOVLW
	XORWF      RD0_bit+0, 1
;VSaula020.c,94 :: 		}
L_end_inverte_led:
	RETURN
; end of _inverte_led

_escreve_lcd:

;VSaula020.c,96 :: 		void escreve_lcd(){
;VSaula020.c,97 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula020.c,98 :: 		Lcd_Out(2, 1, texto2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula020.c,99 :: 		}
L_end_escreve_lcd:
	RETURN
; end of _escreve_lcd
