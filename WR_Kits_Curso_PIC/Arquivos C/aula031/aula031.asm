
_main:

;aula031.c,34 :: 		void main() {
;aula031.c,35 :: 		CMCON = 0X07; // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula031.c,36 :: 		TRISB = 0XFF; // todo port B como entrada
	MOVLW      255
	MOVWF      TRISB+0
;aula031.c,37 :: 		TRISC = 0x00; // todo port C como saída
	CLRF       TRISC+0
;aula031.c,38 :: 		PORTB = 0XFF; // todo port B inicia em HIGH
	MOVLW      255
	MOVWF      PORTB+0
;aula031.c,39 :: 		PORTC = 0X00; // todo port C inicia em LOW
	CLRF       PORTC+0
;aula031.c,41 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;aula031.c,42 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;aula031.c,44 :: 		duty1 = 127;
	MOVLW      127
	MOVWF      _duty1+0
;aula031.c,45 :: 		duty2 = 127;
	MOVLW      127
	MOVWF      _duty2+0
;aula031.c,47 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;aula031.c,48 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;aula031.c,50 :: 		PWM1_Set_Duty(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula031.c,51 :: 		PWM2_Set_Duty(duty2);
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;aula031.c,53 :: 		while(1)
L_main0:
;aula031.c,55 :: 		if(!B1){
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main2
;aula031.c,56 :: 		delay_ms(50);
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
;aula031.c,57 :: 		duty1++;
	INCF       _duty1+0, 1
;aula031.c,58 :: 		PWM1_Set_Duty(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula031.c,59 :: 		}
L_main2:
;aula031.c,60 :: 		if(!B2){
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main4
;aula031.c,61 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;aula031.c,62 :: 		duty1--;
	DECF       _duty1+0, 1
;aula031.c,63 :: 		PWM1_Set_Duty(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula031.c,64 :: 		}
L_main4:
;aula031.c,65 :: 		if(!B3){
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main6
;aula031.c,66 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;aula031.c,67 :: 		duty2++;
	INCF       _duty2+0, 1
;aula031.c,68 :: 		PWM2_Set_Duty(duty2);
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;aula031.c,69 :: 		}
L_main6:
;aula031.c,70 :: 		if(!B4){
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main8
;aula031.c,71 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;aula031.c,72 :: 		duty2--;
	DECF       _duty2+0, 1
;aula031.c,73 :: 		PWM2_Set_Duty(duty2);
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;aula031.c,74 :: 		}
L_main8:
;aula031.c,75 :: 		}
	GOTO       L_main0
;aula031.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
