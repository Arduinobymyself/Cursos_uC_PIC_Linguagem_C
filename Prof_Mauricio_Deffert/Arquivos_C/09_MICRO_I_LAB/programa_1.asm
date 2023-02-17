
_main:

;programa_1.c,7 :: 		void main() {
;programa_1.c,8 :: 		unsigned int tempo = 100;
	MOVLW      100
	MOVWF      main_tempo_L0+0
	MOVLW      0
	MOVWF      main_tempo_L0+1
;programa_1.c,9 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_1.c,10 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;programa_1.c,11 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;programa_1.c,12 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;programa_1.c,14 :: 		while(1){
L_main0:
;programa_1.c,16 :: 		if(!B0) tempo += 100;
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	MOVLW      100
	ADDWF      main_tempo_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_tempo_L0+1, 1
L_main2:
;programa_1.c,17 :: 		if(!B1) tempo -= 100;
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	MOVLW      100
	SUBWF      main_tempo_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_tempo_L0+1, 1
L_main3:
;programa_1.c,18 :: 		if(tempo < 100) tempo = 100;
	MOVLW      0
	SUBWF      main_tempo_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      100
	SUBWF      main_tempo_L0+0, 0
L__main6:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      100
	MOVWF      main_tempo_L0+0
	MOVLW      0
	MOVWF      main_tempo_L0+1
L_main4:
;programa_1.c,19 :: 		if(tempo > 2000) tempo = 2000;
	MOVF       main_tempo_L0+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       main_tempo_L0+0, 0
	SUBLW      208
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVLW      208
	MOVWF      main_tempo_L0+0
	MOVLW      7
	MOVWF      main_tempo_L0+1
L_main5:
;programa_1.c,20 :: 		PORTD.RD0 = ~PORTD.RD0;
	MOVLW      1
	XORWF      PORTD+0, 1
;programa_1.c,21 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;programa_1.c,22 :: 		}
	GOTO       L_main0
;programa_1.c,24 :: 		}
	GOTO       $+0
; end of _main
