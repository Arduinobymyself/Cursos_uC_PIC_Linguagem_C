
_main:

;pwm_1.c,9 :: 		void main() {
;pwm_1.c,10 :: 		TRISC = 0;
	CLRF       TRISC+0
;pwm_1.c,11 :: 		PORTC = 0;
	CLRF       PORTC+0
;pwm_1.c,12 :: 		while(1){
L_main0:
;pwm_1.c,13 :: 		PWM1 = 1;
	BSF        RC2_bit+0, 2
;pwm_1.c,14 :: 		Vdelay_ms(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _duty+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;pwm_1.c,15 :: 		PWM1 = 0;
	BCF        RC2_bit+0, 2
;pwm_1.c,16 :: 		Vdelay_ms(10-duty);
	MOVF       _duty+0, 0
	SUBLW      10
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _duty+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_VDelay_ms_Time_ms+1
	SUBWF      FARG_VDelay_ms_Time_ms+1, 1
	CALL       _VDelay_ms+0
;pwm_1.c,17 :: 		}
	GOTO       L_main0
;pwm_1.c,19 :: 		}
	GOTO       $+0
; end of _main
