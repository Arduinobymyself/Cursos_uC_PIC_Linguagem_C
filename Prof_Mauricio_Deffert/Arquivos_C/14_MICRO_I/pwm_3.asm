
_main:

;pwm_3.c,13 :: 		void main() {
;pwm_3.c,15 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;pwm_3.c,16 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;pwm_3.c,17 :: 		TRISC = 0;
	CLRF       TRISC+0
;pwm_3.c,18 :: 		TRISD = 0;
	CLRF       TRISD+0
;pwm_3.c,19 :: 		PORTC = 0;
	CLRF       PORTC+0
;pwm_3.c,20 :: 		PORTD = 0;
	CLRF       PORTD+0
;pwm_3.c,22 :: 		PWM1_Init(1000); // inicializa o módulo PWM com frequência 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm_3.c,23 :: 		PWM1_Start();   // icnia a geração do PWM
	CALL       _PWM1_Start+0
;pwm_3.c,25 :: 		while(1){
L_main0:
;pwm_3.c,26 :: 		if(!B0){
	BTFSC      RB0_bit+0, 0
	GOTO       L_main2
;pwm_3.c,27 :: 		dutyCycle += 25;
	MOVLW      25
	ADDWF      _dutyCycle+0, 0
	MOVWF      R1+0
	MOVF       _dutyCycle+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle+1
;pwm_3.c,28 :: 		if(dutyCycle > 255) dutyCycle = 250;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R1+0, 0
	SUBLW      255
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVLW      250
	MOVWF      _dutyCycle+0
	CLRF       _dutyCycle+1
L_main3:
;pwm_3.c,29 :: 		PWM1_Set_Duty(dutyCycle);
	MOVF       _dutyCycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_3.c,30 :: 		}
L_main2:
;pwm_3.c,31 :: 		if(!B1){
	BTFSC      RB1_bit+0, 1
	GOTO       L_main4
;pwm_3.c,32 :: 		dutyCycle -= 25;
	MOVLW      25
	SUBWF      _dutyCycle+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _dutyCycle+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle+1
;pwm_3.c,33 :: 		if(dutyCycle < 0) dutyCycle = 0;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	SUBWF      R1+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	CLRF       _dutyCycle+0
	CLRF       _dutyCycle+1
L_main5:
;pwm_3.c,34 :: 		PWM1_Set_Duty(dutyCycle);
	MOVF       _dutyCycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_3.c,35 :: 		}
L_main4:
;pwm_3.c,36 :: 		PORTD = dutyCycle;
	MOVF       _dutyCycle+0, 0
	MOVWF      PORTD+0
;pwm_3.c,37 :: 		delay_ms(200); // debounce
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;pwm_3.c,38 :: 		}
	GOTO       L_main0
;pwm_3.c,40 :: 		}
	GOTO       $+0
; end of _main
