
_lcdr:

;Teste_TecladoMatricial.c,30 :: 		void lcdr(char a[5]){
;Teste_TecladoMatricial.c,31 :: 		TRISD = 0;
	CLRF       TRISD+0
;Teste_TecladoMatricial.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teste_TecladoMatricial.c,33 :: 		LCD_Out_CP(a);
	MOVF       FARG_lcdr_a+0, 0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Teste_TecladoMatricial.c,34 :: 		TRISD = 255;
	MOVLW      255
	MOVWF      TRISD+0
;Teste_TecladoMatricial.c,35 :: 		}
	RETURN
; end of _lcdr

_main:

;Teste_TecladoMatricial.c,37 :: 		void main() {
;Teste_TecladoMatricial.c,40 :: 		ADCON1 = 0x15; //define pinos AD como I/O de uso geral
	MOVLW      21
	MOVWF      ADCON1+0
;Teste_TecladoMatricial.c,41 :: 		TRISE = 0;
	CLRF       TRISE+0
;Teste_TecladoMatricial.c,42 :: 		TRISD = 0;
	CLRF       TRISD+0
;Teste_TecladoMatricial.c,44 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Teste_TecladoMatricial.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teste_TecladoMatricial.c,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teste_TecladoMatricial.c,47 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;Teste_TecladoMatricial.c,48 :: 		TRISD = 255;
	MOVLW      255
	MOVWF      TRISD+0
;Teste_TecladoMatricial.c,49 :: 		PORTB = 255; //portb em FF
	MOVLW      255
	MOVWF      PORTB+0
;Teste_TecladoMatricial.c,50 :: 		PORTD = 255; //portd em FF
	MOVLW      255
	MOVWF      PORTD+0
;Teste_TecladoMatricial.c,51 :: 		TRISD = 255; //configura portd como entrada
	MOVLW      255
	MOVWF      TRISD+0
;Teste_TecladoMatricial.c,52 :: 		TRISB = 0;   //configura portb como saida
	CLRF       TRISB+0
;Teste_TecladoMatricial.c,59 :: 		do {
L_main1:
;Teste_TecladoMatricial.c,61 :: 		PORTB.RB0 = 0; //habilita primeira coluna do teclado
	BCF        PORTB+0, 0
;Teste_TecladoMatricial.c,62 :: 		var2 = PORTD;
	MOVF       PORTD+0, 0
	MOVWF      main_var2_L0+0
;Teste_TecladoMatricial.c,63 :: 		if (var2.f0 == 0) lcdr("<--");
	BTFSC      main_var2_L0+0, 0
	GOTO       L_main4
	MOVLW      ?lstr1_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main5
L_main4:
;Teste_TecladoMatricial.c,64 :: 		else if (var2.f1 == 0) lcdr("7");
	BTFSC      main_var2_L0+0, 1
	GOTO       L_main6
	MOVLW      ?lstr2_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main7
L_main6:
;Teste_TecladoMatricial.c,65 :: 		else if (var2.f2 == 0) lcdr("4");
	BTFSC      main_var2_L0+0, 2
	GOTO       L_main8
	MOVLW      ?lstr3_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main9
L_main8:
;Teste_TecladoMatricial.c,66 :: 		else if (var2.f3 == 0) lcdr("1");
	BTFSC      main_var2_L0+0, 3
	GOTO       L_main10
	MOVLW      ?lstr4_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
L_main10:
L_main9:
L_main7:
L_main5:
;Teste_TecladoMatricial.c,67 :: 		PORTB.RB0 = 1; //desabilita primeira coluna do teclado
	BSF        PORTB+0, 0
;Teste_TecladoMatricial.c,69 :: 		PORTB.RB1 = 0; //habilita segunda coluna do teclado
	BCF        PORTB+0, 1
;Teste_TecladoMatricial.c,70 :: 		var2 = PORTD;
	MOVF       PORTD+0, 0
	MOVWF      main_var2_L0+0
;Teste_TecladoMatricial.c,71 :: 		if (var2.f0 == 0) lcdr("0");
	BTFSC      main_var2_L0+0, 0
	GOTO       L_main11
	MOVLW      ?lstr5_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main12
L_main11:
;Teste_TecladoMatricial.c,72 :: 		else if (var2.f1 == 0) lcdr("8");
	BTFSC      main_var2_L0+0, 1
	GOTO       L_main13
	MOVLW      ?lstr6_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main14
L_main13:
;Teste_TecladoMatricial.c,73 :: 		else if (var2.f2 == 0) lcdr("5");
	BTFSC      main_var2_L0+0, 2
	GOTO       L_main15
	MOVLW      ?lstr7_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main16
L_main15:
;Teste_TecladoMatricial.c,74 :: 		else if (var2.f3 == 0) lcdr("2");
	BTFSC      main_var2_L0+0, 3
	GOTO       L_main17
	MOVLW      ?lstr8_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
L_main17:
L_main16:
L_main14:
L_main12:
;Teste_TecladoMatricial.c,75 :: 		PORTB.RB1 = 1; //desabilita segunda coluna do teclado
	BSF        PORTB+0, 1
;Teste_TecladoMatricial.c,77 :: 		PORTB.RB2 = 0; //habilita terceira coluna do teclado
	BCF        PORTB+0, 2
;Teste_TecladoMatricial.c,78 :: 		var2 = PORTD;
	MOVF       PORTD+0, 0
	MOVWF      main_var2_L0+0
;Teste_TecladoMatricial.c,79 :: 		if (var2.f0 == 0) lcdr("-->");
	BTFSC      main_var2_L0+0, 0
	GOTO       L_main18
	MOVLW      ?lstr9_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main19
L_main18:
;Teste_TecladoMatricial.c,80 :: 		else if (var2.f1 == 0) lcdr("9");
	BTFSC      main_var2_L0+0, 1
	GOTO       L_main20
	MOVLW      ?lstr10_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main21
L_main20:
;Teste_TecladoMatricial.c,81 :: 		else if (var2.f2 == 0) lcdr("6");
	BTFSC      main_var2_L0+0, 2
	GOTO       L_main22
	MOVLW      ?lstr11_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
	GOTO       L_main23
L_main22:
;Teste_TecladoMatricial.c,82 :: 		else if (var2.f3 == 0) lcdr("3");
	BTFSC      main_var2_L0+0, 3
	GOTO       L_main24
	MOVLW      ?lstr12_Teste_TecladoMatricial+0
	MOVWF      FARG_lcdr_a+0
	CALL       _lcdr+0
L_main24:
L_main23:
L_main21:
L_main19:
;Teste_TecladoMatricial.c,83 :: 		PORTB.RB2 = 1; //desabilita terceira coluna do teclado
	BSF        PORTB+0, 2
;Teste_TecladoMatricial.c,84 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
;Teste_TecladoMatricial.c,86 :: 		} while(1);
	GOTO       L_main1
;Teste_TecladoMatricial.c,88 :: 		}
	GOTO       $+0
; end of _main
