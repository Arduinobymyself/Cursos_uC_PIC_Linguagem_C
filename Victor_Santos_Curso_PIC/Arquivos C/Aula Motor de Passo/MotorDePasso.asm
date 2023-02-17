
_Stepper_Init:

;stepper_lib.h,22 :: 		void Stepper_Init(unsigned char _pStepper_, unsigned char _nSteps, unsigned char _rpm)
;stepper_lib.h,24 :: 		_delay_Stepper = 60000 / _nSteps / _rpm;
	MOVF        FARG_Stepper_Init__nSteps+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       96
	MOVWF       R0 
	MOVLW       234
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        FARG_Stepper_Init__rpm+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       __delay_Stepper+0 
	MOVF        R1, 0 
	MOVWF       __delay_Stepper+1 
;stepper_lib.h,25 :: 		Stepper_PinB1_Direction = 0;
	BCF         Stepper_PinB1_Direction+0, BitPos(Stepper_PinB1_Direction+0) 
;stepper_lib.h,26 :: 		Stepper_PinB2_Direction = 0;
	BCF         Stepper_PinB2_Direction+0, BitPos(Stepper_PinB2_Direction+0) 
;stepper_lib.h,27 :: 		Stepper_PinB3_Direction = 0;
	BCF         Stepper_PinB3_Direction+0, BitPos(Stepper_PinB3_Direction+0) 
;stepper_lib.h,28 :: 		Stepper_PinB4_Direction = 0;
	BCF         Stepper_PinB4_Direction+0, BitPos(Stepper_PinB4_Direction+0) 
;stepper_lib.h,29 :: 		Stepper_PinB1 = 0;
	BCF         Stepper_PinB1+0, BitPos(Stepper_PinB1+0) 
;stepper_lib.h,30 :: 		Stepper_PinB2 = 0;
	BCF         Stepper_PinB2+0, BitPos(Stepper_PinB2+0) 
;stepper_lib.h,31 :: 		Stepper_PinB3 = 0;
	BCF         Stepper_PinB3+0, BitPos(Stepper_PinB3+0) 
;stepper_lib.h,32 :: 		Stepper_PinB4 = 0;
	BCF         Stepper_PinB4+0, BitPos(Stepper_PinB4+0) 
;stepper_lib.h,33 :: 		_pStepper = _pStepper_;
	MOVF        FARG_Stepper_Init__pStepper_+0, 0 
	MOVWF       __pStepper+0 
	MOVLW       0
	MOVWF       __pStepper+1 
;stepper_lib.h,34 :: 		}
L_end_Stepper_Init:
	RETURN      0
; end of _Stepper_Init

_Stepper_One_Step:

;stepper_lib.h,36 :: 		void Stepper_One_Step(unsigned char direcao_Stepper)
;stepper_lib.h,39 :: 		unsigned char tamanho = _pStepper[0];
	MOVFF       __pStepper+0, FSR0
	MOVFF       __pStepper+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
;stepper_lib.h,40 :: 		unsigned char Stepper_Step = _pStepper[(stepCount % tamanho) + 1];
	MOVF        Stepper_One_Step_stepCount_L0+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       __pStepper+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      __pStepper+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       Stepper_One_Step_Stepper_Step_L0+0 
;stepper_lib.h,42 :: 		if(direcao_Stepper == 0)
	MOVF        FARG_Stepper_One_Step_direcao_Stepper+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Stepper_One_Step0
;stepper_lib.h,43 :: 		stepCount++;
	INCF        Stepper_One_Step_stepCount_L0+0, 1 
	GOTO        L_Stepper_One_Step1
L_Stepper_One_Step0:
;stepper_lib.h,45 :: 		stepCount--;
	DECF        Stepper_One_Step_stepCount_L0+0, 1 
L_Stepper_One_Step1:
;stepper_lib.h,47 :: 		Stepper_PinB1 = Stepper_Step.f0;
	BTFSC       Stepper_One_Step_Stepper_Step_L0+0, 0 
	GOTO        L__Stepper_One_Step18
	BCF         Stepper_PinB1+0, BitPos(Stepper_PinB1+0) 
	GOTO        L__Stepper_One_Step19
L__Stepper_One_Step18:
	BSF         Stepper_PinB1+0, BitPos(Stepper_PinB1+0) 
L__Stepper_One_Step19:
;stepper_lib.h,48 :: 		Stepper_PinB2 = Stepper_Step.f1;
	BTFSC       Stepper_One_Step_Stepper_Step_L0+0, 1 
	GOTO        L__Stepper_One_Step20
	BCF         Stepper_PinB2+0, BitPos(Stepper_PinB2+0) 
	GOTO        L__Stepper_One_Step21
L__Stepper_One_Step20:
	BSF         Stepper_PinB2+0, BitPos(Stepper_PinB2+0) 
L__Stepper_One_Step21:
;stepper_lib.h,49 :: 		Stepper_PinB3 = Stepper_Step.f2;
	BTFSC       Stepper_One_Step_Stepper_Step_L0+0, 2 
	GOTO        L__Stepper_One_Step22
	BCF         Stepper_PinB3+0, BitPos(Stepper_PinB3+0) 
	GOTO        L__Stepper_One_Step23
L__Stepper_One_Step22:
	BSF         Stepper_PinB3+0, BitPos(Stepper_PinB3+0) 
L__Stepper_One_Step23:
;stepper_lib.h,50 :: 		Stepper_PinB4 = Stepper_Step.f3;
	BTFSC       Stepper_One_Step_Stepper_Step_L0+0, 3 
	GOTO        L__Stepper_One_Step24
	BCF         Stepper_PinB4+0, BitPos(Stepper_PinB4+0) 
	GOTO        L__Stepper_One_Step25
L__Stepper_One_Step24:
	BSF         Stepper_PinB4+0, BitPos(Stepper_PinB4+0) 
L__Stepper_One_Step25:
;stepper_lib.h,52 :: 		VDelay_ms(_delay_Stepper);
	MOVF        __delay_Stepper+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        __delay_Stepper+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;stepper_lib.h,53 :: 		}
L_end_Stepper_One_Step:
	RETURN      0
; end of _Stepper_One_Step

_Stepper_Step:

;stepper_lib.h,55 :: 		void Stepper_Step(int _Step_Stepper){
;stepper_lib.h,56 :: 		unsigned int _i_cont = 0;
	CLRF        Stepper_Step__i_cont_L0+0 
	CLRF        Stepper_Step__i_cont_L0+1 
;stepper_lib.h,58 :: 		if(_Step_Stepper > 0){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Stepper_Step__Step_Stepper+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Stepper_Step27
	MOVF        FARG_Stepper_Step__Step_Stepper+0, 0 
	SUBLW       0
L__Stepper_Step27:
	BTFSC       STATUS+0, 0 
	GOTO        L_Stepper_Step2
;stepper_lib.h,59 :: 		_i_cont = _Step_Stepper;
	MOVF        FARG_Stepper_Step__Step_Stepper+0, 0 
	MOVWF       Stepper_Step__i_cont_L0+0 
	MOVF        FARG_Stepper_Step__Step_Stepper+1, 0 
	MOVWF       Stepper_Step__i_cont_L0+1 
;stepper_lib.h,60 :: 		while(_i_cont--) {
L_Stepper_Step3:
	MOVF        Stepper_Step__i_cont_L0+0, 0 
	MOVWF       R0 
	MOVF        Stepper_Step__i_cont_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       Stepper_Step__i_cont_L0+0, 1 
	MOVLW       0
	SUBWFB      Stepper_Step__i_cont_L0+1, 1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Stepper_Step4
;stepper_lib.h,61 :: 		Stepper_One_Step(0);
	CLRF        FARG_Stepper_One_Step_direcao_Stepper+0 
	CALL        _Stepper_One_Step+0, 0
;stepper_lib.h,62 :: 		}
	GOTO        L_Stepper_Step3
L_Stepper_Step4:
;stepper_lib.h,63 :: 		}else{
	GOTO        L_Stepper_Step5
L_Stepper_Step2:
;stepper_lib.h,64 :: 		_i_cont = (_Step_Stepper*-1);
	MOVF        FARG_Stepper_Step__Step_Stepper+0, 0 
	MOVWF       R0 
	MOVF        FARG_Stepper_Step__Step_Stepper+1, 0 
	MOVWF       R1 
	MOVLW       255
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       Stepper_Step__i_cont_L0+0 
	MOVF        R1, 0 
	MOVWF       Stepper_Step__i_cont_L0+1 
;stepper_lib.h,65 :: 		while(_i_cont--) {
L_Stepper_Step6:
	MOVF        Stepper_Step__i_cont_L0+0, 0 
	MOVWF       R0 
	MOVF        Stepper_Step__i_cont_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       Stepper_Step__i_cont_L0+0, 1 
	MOVLW       0
	SUBWFB      Stepper_Step__i_cont_L0+1, 1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Stepper_Step7
;stepper_lib.h,66 :: 		Stepper_One_Step(1);
	MOVLW       1
	MOVWF       FARG_Stepper_One_Step_direcao_Stepper+0 
	CALL        _Stepper_One_Step+0, 0
;stepper_lib.h,67 :: 		}
	GOTO        L_Stepper_Step6
L_Stepper_Step7:
;stepper_lib.h,68 :: 		}
L_Stepper_Step5:
;stepper_lib.h,69 :: 		}
L_end_Stepper_Step:
	RETURN      0
; end of _Stepper_Step

_main:

;MotorDePasso.c,13 :: 		void main()
;MotorDePasso.c,15 :: 		Stepper_Init(_Stepper_FullStep, 200, 60);
	MOVLW       __Stepper_FullStep+0
	MOVWF       FARG_Stepper_Init__pStepper_+0 
	MOVLW       200
	MOVWF       FARG_Stepper_Init__nSteps+0 
	MOVLW       60
	MOVWF       FARG_Stepper_Init__rpm+0 
	CALL        _Stepper_Init+0, 0
;MotorDePasso.c,16 :: 		TRISD2_bit = 0;
	BCF         TRISD2_bit+0, BitPos(TRISD2_bit+0) 
;MotorDePasso.c,17 :: 		RD2_bit = 1;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;MotorDePasso.c,18 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;MotorDePasso.c,19 :: 		RD2_bit = 0;
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
;MotorDePasso.c,20 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;MotorDePasso.c,21 :: 		RD2_bit = 1;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;MotorDePasso.c,22 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;MotorDePasso.c,23 :: 		RD2_bit = 0;
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
;MotorDePasso.c,24 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;MotorDePasso.c,27 :: 		for(;;){
L_main12:
;MotorDePasso.c,28 :: 		Stepper_Step(25); //25*1,8 = 45°
	MOVLW       25
	MOVWF       FARG_Stepper_Step__Step_Stepper+0 
	MOVLW       0
	MOVWF       FARG_Stepper_Step__Step_Stepper+1 
	CALL        _Stepper_Step+0, 0
;MotorDePasso.c,29 :: 		delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
;MotorDePasso.c,30 :: 		}
	GOTO        L_main12
;MotorDePasso.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
