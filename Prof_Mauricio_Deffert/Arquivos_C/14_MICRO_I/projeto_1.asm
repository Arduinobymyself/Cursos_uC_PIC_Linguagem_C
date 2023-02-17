
_main:

;projeto_1.c,17 :: 		void main() {
;projeto_1.c,19 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;projeto_1.c,20 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;projeto_1.c,21 :: 		TRISC = 0;
	CLRF       TRISC+0
;projeto_1.c,22 :: 		TRISD = 0;
	CLRF       TRISD+0
;projeto_1.c,23 :: 		PORTC = 0;
	CLRF       PORTC+0
;projeto_1.c,24 :: 		PORTD = 0;
	CLRF       PORTD+0
;projeto_1.c,26 :: 		PWM1_Init(1000); // inicializa o módulo PWM com frequência 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;projeto_1.c,27 :: 		PWM1_Start();    // icnia a geração do PWM
	CALL       _PWM1_Start+0
;projeto_1.c,28 :: 		PWM2_Init(1000); // inicializa o módulo PWM com frequência 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;projeto_1.c,29 :: 		PWM2_Start();    // icnia a geração do PWM
	CALL       _PWM2_Start+0
;projeto_1.c,31 :: 		while(1){
L_main0:
;projeto_1.c,33 :: 		if(!B0){
	BTFSC      RB0_bit+0, 0
	GOTO       L_main2
;projeto_1.c,34 :: 		dutyCycle1 += 25;
	MOVLW      25
	ADDWF      _dutyCycle1+0, 0
	MOVWF      R1+0
	MOVF       _dutyCycle1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle1+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle1+1
;projeto_1.c,35 :: 		if(dutyCycle1 > 255) dutyCycle1 = 250;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       R1+0, 0
	SUBLW      255
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVLW      250
	MOVWF      _dutyCycle1+0
	CLRF       _dutyCycle1+1
L_main3:
;projeto_1.c,36 :: 		PWM1_Set_Duty(dutyCycle1);
	MOVF       _dutyCycle1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;projeto_1.c,37 :: 		}
L_main2:
;projeto_1.c,38 :: 		if(!B1){
	BTFSC      RB1_bit+0, 1
	GOTO       L_main4
;projeto_1.c,39 :: 		dutyCycle1 -= 25;
	MOVLW      25
	SUBWF      _dutyCycle1+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _dutyCycle1+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle1+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle1+1
;projeto_1.c,40 :: 		if(dutyCycle1 < 0) dutyCycle1 = 0;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      R1+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	CLRF       _dutyCycle1+0
	CLRF       _dutyCycle1+1
L_main5:
;projeto_1.c,41 :: 		PWM1_Set_Duty(dutyCycle1);
	MOVF       _dutyCycle1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;projeto_1.c,42 :: 		}
L_main4:
;projeto_1.c,44 :: 		if(!B2){
	BTFSC      RB2_bit+0, 2
	GOTO       L_main6
;projeto_1.c,45 :: 		dutyCycle2 += 25;
	MOVLW      25
	ADDWF      _dutyCycle2+0, 0
	MOVWF      R1+0
	MOVF       _dutyCycle2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle2+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle2+1
;projeto_1.c,46 :: 		if(dutyCycle2 > 255) dutyCycle2 = 250;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       R1+0, 0
	SUBLW      255
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      250
	MOVWF      _dutyCycle2+0
	CLRF       _dutyCycle2+1
L_main7:
;projeto_1.c,47 :: 		PWM2_Set_Duty(dutyCycle2);
	MOVF       _dutyCycle2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;projeto_1.c,48 :: 		}
L_main6:
;projeto_1.c,49 :: 		if(!B3){
	BTFSC      RB3_bit+0, 3
	GOTO       L_main8
;projeto_1.c,50 :: 		dutyCycle2 -= 25;
	MOVLW      25
	SUBWF      _dutyCycle2+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _dutyCycle2+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _dutyCycle2+0
	MOVF       R1+1, 0
	MOVWF      _dutyCycle2+1
;projeto_1.c,51 :: 		if(dutyCycle2 < 0) dutyCycle2 = 0;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	SUBWF      R1+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	CLRF       _dutyCycle2+0
	CLRF       _dutyCycle2+1
L_main9:
;projeto_1.c,52 :: 		PWM2_Set_Duty(dutyCycle2);
	MOVF       _dutyCycle2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;projeto_1.c,53 :: 		}
L_main8:
;projeto_1.c,55 :: 		delay_ms(100); // debounce
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;projeto_1.c,56 :: 		}
	GOTO       L_main0
;projeto_1.c,58 :: 		}
	GOTO       $+0
; end of _main
