
_main:

;MotorDC_PWM_Buttons.c,16 :: 		void main() {
;MotorDC_PWM_Buttons.c,17 :: 		CMCON = 7; // comparadores desativados
	MOVLW      7
	MOVWF      CMCON+0
;MotorDC_PWM_Buttons.c,19 :: 		ADCON0 = 0; // conversor AD desligado
	CLRF       ADCON0+0
;MotorDC_PWM_Buttons.c,20 :: 		ADCON1 = 7; // todas as entradas como digital
	MOVLW      7
	MOVWF      ADCON1+0
;MotorDC_PWM_Buttons.c,21 :: 		TRISB = 0b00000011; // port B RB0 e RB1 como entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;MotorDC_PWM_Buttons.c,25 :: 		PWM1_Init(5000);            // inicializa o PWM
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MotorDC_PWM_Buttons.c,26 :: 		PWM1_Start();               //
	CALL       _PWM1_Start+0
;MotorDC_PWM_Buttons.c,27 :: 		PWM1_Set_Duty(valorPWM);    // configura o DutyCycle de acordo com o valor desejado
	MOVF       _valorPWM+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MotorDC_PWM_Buttons.c,29 :: 		while(1){
L_main0:
;MotorDC_PWM_Buttons.c,31 :: 		if(B0 && flagB0 == 0){ // B0 incrementa o valor em 10%
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main19:
;MotorDC_PWM_Buttons.c,32 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;MotorDC_PWM_Buttons.c,33 :: 		}
L_main4:
;MotorDC_PWM_Buttons.c,34 :: 		if(!B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main18:
;MotorDC_PWM_Buttons.c,35 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;MotorDC_PWM_Buttons.c,36 :: 		porcentagem += 10;
	MOVLW      10
	ADDWF      _porcentagem+0, 0
	MOVWF      R1+0
	MOVF       _porcentagem+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _porcentagem+0
	MOVF       R1+1, 0
	MOVWF      _porcentagem+1
;MotorDC_PWM_Buttons.c,37 :: 		if(porcentagem > 100){ // não pode ser maior que 100%
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       R1+0, 0
	SUBLW      100
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MotorDC_PWM_Buttons.c,38 :: 		porcentagem = 100;
	MOVLW      100
	MOVWF      _porcentagem+0
	MOVLW      0
	MOVWF      _porcentagem+1
;MotorDC_PWM_Buttons.c,39 :: 		}
L_main8:
;MotorDC_PWM_Buttons.c,40 :: 		valorPWM = (porcentagem*255)/100;
	MOVF       _porcentagem+0, 0
	MOVWF      R0+0
	MOVF       _porcentagem+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _valorPWM+0
	MOVF       R0+1, 0
	MOVWF      _valorPWM+1
;MotorDC_PWM_Buttons.c,41 :: 		PWM1_Set_Duty(valorPWM);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MotorDC_PWM_Buttons.c,42 :: 		}
L_main7:
;MotorDC_PWM_Buttons.c,44 :: 		if(B1 && flagB1 == 0){ // B1 decrementa o valor em 10%
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main11
L__main17:
;MotorDC_PWM_Buttons.c,45 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;MotorDC_PWM_Buttons.c,46 :: 		}
L_main11:
;MotorDC_PWM_Buttons.c,47 :: 		if(!B1 && flagB1 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main14
L__main16:
;MotorDC_PWM_Buttons.c,48 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;MotorDC_PWM_Buttons.c,49 :: 		porcentagem -= 10;
	MOVLW      10
	SUBWF      _porcentagem+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _porcentagem+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _porcentagem+0
	MOVF       R1+1, 0
	MOVWF      _porcentagem+1
;MotorDC_PWM_Buttons.c,50 :: 		if(porcentagem < 0){ // não pode ser menor que 0%
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	SUBWF      R1+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;MotorDC_PWM_Buttons.c,51 :: 		porcentagem = 0;
	CLRF       _porcentagem+0
	CLRF       _porcentagem+1
;MotorDC_PWM_Buttons.c,52 :: 		}
L_main15:
;MotorDC_PWM_Buttons.c,53 :: 		valorPWM = (porcentagem*255)/100;
	MOVF       _porcentagem+0, 0
	MOVWF      R0+0
	MOVF       _porcentagem+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _valorPWM+0
	MOVF       R0+1, 0
	MOVWF      _valorPWM+1
;MotorDC_PWM_Buttons.c,54 :: 		PWM1_Set_Duty(valorPWM);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MotorDC_PWM_Buttons.c,55 :: 		}
L_main14:
;MotorDC_PWM_Buttons.c,57 :: 		}
	GOTO       L_main0
;MotorDC_PWM_Buttons.c,65 :: 		}
	GOTO       $+0
; end of _main
