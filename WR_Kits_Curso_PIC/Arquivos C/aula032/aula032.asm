
_main:

;aula032.c,37 :: 		void main() {
;aula032.c,38 :: 		CMCON = 0X07; // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula032.c,39 :: 		ADCON0 = 0b00000001; // liga o módulo conversor AD e sleciona canal 0 (AN0)
	MOVLW      1
	MOVWF      ADCON0+0
;aula032.c,40 :: 		ADCON1 = 0b00001110; // apenas AN0 como analógico todos os outros pinos como digital
	MOVLW      14
	MOVWF      ADCON1+0
;aula032.c,42 :: 		TRISB = 0XFF; // todo port B como entrada
	MOVLW      255
	MOVWF      TRISB+0
;aula032.c,43 :: 		TRISC = 0x00; // todo port C como saída
	CLRF       TRISC+0
;aula032.c,44 :: 		PORTB = 0XFF; // todo port B inicia em HIGH
	MOVLW      255
	MOVWF      PORTB+0
;aula032.c,45 :: 		PORTC = 0X00; // todo port C inicia em LOW
	CLRF       PORTC+0
;aula032.c,47 :: 		PWM1_Init(1000);  // inicia o PWM com frequencia de 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;aula032.c,49 :: 		percent_duty = 50;
	MOVLW      50
	MOVWF      _percent_duty+0
;aula032.c,51 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;aula032.c,53 :: 		PWM1_Set_Duty(percent_duty*255/100);
	MOVF       _percent_duty+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula032.c,56 :: 		while(1)
L_main0:
;aula032.c,58 :: 		ADC = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ADC+0
	MOVF       R0+1, 0
	MOVWF      _ADC+1
;aula032.c,59 :: 		PWM1_Set_Duty(ADC*255/100);
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula032.c,60 :: 		if(ADC < 512 ){
	MOVLW      2
	SUBWF      _ADC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      0
	SUBWF      _ADC+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;aula032.c,61 :: 		percent_duty++;
	INCF       _percent_duty+0, 1
;aula032.c,62 :: 		delay_ms(50);
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
;aula032.c,63 :: 		if(percent_duty > 90) percent_duty = 90;
	MOVF       _percent_duty+0, 0
	SUBLW      90
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      90
	MOVWF      _percent_duty+0
L_main4:
;aula032.c,64 :: 		} else {
	GOTO       L_main5
L_main2:
;aula032.c,65 :: 		percent_duty = 80;
	MOVLW      80
	MOVWF      _percent_duty+0
;aula032.c,66 :: 		}
L_main5:
;aula032.c,67 :: 		}
	GOTO       L_main0
;aula032.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
