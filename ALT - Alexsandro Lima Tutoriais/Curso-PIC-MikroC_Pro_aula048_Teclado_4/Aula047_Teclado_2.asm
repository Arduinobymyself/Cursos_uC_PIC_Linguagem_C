
_main:

;Aula047_Teclado_2.c,28 :: 		void main() {
;Aula047_Teclado_2.c,30 :: 		ADCON1 = 0xFF;
	MOVLW       255
	MOVWF       ADCON1+0 
;Aula047_Teclado_2.c,31 :: 		TRISB = 0xF0;
	MOVLW       240
	MOVWF       TRISB+0 
;Aula047_Teclado_2.c,32 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Aula047_Teclado_2.c,33 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;Aula047_Teclado_2.c,34 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;Aula047_Teclado_2.c,36 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Aula047_Teclado_2.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Aula047_Teclado_2.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Aula047_Teclado_2.c,39 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;Aula047_Teclado_2.c,43 :: 		while(1){
L_main0:
;Aula047_Teclado_2.c,44 :: 		tecla = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _tecla+0 
;Aula047_Teclado_2.c,46 :: 		switch(tecla){
	GOTO        L_main2
;Aula047_Teclado_2.c,47 :: 		case 1: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
L_main4:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr1_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,48 :: 		case 2: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
L_main5:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr2_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,49 :: 		case 3: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
L_main6:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr3_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,50 :: 		case 4: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla A"); break;
L_main7:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr4_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,51 :: 		case 5: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 4"); break;
L_main8:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr5_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,52 :: 		case 6: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 5"); break;
L_main9:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr6_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,53 :: 		case 7: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 6"); break;
L_main10:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr7_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,54 :: 		case 8: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla B"); break;
L_main11:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr8_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,55 :: 		case 9: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 7"); break;
L_main12:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr9_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,56 :: 		case 10: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 8"); break;
L_main13:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr10_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr10_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,57 :: 		case 11: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 9"); break;
L_main14:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr11_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr11_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,58 :: 		case 12: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla C"); break;
L_main15:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr12_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr12_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,59 :: 		case 13: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla *"); PORTA.RA0 = 1; break;
L_main16:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr13_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr13_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	BSF         PORTA+0, 0 
	GOTO        L_main3
;Aula047_Teclado_2.c,60 :: 		case 14: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 0"); break;
L_main17:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr14_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr14_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,61 :: 		case 15: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla #"); PORTA.RA0 = 0; break;
L_main18:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr15_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr15_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	BCF         PORTA+0, 0 
	GOTO        L_main3
;Aula047_Teclado_2.c,62 :: 		case 16: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla D"); break;
L_main19:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       ?lstr16_Aula047_Teclado_2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr16_Aula047_Teclado_2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_main3
;Aula047_Teclado_2.c,63 :: 		}
L_main2:
	MOVF        _tecla+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
	MOVF        _tecla+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
	MOVF        _tecla+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVF        _tecla+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVF        _tecla+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _tecla+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        _tecla+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _tecla+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _tecla+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _tecla+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _tecla+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _tecla+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
	MOVF        _tecla+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _tecla+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
	MOVF        _tecla+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _tecla+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
L_main3:
;Aula047_Teclado_2.c,66 :: 		}
	GOTO        L_main0
;Aula047_Teclado_2.c,68 :: 		}
	GOTO        $+0
; end of _main
