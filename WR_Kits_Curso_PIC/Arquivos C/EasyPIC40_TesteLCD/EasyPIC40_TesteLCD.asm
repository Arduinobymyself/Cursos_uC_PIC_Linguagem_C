
_CustomChar:

;EasyPIC40_TesteLCD.c,20 :: 		void CustomChar(char pos_row, char pos_char) {
;EasyPIC40_TesteLCD.c,22 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,23 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
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
	GOTO       L_CustomChar0
L_CustomChar1:
;EasyPIC40_TesteLCD.c,24 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,25 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EasyPIC40_TesteLCD.c,26 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_main:

;EasyPIC40_TesteLCD.c,31 :: 		void main() {
;EasyPIC40_TesteLCD.c,32 :: 		ADCON0 = 0b00000001;
	MOVLW      1
	MOVWF      ADCON0+0
;EasyPIC40_TesteLCD.c,33 :: 		ADCON1 = 0b00001110;             // todos os pinos como digital
	MOVLW      14
	MOVWF      ADCON1+0
;EasyPIC40_TesteLCD.c,35 :: 		TRISA = 0b00000000;               // PORT A como saída
	CLRF       TRISA+0
;EasyPIC40_TesteLCD.c,36 :: 		PORTA = 0b00000000;               // PORT A incia em low
	CLRF       PORTA+0
;EasyPIC40_TesteLCD.c,37 :: 		TRISD = 0b00000100;               // PORT D como saída
	MOVLW      4
	MOVWF      TRISD+0
;EasyPIC40_TesteLCD.c,38 :: 		PORTD = 0b00000001;               // PORT D  inicia em low
	MOVLW      1
	MOVWF      PORTD+0
;EasyPIC40_TesteLCD.c,40 :: 		Lcd_Init();                       // inicializa o LCD
	CALL       _Lcd_Init+0
;EasyPIC40_TesteLCD.c,41 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);         // desliga cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);              // limpa LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,44 :: 		while(1){
L_main3:
;EasyPIC40_TesteLCD.c,45 :: 		Lcd_Out(1, 1, "  ABMS Telecom  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EasyPIC40_TesteLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EasyPIC40_TesteLCD.c,46 :: 		Lcd_Out(2, 1, "      IOT       ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EasyPIC40_TesteLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EasyPIC40_TesteLCD.c,47 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;EasyPIC40_TesteLCD.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,49 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EasyPIC40_TesteLCD.c,50 :: 		Lcd_Out(1, 1, "Bem vindo!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EasyPIC40_TesteLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EasyPIC40_TesteLCD.c,51 :: 		CustomChar(1, 12);
	MOVLW      1
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      12
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;EasyPIC40_TesteLCD.c,52 :: 		Lcd_Chr_Cp(teste + 48);
	MOVLW      48
	ADDWF      _teste+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;EasyPIC40_TesteLCD.c,53 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;EasyPIC40_TesteLCD.c,54 :: 		}
	GOTO       L_main3
;EasyPIC40_TesteLCD.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
