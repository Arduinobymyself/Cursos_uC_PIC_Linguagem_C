
_main:

;PWM_FAN_Control.c,36 :: 		void main() {
;PWM_FAN_Control.c,37 :: 		CMCON = 7; // comparadores desativados
	MOVLW      7
	MOVWF      CMCON+0
;PWM_FAN_Control.c,39 :: 		ADCON0 = 0; // conversor AD desligado
	CLRF       ADCON0+0
;PWM_FAN_Control.c,40 :: 		ADCON1 = 7; // todas as entradas como digital
	MOVLW      7
	MOVWF      ADCON1+0
;PWM_FAN_Control.c,41 :: 		TRISB = 0b00000011; // port B RB0 e RB1 como entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;PWM_FAN_Control.c,42 :: 		TRISC.RC1 = 0; // pino do buzzer
	BCF        TRISC+0, 1
;PWM_FAN_Control.c,43 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;PWM_FAN_Control.c,44 :: 		TRISD = 0; // pinos de dados dos displays
	CLRF       TRISD+0
;PWM_FAN_Control.c,45 :: 		PORTD = 0;
	CLRF       PORTD+0
;PWM_FAN_Control.c,46 :: 		TRISA = 0; // pinos de controle dos displays
	CLRF       TRISA+0
;PWM_FAN_Control.c,47 :: 		PORTA = 0;
	CLRF       PORTA+0
;PWM_FAN_Control.c,49 :: 		PWM1_Init(5000);            // inicializa o PWM
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_FAN_Control.c,50 :: 		PWM1_Start();               //
	CALL       _PWM1_Start+0
;PWM_FAN_Control.c,51 :: 		PWM1_Set_Duty(valorPWM);    // configura o DutyCycle de acordo com o valor desejado
	MOVF       _valorPWM+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_FAN_Control.c,53 :: 		while(1){
L_main0:
;PWM_FAN_Control.c,55 :: 		if(B0 && flagB0 == 0){ // B0 decrementa o valor em 25%
	BTFSS      PORTB+0, 0
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main23:
;PWM_FAN_Control.c,56 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;PWM_FAN_Control.c,57 :: 		}
L_main4:
;PWM_FAN_Control.c,58 :: 		if(!B0 && flagB0 == 1){
	BTFSC      PORTB+0, 0
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main22:
;PWM_FAN_Control.c,59 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;PWM_FAN_Control.c,60 :: 		porcentagem -= 25;
	MOVLW      25
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
;PWM_FAN_Control.c,61 :: 		if(porcentagem < 0){
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      0
	SUBWF      R1+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;PWM_FAN_Control.c,62 :: 		porcentagem = 0;
	CLRF       _porcentagem+0
	CLRF       _porcentagem+1
;PWM_FAN_Control.c,63 :: 		bip();
	CALL       _bip+0
;PWM_FAN_Control.c,64 :: 		}
L_main8:
;PWM_FAN_Control.c,65 :: 		contador--;
	MOVLW      1
	SUBWF      _contador+0, 1
	BTFSS      STATUS+0, 0
	DECF       _contador+1, 1
;PWM_FAN_Control.c,66 :: 		if(contador <= 0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _contador+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _contador+0, 0
	SUBLW      0
L__main25:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;PWM_FAN_Control.c,67 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;PWM_FAN_Control.c,68 :: 		}
L_main9:
;PWM_FAN_Control.c,69 :: 		setPWM(porcentagem);
	MOVF       _porcentagem+0, 0
	MOVWF      FARG_setPWM_porcentagem+0
	MOVF       _porcentagem+1, 0
	MOVWF      FARG_setPWM_porcentagem+1
	CALL       _setPWM+0
;PWM_FAN_Control.c,70 :: 		}
L_main7:
;PWM_FAN_Control.c,72 :: 		if(B1 && flagB1 == 0){ // B1 incrementa o valor em 25%
	BTFSS      PORTB+0, 1
	GOTO       L_main12
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main12
L__main21:
;PWM_FAN_Control.c,73 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;PWM_FAN_Control.c,74 :: 		}
L_main12:
;PWM_FAN_Control.c,75 :: 		if(!B1 && flagB1 == 1){
	BTFSC      PORTB+0, 1
	GOTO       L_main15
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main15
L__main20:
;PWM_FAN_Control.c,76 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;PWM_FAN_Control.c,77 :: 		porcentagem += 25;
	MOVLW      25
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
;PWM_FAN_Control.c,78 :: 		if(porcentagem > 100){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       R1+0, 0
	SUBLW      100
L__main26:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;PWM_FAN_Control.c,79 :: 		porcentagem = 100;
	MOVLW      100
	MOVWF      _porcentagem+0
	MOVLW      0
	MOVWF      _porcentagem+1
;PWM_FAN_Control.c,80 :: 		bip();
	CALL       _bip+0
;PWM_FAN_Control.c,81 :: 		}
L_main16:
;PWM_FAN_Control.c,82 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;PWM_FAN_Control.c,83 :: 		if(contador >= 4){
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      4
	SUBWF      _contador+0, 0
L__main27:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;PWM_FAN_Control.c,84 :: 		contador = 4;
	MOVLW      4
	MOVWF      _contador+0
	MOVLW      0
	MOVWF      _contador+1
;PWM_FAN_Control.c,85 :: 		}
L_main17:
;PWM_FAN_Control.c,86 :: 		setPWM(porcentagem);
	MOVF       _porcentagem+0, 0
	MOVWF      FARG_setPWM_porcentagem+0
	MOVF       _porcentagem+1, 0
	MOVWF      FARG_setPWM_porcentagem+1
	CALL       _setPWM+0
;PWM_FAN_Control.c,87 :: 		}
L_main15:
;PWM_FAN_Control.c,94 :: 		displaySpeed(porcentagem);
	MOVF       _porcentagem+0, 0
	MOVWF      FARG_displaySpeed_contador+0
	MOVF       _porcentagem+1, 0
	MOVWF      FARG_displaySpeed_contador+1
	CALL       _displaySpeed+0
;PWM_FAN_Control.c,96 :: 		}
	GOTO       L_main0
;PWM_FAN_Control.c,98 :: 		}
	GOTO       $+0
; end of _main

_displaySpeed:

;PWM_FAN_Control.c,101 :: 		void displaySpeed(int valorNumerico){
;PWM_FAN_Control.c,104 :: 		valor = valorNumerico/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_displaySpeed_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_displaySpeed_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;PWM_FAN_Control.c,105 :: 		PORTD = numero[valor];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;PWM_FAN_Control.c,106 :: 		PORTA = display[1];
	MOVF       _display+2, 0
	MOVWF      PORTA+0
;PWM_FAN_Control.c,107 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_FAN_Control.c,110 :: 		valor = valorNumerico/100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_displaySpeed_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_displaySpeed_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;PWM_FAN_Control.c,111 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;PWM_FAN_Control.c,112 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;PWM_FAN_Control.c,113 :: 		PORTA = display[2];
	MOVF       _display+4, 0
	MOVWF      PORTA+0
;PWM_FAN_Control.c,114 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_FAN_Control.c,117 :: 		valor = valorNumerico/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_displaySpeed_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_displaySpeed_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;PWM_FAN_Control.c,118 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;PWM_FAN_Control.c,119 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;PWM_FAN_Control.c,120 :: 		PORTA = display[3];
	MOVF       _display+6, 0
	MOVWF      PORTA+0
;PWM_FAN_Control.c,121 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_FAN_Control.c,125 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_displaySpeed_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_displaySpeed_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;PWM_FAN_Control.c,126 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;PWM_FAN_Control.c,127 :: 		PORTA = display[4];
	MOVF       _display+8, 0
	MOVWF      PORTA+0
;PWM_FAN_Control.c,128 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;PWM_FAN_Control.c,130 :: 		}
	RETURN
; end of _displaySpeed

_setPWM:

;PWM_FAN_Control.c,132 :: 		void setPWM(int porcentagem){
;PWM_FAN_Control.c,134 :: 		valorPWM = (porcentagem*255)/100;
	MOVF       FARG_setPWM_porcentagem+0, 0
	MOVWF      R0+0
	MOVF       FARG_setPWM_porcentagem+1, 0
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
;PWM_FAN_Control.c,135 :: 		PWM1_Set_Duty(valorPWM);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_FAN_Control.c,136 :: 		}
	RETURN
; end of _setPWM

_bip:

;PWM_FAN_Control.c,138 :: 		void bip(){
;PWM_FAN_Control.c,139 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;PWM_FAN_Control.c,140 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_bip18:
	DECFSZ     R13+0, 1
	GOTO       L_bip18
	DECFSZ     R12+0, 1
	GOTO       L_bip18
	DECFSZ     R11+0, 1
	GOTO       L_bip18
	NOP
	NOP
;PWM_FAN_Control.c,141 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;PWM_FAN_Control.c,142 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_bip19:
	DECFSZ     R13+0, 1
	GOTO       L_bip19
	DECFSZ     R12+0, 1
	GOTO       L_bip19
	DECFSZ     R11+0, 1
	GOTO       L_bip19
	NOP
	NOP
;PWM_FAN_Control.c,143 :: 		}
	RETURN
; end of _bip
