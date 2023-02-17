
_main:

;VSaula042_Display_7Seg_P1.c,17 :: 		void main() {
;VSaula042_Display_7Seg_P1.c,19 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula042_Display_7Seg_P1.c,20 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula042_Display_7Seg_P1.c,23 :: 		while(1){
L_main0:
;VSaula042_Display_7Seg_P1.c,24 :: 		for(i=0; i < 9; i++){
	CLRF       _i+0
L_main2:
	MOVLW      9
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;VSaula042_Display_7Seg_P1.c,26 :: 		PORTD = pattern[i]; // solução mais elegante!!
	MOVF       _i+0, 0
	ADDLW      _pattern+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;VSaula042_Display_7Seg_P1.c,27 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;VSaula042_Display_7Seg_P1.c,24 :: 		for(i=0; i < 9; i++){
	INCF       _i+0, 1
;VSaula042_Display_7Seg_P1.c,28 :: 		}
	GOTO       L_main2
L_main3:
;VSaula042_Display_7Seg_P1.c,29 :: 		}
	GOTO       L_main0
;VSaula042_Display_7Seg_P1.c,32 :: 		}
	GOTO       $+0
; end of _main

_display:

;VSaula042_Display_7Seg_P1.c,35 :: 		unsigned char display(char num){
;VSaula042_Display_7Seg_P1.c,36 :: 		switch(num){
	GOTO       L_display6
;VSaula042_Display_7Seg_P1.c,37 :: 		case 1: return 0x06;
L_display8:
	MOVLW      6
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,38 :: 		case 2: return 0x5B;
L_display9:
	MOVLW      91
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,39 :: 		case 3: return 0x4F;
L_display10:
	MOVLW      79
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,40 :: 		case 4: return 0x66;
L_display11:
	MOVLW      102
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,41 :: 		case 5: return 0x6D;
L_display12:
	MOVLW      109
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,42 :: 		case 6: return 0x7D;
L_display13:
	MOVLW      125
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,43 :: 		case 7: return 0x07;
L_display14:
	MOVLW      7
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,44 :: 		case 8: return 0x7F;
L_display15:
	MOVLW      127
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,45 :: 		case 9: return 0x6F;
L_display16:
	MOVLW      111
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,46 :: 		case 0: return 0x3F;
L_display17:
	MOVLW      63
	MOVWF      R0+0
	RETURN
;VSaula042_Display_7Seg_P1.c,47 :: 		}
L_display6:
	MOVF       FARG_display_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display8
	MOVF       FARG_display_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display9
	MOVF       FARG_display_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display10
	MOVF       FARG_display_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display11
	MOVF       FARG_display_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_display12
	MOVF       FARG_display_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_display13
	MOVF       FARG_display_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_display14
	MOVF       FARG_display_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_display15
	MOVF       FARG_display_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_display16
	MOVF       FARG_display_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_display17
;VSaula042_Display_7Seg_P1.c,48 :: 		}
	RETURN
; end of _display
