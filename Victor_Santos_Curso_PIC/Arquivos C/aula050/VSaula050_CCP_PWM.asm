
_main:

;VSaula050_CCP_PWM.c,42 :: 		void main() {
;VSaula050_CCP_PWM.c,44 :: 		TRISC = 0b00000000; // RC1/CCP2 como saída
	CLRF       TRISC+0
;VSaula050_CCP_PWM.c,45 :: 		PORTC = 0b00000000; // inicia em nível baixo
	CLRF       PORTC+0
;VSaula050_CCP_PWM.c,48 :: 		T2CON = 0b00000100; // prescaler 1:1
	MOVLW      4
	MOVWF      T2CON+0
;VSaula050_CCP_PWM.c,59 :: 		PR2 = 255;
	MOVLW      255
	MOVWF      PR2+0
;VSaula050_CCP_PWM.c,62 :: 		CCP2M3_bit = 1;
	BSF        CCP2M3_bit+0, 3
;VSaula050_CCP_PWM.c,63 :: 		CCP2M2_bit = 1;
	BSF        CCP2M2_bit+0, 2
;VSaula050_CCP_PWM.c,64 :: 		CCP2M1_bit = 1;
	BSF        CCP2M1_bit+0, 1
;VSaula050_CCP_PWM.c,65 :: 		CCP2M0_bit = 1;
	BSF        CCP2M0_bit+0, 0
;VSaula050_CCP_PWM.c,67 :: 		CCP2X_bit = 0;
	BCF        CCP2X_bit+0, 5
;VSaula050_CCP_PWM.c,68 :: 		CCP2Y_bit = 0;
	BCF        CCP2Y_bit+0, 4
;VSaula050_CCP_PWM.c,69 :: 		CCPR2L = 50;
	MOVLW      50
	MOVWF      CCPR2L+0
;VSaula050_CCP_PWM.c,73 :: 		while(1){
L_main0:
;VSaula050_CCP_PWM.c,77 :: 		}
	GOTO       L_main0
;VSaula050_CCP_PWM.c,79 :: 		}
	GOTO       $+0
; end of _main
