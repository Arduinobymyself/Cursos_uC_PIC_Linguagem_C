
_main:

;Gerador_Sinais.c,39 :: 		void main() {
;Gerador_Sinais.c,41 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Gerador_Sinais.c,42 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;Gerador_Sinais.c,43 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Gerador_Sinais.c,44 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Gerador_Sinais.c,45 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Gerador_Sinais.c,46 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Gerador_Sinais.c,48 :: 		while(1){
L_main0:
;Gerador_Sinais.c,50 :: 		if(B2 && flagB2 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main4
L__main27:
;Gerador_Sinais.c,51 :: 		flagB2 = 1;
	BSF        _flagB2+0, BitPos(_flagB2+0)
;Gerador_Sinais.c,52 :: 		}
L_main4:
;Gerador_Sinais.c,53 :: 		if(!B2 && flagB2 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main7
L__main26:
;Gerador_Sinais.c,54 :: 		flagB2 = 0;
	BCF        _flagB2+0, BitPos(_flagB2+0)
;Gerador_Sinais.c,55 :: 		PORTC.RC5 = ~PORTC.RC5;
	MOVLW      32
	XORWF      PORTC+0, 1
;Gerador_Sinais.c,56 :: 		}
L_main7:
;Gerador_Sinais.c,58 :: 		if(B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main10
L__main25:
;Gerador_Sinais.c,59 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Gerador_Sinais.c,60 :: 		}
L_main10:
;Gerador_Sinais.c,61 :: 		if(!B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main13
L__main24:
;Gerador_Sinais.c,62 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Gerador_Sinais.c,63 :: 		frequencia--;
	MOVLW      1
	SUBWF      _frequencia+0, 1
	BTFSS      STATUS+0, 0
	DECF       _frequencia+1, 1
;Gerador_Sinais.c,64 :: 		if(frequencia < 1) frequencia = 1;
	MOVLW      0
	SUBWF      _frequencia+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      1
	SUBWF      _frequencia+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
	MOVLW      1
	MOVWF      _frequencia+0
	MOVLW      0
	MOVWF      _frequencia+1
L_main14:
;Gerador_Sinais.c,65 :: 		}
L_main13:
;Gerador_Sinais.c,67 :: 		if(B1 && flagB1 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main17
L__main23:
;Gerador_Sinais.c,68 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Gerador_Sinais.c,69 :: 		}
L_main17:
;Gerador_Sinais.c,70 :: 		if(!B1 && flagB1 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main20
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main20
L__main22:
;Gerador_Sinais.c,71 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Gerador_Sinais.c,72 :: 		frequencia++;
	INCF       _frequencia+0, 1
	BTFSC      STATUS+0, 2
	INCF       _frequencia+1, 1
;Gerador_Sinais.c,73 :: 		if(frequencia > 10) frequencia = 10;
	MOVF       _frequencia+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVF       _frequencia+0, 0
	SUBLW      10
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
	MOVLW      10
	MOVWF      _frequencia+0
	MOVLW      0
	MOVWF      _frequencia+1
L_main21:
;Gerador_Sinais.c,74 :: 		}
L_main20:
;Gerador_Sinais.c,76 :: 		PORTD = frequencia;
	MOVF       _frequencia+0, 0
	MOVWF      PORTD+0
;Gerador_Sinais.c,77 :: 		PORTC.RC0 = ~PORTC.RC0;
	MOVLW      1
	XORWF      PORTC+0, 1
;Gerador_Sinais.c,78 :: 		Vdelay_ms(frequencia);
	MOVF       _frequencia+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _frequencia+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Gerador_Sinais.c,80 :: 		}
	GOTO       L_main0
;Gerador_Sinais.c,82 :: 		}
	GOTO       $+0
; end of _main
