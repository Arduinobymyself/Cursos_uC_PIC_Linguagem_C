
_main:

;VSaula016.c,64 :: 		void main() {
;VSaula016.c,65 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula016.c,66 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula016.c,67 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula016.c,68 :: 		TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1
	MOVLW      3
	MOVWF      TRISB+0
;VSaula016.c,70 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula016.c,71 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula016.c,74 :: 		Lcd_Out(1, 1, texto1); // texto1 = "ABMS Telecom"
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula016.c,76 :: 		while(1){
L_main0:
;VSaula016.c,88 :: 		if(!B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main13:
;VSaula016.c,89 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;VSaula016.c,91 :: 		}
L_main4:
;VSaula016.c,92 :: 		if(B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main12:
;VSaula016.c,93 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;VSaula016.c,94 :: 		contB0++;
	INCF       _contB0+0, 1
;VSaula016.c,95 :: 		}
L_main7:
;VSaula016.c,98 :: 		switch(contB0){
	GOTO       L_main8
;VSaula016.c,99 :: 		case 1: L0 = 1; Lcd_Out(2, 1, texto2); break; // texto2 = "Led0 Aceso"
L_main10:
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main9
;VSaula016.c,100 :: 		case 2: L0 = 0; Lcd_Out(2, 1, texto3); contB0 = 0; break; // texto3 = "Led0 Apagado"
L_main11:
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _contB0+0
	GOTO       L_main9
;VSaula016.c,101 :: 		}
L_main8:
	MOVF       _contB0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _contB0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main9:
;VSaula016.c,104 :: 		}
	GOTO       L_main0
;VSaula016.c,106 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
