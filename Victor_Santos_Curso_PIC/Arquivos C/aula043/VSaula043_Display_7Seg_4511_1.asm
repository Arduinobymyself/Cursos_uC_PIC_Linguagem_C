
_main:

;VSaula043_Display_7Seg_4511_1.c,17 :: 		void main() {
;VSaula043_Display_7Seg_4511_1.c,19 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula043_Display_7Seg_4511_1.c,20 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula043_Display_7Seg_4511_1.c,23 :: 		while(1){
L_main0:
;VSaula043_Display_7Seg_4511_1.c,24 :: 		for(i=0; i < 9; i++){
	CLRF       _i+0
L_main2:
	MOVLW      9
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;VSaula043_Display_7Seg_4511_1.c,26 :: 		PORTD = Dec2Bcd(i); // solução mais elegante!!
	MOVF       _i+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;VSaula043_Display_7Seg_4511_1.c,27 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;VSaula043_Display_7Seg_4511_1.c,24 :: 		for(i=0; i < 9; i++){
	INCF       _i+0, 1
;VSaula043_Display_7Seg_4511_1.c,28 :: 		}
	GOTO       L_main2
L_main3:
;VSaula043_Display_7Seg_4511_1.c,29 :: 		}
	GOTO       L_main0
;VSaula043_Display_7Seg_4511_1.c,32 :: 		}
	GOTO       $+0
; end of _main

_display:

;VSaula043_Display_7Seg_4511_1.c,35 :: 		unsigned char display(char num){
;VSaula043_Display_7Seg_4511_1.c,36 :: 		switch(num){
	GOTO       L_display6
;VSaula043_Display_7Seg_4511_1.c,37 :: 		case 0: return Dec2Bcd(0);
L_display8:
	CLRF       FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,38 :: 		case 1: return Dec2Bcd(1);
L_display9:
	MOVLW      1
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,39 :: 		case 2: return Dec2Bcd(2);
L_display10:
	MOVLW      2
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,40 :: 		case 3: return Dec2Bcd(3);
L_display11:
	MOVLW      3
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,41 :: 		case 4: return Dec2Bcd(4);
L_display12:
	MOVLW      4
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,42 :: 		case 5: return Dec2Bcd(5);
L_display13:
	MOVLW      5
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,43 :: 		case 6: return Dec2Bcd(6);
L_display14:
	MOVLW      6
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,44 :: 		case 7: return Dec2Bcd(7);
L_display15:
	MOVLW      7
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,45 :: 		case 8: return Dec2Bcd(8);
L_display16:
	MOVLW      8
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,46 :: 		case 9: return Dec2Bcd(9);
L_display17:
	MOVLW      9
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	RETURN
;VSaula043_Display_7Seg_4511_1.c,47 :: 		}
L_display6:
	MOVF       FARG_display_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_display8
	MOVF       FARG_display_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display9
	MOVF       FARG_display_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display10
	MOVF       FARG_display_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display11
	MOVF       FARG_display_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display12
	MOVF       FARG_display_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_display13
	MOVF       FARG_display_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_display14
	MOVF       FARG_display_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_display15
	MOVF       FARG_display_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_display16
	MOVF       FARG_display_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_display17
;VSaula043_Display_7Seg_4511_1.c,48 :: 		}
	RETURN
; end of _display
