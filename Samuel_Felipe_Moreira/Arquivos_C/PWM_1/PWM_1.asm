
_main:

;PWM_1.c,5 :: 		void main() {
;PWM_1.c,7 :: 		ADCON0 = 0x00;
	CLRF       ADCON0+0
;PWM_1.c,8 :: 		ADCON1 = 0X07;
	MOVLW      7
	MOVWF      ADCON1+0
;PWM_1.c,9 :: 		TRISC.RC2 = 0;
	BCF        TRISC+0, 2
;PWM_1.c,10 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;PWM_1.c,12 :: 		while(1){
L_main0:
;PWM_1.c,13 :: 		PORTC.RC2 = 1;
	BSF        PORTC+0, 2
;PWM_1.c,14 :: 		Vdelay_ms(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _duty+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_1.c,15 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;PWM_1.c,16 :: 		Vdelay_ms(1000 - duty);
	MOVF       _duty+0, 0
	SUBLW      232
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _duty+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      3
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_1.c,17 :: 		}
	GOTO       L_main0
;PWM_1.c,19 :: 		}
	GOTO       $+0
; end of _main
