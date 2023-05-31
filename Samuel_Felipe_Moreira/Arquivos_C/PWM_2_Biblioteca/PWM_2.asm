
_piscaLed:

;PWM_2.c,5 :: 		void piscaLed(){
;PWM_2.c,6 :: 		PORTD.RD0 = 1;
	BSF        PORTD+0, 0
;PWM_2.c,7 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_piscaLed0:
	DECFSZ     R13+0, 1
	GOTO       L_piscaLed0
	DECFSZ     R12+0, 1
	GOTO       L_piscaLed0
	DECFSZ     R11+0, 1
	GOTO       L_piscaLed0
	NOP
	NOP
;PWM_2.c,8 :: 		PORTD.RD0 = 0;
	BCF        PORTD+0, 0
;PWM_2.c,9 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_piscaLed1:
	DECFSZ     R13+0, 1
	GOTO       L_piscaLed1
	DECFSZ     R12+0, 1
	GOTO       L_piscaLed1
	DECFSZ     R11+0, 1
	GOTO       L_piscaLed1
	NOP
	NOP
;PWM_2.c,10 :: 		}
	RETURN
; end of _piscaLed

_main:

;PWM_2.c,13 :: 		void main() {
;PWM_2.c,15 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;PWM_2.c,16 :: 		ADCON0 = 0;
	CLRF       ADCON0+0
;PWM_2.c,17 :: 		ADCON1 = 0;
	CLRF       ADCON1+0
;PWM_2.c,19 :: 		TRISD = 0;
	CLRF       TRISD+0
;PWM_2.c,20 :: 		PORTD = 0;
	CLRF       PORTD+0
;PWM_2.c,22 :: 		PWM1_Init(5000);       // inicializa o módulo ´WM com frequência de 5000Hz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_2.c,23 :: 		PWM1_Start();          // ativa o PWM
	CALL       _PWM1_Start+0
;PWM_2.c,25 :: 		pwm_value = pwm_percent*255/100; // converte porcentagem em valor de 0~255
	MOVF       _pwm_percent+0, 0
	MOVWF      R0+0
	MOVF       _pwm_percent+1, 0
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
	MOVWF      _pwm_value+0
	MOVF       R0+1, 0
	MOVWF      _pwm_value+1
;PWM_2.c,27 :: 		PWM1_Set_Duty(pwm_value);    // define o duty-cycle
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_2.c,29 :: 		while(1){
L_main2:
;PWM_2.c,30 :: 		piscaLed(); // pisca um LED mesmo com o controle de PWM ativado
	CALL       _piscaLed+0
;PWM_2.c,31 :: 		}
	GOTO       L_main2
;PWM_2.c,36 :: 		}
	GOTO       $+0
; end of _main
