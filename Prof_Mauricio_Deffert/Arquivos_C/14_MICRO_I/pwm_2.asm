
_main:

;pwm_2.c,11 :: 		void main() {
;pwm_2.c,13 :: 		TRISC = 0;
	CLRF       TRISC+0
;pwm_2.c,14 :: 		TRISD = 0;
	CLRF       TRISD+0
;pwm_2.c,15 :: 		PORTC = 0;
	CLRF       PORTC+0
;pwm_2.c,16 :: 		PORTD = 0;
	CLRF       PORTD+0
;pwm_2.c,18 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm_2.c,19 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;pwm_2.c,21 :: 		while(1){
L_main0:
;pwm_2.c,22 :: 		for(i=0; i<255; i++){
	CLRF       _i+0
L_main2:
	MOVLW      255
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;pwm_2.c,23 :: 		PWM1_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_2.c,24 :: 		PORTD = i;
	MOVF       _i+0, 0
	MOVWF      PORTD+0
;pwm_2.c,25 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;pwm_2.c,22 :: 		for(i=0; i<255; i++){
	INCF       _i+0, 1
;pwm_2.c,26 :: 		}
	GOTO       L_main2
L_main3:
;pwm_2.c,27 :: 		}
	GOTO       L_main0
;pwm_2.c,31 :: 		}
	GOTO       $+0
; end of _main
