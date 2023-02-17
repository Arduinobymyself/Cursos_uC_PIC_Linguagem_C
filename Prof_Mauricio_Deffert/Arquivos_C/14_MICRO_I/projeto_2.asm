
_main:

;projeto_2.c,19 :: 		void main() {
;projeto_2.c,21 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;projeto_2.c,22 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;projeto_2.c,23 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;projeto_2.c,24 :: 		TRISC = 0;
	CLRF       TRISC+0
;projeto_2.c,25 :: 		PORTC = 0;
	CLRF       PORTC+0
;projeto_2.c,27 :: 		ADC_Init();
	CALL       _ADC_Init+0
;projeto_2.c,29 :: 		PWM1_Init(500); // inicializa o módulo PWM com frequência 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;projeto_2.c,30 :: 		PWM1_Start();    // icnia a geração do PWM
	CALL       _PWM1_Start+0
;projeto_2.c,32 :: 		while(1){
L_main0:
;projeto_2.c,34 :: 		leitura = ADC_Read(0)/4;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _leitura+0
	MOVF       R2+1, 0
	MOVWF      _leitura+1
;projeto_2.c,36 :: 		PWM1_Set_Duty(leitura);
	MOVF       R2+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;projeto_2.c,38 :: 		if(!B0 && !flagB0){
	BTFSC      RB0_bit+0, 0
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main25:
;projeto_2.c,39 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;projeto_2.c,40 :: 		}
L_main4:
;projeto_2.c,41 :: 		if(B0 && flagB0){
	BTFSS      RB0_bit+0, 0
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main24:
;projeto_2.c,42 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;projeto_2.c,43 :: 		RC3_bit = 1;
	BSF        RC3_bit+0, 3
;projeto_2.c,44 :: 		RC4_bit = 0;
	BCF        RC4_bit+0, 4
;projeto_2.c,45 :: 		}
L_main7:
;projeto_2.c,47 :: 		if(!B1 && !flagB1){
	BTFSC      RB1_bit+0, 1
	GOTO       L_main10
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main10
L__main23:
;projeto_2.c,48 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;projeto_2.c,49 :: 		}
L_main10:
;projeto_2.c,50 :: 		if(B1 && flagB1){
	BTFSS      RB1_bit+0, 1
	GOTO       L_main13
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main13
L__main22:
;projeto_2.c,51 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;projeto_2.c,52 :: 		RC3_bit = 0;
	BCF        RC3_bit+0, 3
;projeto_2.c,53 :: 		RC4_bit = 1;
	BSF        RC4_bit+0, 4
;projeto_2.c,54 :: 		}
L_main13:
;projeto_2.c,56 :: 		if(!B2 && !flagB2){
	BTFSC      RB2_bit+0, 2
	GOTO       L_main16
	BTFSC      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main16
L__main21:
;projeto_2.c,57 :: 		flagB2 = 1;
	BSF        _flagB2+0, BitPos(_flagB2+0)
;projeto_2.c,58 :: 		}
L_main16:
;projeto_2.c,59 :: 		if(B2 && flagB2){
	BTFSS      RB2_bit+0, 2
	GOTO       L_main19
	BTFSS      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main19
L__main20:
;projeto_2.c,60 :: 		flagB2 = 0;
	BCF        _flagB2+0, BitPos(_flagB2+0)
;projeto_2.c,61 :: 		RC3_bit = 0;
	BCF        RC3_bit+0, 3
;projeto_2.c,62 :: 		RC4_bit = 0;
	BCF        RC4_bit+0, 4
;projeto_2.c,63 :: 		}
L_main19:
;projeto_2.c,65 :: 		}
	GOTO       L_main0
;projeto_2.c,67 :: 		}
	GOTO       $+0
; end of _main
