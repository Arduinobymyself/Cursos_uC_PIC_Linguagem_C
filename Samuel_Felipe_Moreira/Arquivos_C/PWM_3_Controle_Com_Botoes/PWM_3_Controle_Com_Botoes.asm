
_main:

;PWM_3_Controle_Com_Botoes.c,9 :: 		void main() {
;PWM_3_Controle_Com_Botoes.c,11 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;PWM_3_Controle_Com_Botoes.c,12 :: 		ADCON0 = 0;
	CLRF       ADCON0+0
;PWM_3_Controle_Com_Botoes.c,13 :: 		ADCON1 = 0;
	CLRF       ADCON1+0
;PWM_3_Controle_Com_Botoes.c,15 :: 		TRISB = 0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;PWM_3_Controle_Com_Botoes.c,16 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;PWM_3_Controle_Com_Botoes.c,18 :: 		PWM1_Init(5000);       // inicializa o módulo PWM1 com frequência de 5000Hz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_3_Controle_Com_Botoes.c,19 :: 		PWM1_Start();          // ativa o PWM1 que usa o pino RC2
	CALL       _PWM1_Start+0
;PWM_3_Controle_Com_Botoes.c,23 :: 		PWM1_Set_Duty(pwm_value);    // define o duty-cycle
	MOVF       _pwm_value+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_3_Controle_Com_Botoes.c,25 :: 		while(1){
L_main0:
;PWM_3_Controle_Com_Botoes.c,27 :: 		if(B0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;PWM_3_Controle_Com_Botoes.c,28 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;PWM_3_Controle_Com_Botoes.c,29 :: 		pwm_value += 10;
	MOVLW      10
	ADDWF      _pwm_value+0, 0
	MOVWF      R1+0
	MOVF       _pwm_value+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _pwm_value+0
	MOVF       R1+1, 0
	MOVWF      _pwm_value+1
;PWM_3_Controle_Com_Botoes.c,30 :: 		if(pwm_value >= 255) pwm_value = 255;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      255
	SUBWF      R1+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
	MOVLW      255
	MOVWF      _pwm_value+0
	CLRF       _pwm_value+1
L_main4:
;PWM_3_Controle_Com_Botoes.c,31 :: 		PWM1_Set_Duty(pwm_value);
	MOVF       _pwm_value+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_3_Controle_Com_Botoes.c,32 :: 		}
L_main2:
;PWM_3_Controle_Com_Botoes.c,34 :: 		if(B1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;PWM_3_Controle_Com_Botoes.c,35 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;PWM_3_Controle_Com_Botoes.c,36 :: 		pwm_value -= 10;
	MOVLW      10
	SUBWF      _pwm_value+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _pwm_value+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _pwm_value+0
	MOVF       R1+1, 0
	MOVWF      _pwm_value+1
;PWM_3_Controle_Com_Botoes.c,37 :: 		if(pwm_value <= 0) pwm_value = 0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       R1+0, 0
	SUBLW      0
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
	CLRF       _pwm_value+0
	CLRF       _pwm_value+1
L_main7:
;PWM_3_Controle_Com_Botoes.c,38 :: 		PWM1_Set_Duty(pwm_value);
	MOVF       _pwm_value+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_3_Controle_Com_Botoes.c,39 :: 		}
L_main5:
;PWM_3_Controle_Com_Botoes.c,41 :: 		}
	GOTO       L_main0
;PWM_3_Controle_Com_Botoes.c,46 :: 		}
	GOTO       $+0
; end of _main
