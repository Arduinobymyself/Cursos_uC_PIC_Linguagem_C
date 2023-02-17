
_main:

;16f84a_display7seg_multiplexados.c,28 :: 		void main() {
;16f84a_display7seg_multiplexados.c,30 :: 		TRISA = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;16f84a_display7seg_multiplexados.c,31 :: 		PORTA = 0b00000011;
	MOVLW      3
	MOVWF      PORTA+0
;16f84a_display7seg_multiplexados.c,32 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;16f84a_display7seg_multiplexados.c,33 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;16f84a_display7seg_multiplexados.c,35 :: 		while(1){
L_main0:
;16f84a_display7seg_multiplexados.c,37 :: 		changeCount();
	CALL       _changeCount+0
;16f84a_display7seg_multiplexados.c,38 :: 		display(cnt);
	MOVF       _cnt+0, 0
	MOVWF      FARG_display_num+0
	MOVF       _cnt+1, 0
	MOVWF      FARG_display_num+1
	CALL       _display+0
;16f84a_display7seg_multiplexados.c,40 :: 		}
	GOTO       L_main0
;16f84a_display7seg_multiplexados.c,42 :: 		}
	GOTO       $+0
; end of _main

_display:

;16f84a_display7seg_multiplexados.c,44 :: 		void display(int num){
;16f84a_display7seg_multiplexados.c,46 :: 		PORTB = digitosCA[num/10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _digitosCA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;16f84a_display7seg_multiplexados.c,47 :: 		L1 = 0;
	BCF        RA2_bit+0, 2
;16f84a_display7seg_multiplexados.c,48 :: 		delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_display2:
	DECFSZ     R13+0, 1
	GOTO       L_display2
	DECFSZ     R12+0, 1
	GOTO       L_display2
;16f84a_display7seg_multiplexados.c,49 :: 		L1 = 1;
	BSF        RA2_bit+0, 2
;16f84a_display7seg_multiplexados.c,51 :: 		PORTB = digitosCA[num%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _digitosCA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;16f84a_display7seg_multiplexados.c,52 :: 		L2 = 0;
	BCF        RA3_bit+0, 3
;16f84a_display7seg_multiplexados.c,53 :: 		delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_display3:
	DECFSZ     R13+0, 1
	GOTO       L_display3
	DECFSZ     R12+0, 1
	GOTO       L_display3
;16f84a_display7seg_multiplexados.c,54 :: 		L2 = 1;
	BSF        RA3_bit+0, 3
;16f84a_display7seg_multiplexados.c,56 :: 		}
	RETURN
; end of _display

_changeCount:

;16f84a_display7seg_multiplexados.c,58 :: 		void changeCount()
;16f84a_display7seg_multiplexados.c,60 :: 		while(S1){                // botão MAIS pressionado
L_changeCount4:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_changeCount5
;16f84a_display7seg_multiplexados.c,61 :: 		cnt += 1;                // incremento
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;16f84a_display7seg_multiplexados.c,62 :: 		delay_ms(200);           // debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_changeCount6:
	DECFSZ     R13+0, 1
	GOTO       L_changeCount6
	DECFSZ     R12+0, 1
	GOTO       L_changeCount6
	DECFSZ     R11+0, 1
	GOTO       L_changeCount6
	NOP
;16f84a_display7seg_multiplexados.c,63 :: 		if(cnt > 99) cnt = 99;   // chegou em 99 não incrementa mais
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeCount12
	MOVF       _cnt+0, 0
	SUBLW      99
L__changeCount12:
	BTFSC      STATUS+0, 0
	GOTO       L_changeCount7
	MOVLW      99
	MOVWF      _cnt+0
	MOVLW      0
	MOVWF      _cnt+1
L_changeCount7:
;16f84a_display7seg_multiplexados.c,64 :: 		}
	GOTO       L_changeCount4
L_changeCount5:
;16f84a_display7seg_multiplexados.c,66 :: 		while(S2){                // botão MENOS pressionado
L_changeCount8:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_changeCount9
;16f84a_display7seg_multiplexados.c,67 :: 		cnt -= 1;                // decremento
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
;16f84a_display7seg_multiplexados.c,68 :: 		delay_ms(200);           // debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_changeCount10:
	DECFSZ     R13+0, 1
	GOTO       L_changeCount10
	DECFSZ     R12+0, 1
	GOTO       L_changeCount10
	DECFSZ     R11+0, 1
	GOTO       L_changeCount10
	NOP
;16f84a_display7seg_multiplexados.c,69 :: 		if(cnt < 1) cnt = 0;      // chegou em 1 não decrementa mais
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeCount13
	MOVLW      1
	SUBWF      _cnt+0, 0
L__changeCount13:
	BTFSC      STATUS+0, 0
	GOTO       L_changeCount11
	CLRF       _cnt+0
	CLRF       _cnt+1
L_changeCount11:
;16f84a_display7seg_multiplexados.c,70 :: 		}
	GOTO       L_changeCount8
L_changeCount9:
;16f84a_display7seg_multiplexados.c,72 :: 		}
	RETURN
; end of _changeCount
