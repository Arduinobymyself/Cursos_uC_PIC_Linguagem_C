
_main:

;VSaula051_CCP_PWM_Library.c,42 :: 		void main() {
;VSaula051_CCP_PWM_Library.c,44 :: 		TRISC = 0b00000000; // RC1/CCP2 como saída
	CLRF       TRISC+0
;VSaula051_CCP_PWM_Library.c,45 :: 		PORTC = 0b00000000; // inicia em nível baixo
	CLRF       PORTC+0
;VSaula051_CCP_PWM_Library.c,47 :: 		PWM2_Init(2000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;VSaula051_CCP_PWM_Library.c,48 :: 		PWM2_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;VSaula051_CCP_PWM_Library.c,49 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;VSaula051_CCP_PWM_Library.c,50 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;VSaula051_CCP_PWM_Library.c,51 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;VSaula051_CCP_PWM_Library.c,52 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;VSaula051_CCP_PWM_Library.c,53 :: 		PWM2_Stop();
	CALL       _PWM2_Stop+0
;VSaula051_CCP_PWM_Library.c,60 :: 		while(1){
L_main2:
;VSaula051_CCP_PWM_Library.c,64 :: 		}
	GOTO       L_main2
;VSaula051_CCP_PWM_Library.c,66 :: 		}
	GOTO       $+0
; end of _main
