
_main:

;VSaula060_TecladoMatricial.c,60 :: 		void main() {
;VSaula060_TecladoMatricial.c,62 :: 		cnt = 0;                                 // Reset counter
	CLRF       _cnt+0
;VSaula060_TecladoMatricial.c,67 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;VSaula060_TecladoMatricial.c,69 :: 		Lcd_Init();                              // Initialize LCD
	CALL       _Lcd_Init+0
;VSaula060_TecladoMatricial.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula060_TecladoMatricial.c,71 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula060_TecladoMatricial.c,73 :: 		Lcd_Out(1, 1, "1");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula060_TecladoMatricial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula060_TecladoMatricial.c,74 :: 		Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula060_TecladoMatricial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula060_TecladoMatricial.c,75 :: 		Lcd_Out(2, 1, "Times:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_VSaula060_TecladoMatricial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula060_TecladoMatricial.c,80 :: 		TRISB = 0;
	CLRF       TRISB+0
;VSaula060_TecladoMatricial.c,81 :: 		PORTB = 0;
	CLRF       PORTB+0
;VSaula060_TecladoMatricial.c,82 :: 		TRISD = 0b00001111;
	MOVLW      15
	MOVWF      TRISD+0
;VSaula060_TecladoMatricial.c,83 :: 		PORTD = 0b00001111;
	MOVLW      15
	MOVWF      PORTD+0
;VSaula060_TecladoMatricial.c,88 :: 		do {
L_main0:
;VSaula060_TecladoMatricial.c,89 :: 		kp = 0;                                // Reset key code variable
	CLRF       _kp+0
;VSaula060_TecladoMatricial.c,92 :: 		do
L_main3:
;VSaula060_TecladoMatricial.c,94 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable - trava até que tire o dedo
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;VSaula060_TecladoMatricial.c,95 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;VSaula060_TecladoMatricial.c,97 :: 		RC0_bit = 1;
	BSF        RC0_bit+0, 0
;VSaula060_TecladoMatricial.c,98 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;VSaula060_TecladoMatricial.c,99 :: 		RC0_bit = 0;
	BCF        RC0_bit+0, 0
;VSaula060_TecladoMatricial.c,102 :: 		switch (kp) {
	GOTO       L_main7
;VSaula060_TecladoMatricial.c,108 :: 		case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_main9:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,109 :: 		case  2: kp = 50; break; // 2
L_main10:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,110 :: 		case  3: kp = 51; break; // 3
L_main11:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,111 :: 		case  4: kp = 65; break; // A
L_main12:
	MOVLW      65
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,112 :: 		case  5: kp = 52; break; // 4
L_main13:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,113 :: 		case  6: kp = 53; break; // 5
L_main14:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,114 :: 		case  7: kp = 54; break; // 6
L_main15:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,115 :: 		case  8: kp = 66; break; // B
L_main16:
	MOVLW      66
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,116 :: 		case  9: kp = 55; break; // 7
L_main17:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,117 :: 		case 10: kp = 56; break; // 8
L_main18:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,118 :: 		case 11: kp = 57; break; // 9
L_main19:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,119 :: 		case 12: kp = 67; break; // C
L_main20:
	MOVLW      67
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,120 :: 		case 13: kp = 42; break; // *
L_main21:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,121 :: 		case 14: kp = 48; break; // 0
L_main22:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,122 :: 		case 15: kp = 35; break; // #
L_main23:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,123 :: 		case 16: kp = 68; break; // D
L_main24:
	MOVLW      68
	MOVWF      _kp+0
	GOTO       L_main8
;VSaula060_TecladoMatricial.c,125 :: 		}
L_main7:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main24
L_main8:
;VSaula060_TecladoMatricial.c,127 :: 		if (kp != oldstate) {                  // Pressed key differs from previous
	MOVF       _kp+0, 0
	XORWF      _oldstate+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
;VSaula060_TecladoMatricial.c,128 :: 		cnt = 1;
	MOVLW      1
	MOVWF      _cnt+0
;VSaula060_TecladoMatricial.c,129 :: 		oldstate = kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;VSaula060_TecladoMatricial.c,130 :: 		}
	GOTO       L_main26
L_main25:
;VSaula060_TecladoMatricial.c,132 :: 		cnt++;
	INCF       _cnt+0, 1
;VSaula060_TecladoMatricial.c,133 :: 		}
L_main26:
;VSaula060_TecladoMatricial.c,135 :: 		Lcd_Chr(1, 8, ltrim(kp));                    // Print key ASCII value on LCD
	MOVF       _kp+0, 0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;VSaula060_TecladoMatricial.c,137 :: 		if (cnt == 255) {                      // If counter varialble overflow
	MOVF       _cnt+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;VSaula060_TecladoMatricial.c,138 :: 		cnt = 0;
	CLRF       _cnt+0
;VSaula060_TecladoMatricial.c,139 :: 		Lcd_Out(2, 8, "         ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_VSaula060_TecladoMatricial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula060_TecladoMatricial.c,140 :: 		}
L_main27:
;VSaula060_TecladoMatricial.c,142 :: 		WordToStr(cnt, txt);                   // Transform counter value to string
	MOVF       _cnt+0, 0
	MOVWF      FARG_WordToStr_input+0
	CLRF       FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VSaula060_TecladoMatricial.c,143 :: 		Lcd_Out(2, 8, ltrim(txt));                   // Display counter value on LCD
	MOVLW      _txt+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;VSaula060_TecladoMatricial.c,144 :: 		} while (1); //Final do Loop
	GOTO       L_main0
;VSaula060_TecladoMatricial.c,146 :: 		}//Final da main()
	GOTO       $+0
; end of _main
