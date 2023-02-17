
_main:

;Controle_Motor_Passo.c,45 :: 		void main() {
;Controle_Motor_Passo.c,47 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Controle_Motor_Passo.c,48 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Controle_Motor_Passo.c,49 :: 		TRISA = 0;
	CLRF       TRISA+0
;Controle_Motor_Passo.c,50 :: 		PORTA = 0;
	CLRF       PORTA+0
;Controle_Motor_Passo.c,51 :: 		TRISB = 7;
	MOVLW      7
	MOVWF      TRISB+0
;Controle_Motor_Passo.c,52 :: 		TRISC = 0;
	CLRF       TRISC+0
;Controle_Motor_Passo.c,53 :: 		PORTC = 0;
	CLRF       PORTC+0
;Controle_Motor_Passo.c,54 :: 		TRISD = 0;
	CLRF       TRISD+0
;Controle_Motor_Passo.c,55 :: 		PORTD = 0;
	CLRF       PORTD+0
;Controle_Motor_Passo.c,57 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;Controle_Motor_Passo.c,59 :: 		while(1){
L_main0:
;Controle_Motor_Passo.c,61 :: 		PORTD = texto[velocidade];
	MOVF       _velocidade+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Controle_Motor_Passo.c,63 :: 		speed();
	CALL       _speed+0
;Controle_Motor_Passo.c,65 :: 		if(B2 && flagB2 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main4
L__main32:
;Controle_Motor_Passo.c,66 :: 		flagB2 = 1;
	BSF        _flagB2+0, BitPos(_flagB2+0)
;Controle_Motor_Passo.c,67 :: 		}
L_main4:
;Controle_Motor_Passo.c,68 :: 		if(!B2 && flagB2 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main7
L__main31:
;Controle_Motor_Passo.c,69 :: 		flagB2 = 0;
	BCF        _flagB2+0, BitPos(_flagB2+0)
;Controle_Motor_Passo.c,71 :: 		if(flagCW){
	MOVF       _flagCW+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;Controle_Motor_Passo.c,72 :: 		flagCW = 0;
	CLRF       _flagCW+0
;Controle_Motor_Passo.c,73 :: 		flagCCW = 1;
	MOVLW      1
	MOVWF      _flagCCW+0
;Controle_Motor_Passo.c,74 :: 		} else if(flagCCW){
	GOTO       L_main9
L_main8:
	MOVF       _flagCCW+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;Controle_Motor_Passo.c,75 :: 		flagCCW = 0;
	CLRF       _flagCCW+0
;Controle_Motor_Passo.c,76 :: 		flagCW = 1;
	MOVLW      1
	MOVWF      _flagCW+0
;Controle_Motor_Passo.c,77 :: 		}
L_main10:
L_main9:
;Controle_Motor_Passo.c,79 :: 		}
L_main7:
;Controle_Motor_Passo.c,81 :: 		CCW();
	CALL       _CCW+0
;Controle_Motor_Passo.c,82 :: 		CW();
	CALL       _CW+0
;Controle_Motor_Passo.c,85 :: 		}
	GOTO       L_main0
;Controle_Motor_Passo.c,88 :: 		}
	GOTO       $+0
; end of _main

_speed:

;Controle_Motor_Passo.c,90 :: 		void speed(){
;Controle_Motor_Passo.c,92 :: 		if(B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_speed13
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_speed13
L__speed38:
;Controle_Motor_Passo.c,93 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Motor_Passo.c,94 :: 		}
L_speed13:
;Controle_Motor_Passo.c,95 :: 		if(!B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_speed16
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_speed16
L__speed37:
;Controle_Motor_Passo.c,96 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Motor_Passo.c,97 :: 		tempo -= 100;
	MOVLW      100
	SUBWF      _tempo+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _tempo+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _tempo+0
	MOVF       R1+1, 0
	MOVWF      _tempo+1
;Controle_Motor_Passo.c,98 :: 		velocidade++;
	INCF       _velocidade+0, 1
;Controle_Motor_Passo.c,99 :: 		if(tempo < 100 || velocidade > 4){
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__speed39
	MOVLW      100
	SUBWF      R1+0, 0
L__speed39:
	BTFSS      STATUS+0, 0
	GOTO       L__speed36
	MOVF       _velocidade+0, 0
	SUBLW      4
	BTFSS      STATUS+0, 0
	GOTO       L__speed36
	GOTO       L_speed19
L__speed36:
;Controle_Motor_Passo.c,100 :: 		tempo = 100;
	MOVLW      100
	MOVWF      _tempo+0
	MOVLW      0
	MOVWF      _tempo+1
;Controle_Motor_Passo.c,101 :: 		velocidade = 4;
	MOVLW      4
	MOVWF      _velocidade+0
;Controle_Motor_Passo.c,102 :: 		}
L_speed19:
;Controle_Motor_Passo.c,103 :: 		}
L_speed16:
;Controle_Motor_Passo.c,105 :: 		if(B1 && flagB1 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_speed22
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_speed22
L__speed35:
;Controle_Motor_Passo.c,106 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Motor_Passo.c,107 :: 		}
L_speed22:
;Controle_Motor_Passo.c,108 :: 		if(!B1 && flagB1 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_speed25
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_speed25
L__speed34:
;Controle_Motor_Passo.c,109 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Motor_Passo.c,110 :: 		tempo += 100;
	MOVLW      100
	ADDWF      _tempo+0, 0
	MOVWF      R1+0
	MOVF       _tempo+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _tempo+0
	MOVF       R1+1, 0
	MOVWF      _tempo+1
;Controle_Motor_Passo.c,111 :: 		velocidade--;
	DECF       _velocidade+0, 1
;Controle_Motor_Passo.c,112 :: 		if(tempo > 400 || velocidade < 1){
	MOVF       R1+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__speed40
	MOVF       R1+0, 0
	SUBLW      144
L__speed40:
	BTFSS      STATUS+0, 0
	GOTO       L__speed33
	MOVLW      1
	SUBWF      _velocidade+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__speed33
	GOTO       L_speed28
L__speed33:
;Controle_Motor_Passo.c,113 :: 		tempo = 400;
	MOVLW      144
	MOVWF      _tempo+0
	MOVLW      1
	MOVWF      _tempo+1
;Controle_Motor_Passo.c,114 :: 		velocidade = 1;
	MOVLW      1
	MOVWF      _velocidade+0
;Controle_Motor_Passo.c,115 :: 		}
L_speed28:
;Controle_Motor_Passo.c,116 :: 		}
L_speed25:
;Controle_Motor_Passo.c,118 :: 		}
	RETURN
; end of _speed

_CCW:

;Controle_Motor_Passo.c,120 :: 		void CCW(){
;Controle_Motor_Passo.c,123 :: 		if(flagCCW){
	MOVF       _flagCCW+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CCW29
;Controle_Motor_Passo.c,124 :: 		PORTA.RA0 = 0;
	BCF        PORTA+0, 0
;Controle_Motor_Passo.c,125 :: 		PORTA.RA1 = 1;
	BSF        PORTA+0, 1
;Controle_Motor_Passo.c,127 :: 		PORTC = 0b00000001; // A-1=1 (RC0)
	MOVLW      1
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,128 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,129 :: 		PORTC = 0b00000010; // A-2=1 (RC1)
	MOVLW      2
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,130 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,131 :: 		PORTC = 0b00000100; // B-2=1 (RC2)
	MOVLW      4
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,132 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,133 :: 		PORTC = 0b00001000; // B-1=1 (RC3)
	MOVLW      8
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,134 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,135 :: 		}
L_CCW29:
;Controle_Motor_Passo.c,137 :: 		}
	RETURN
; end of _CCW

_CW:

;Controle_Motor_Passo.c,139 :: 		void CW(){
;Controle_Motor_Passo.c,141 :: 		if(flagCW){
	MOVF       _flagCW+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CW30
;Controle_Motor_Passo.c,143 :: 		PORTA.RA0 = 1;
	BSF        PORTA+0, 0
;Controle_Motor_Passo.c,144 :: 		PORTA.RA1 = 0;
	BCF        PORTA+0, 1
;Controle_Motor_Passo.c,146 :: 		PORTC = 0b00000001; // A-1=1 (RC0)
	MOVLW      1
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,147 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,148 :: 		PORTC = 0b00001000; // B-1=1 (RC3)
	MOVLW      8
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,149 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,150 :: 		PORTC = 0b00000100; // B-2=1 (RC2)
	MOVLW      4
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,151 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,152 :: 		PORTC = 0b00000010; // A-2=1 (RC1)
	MOVLW      2
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,153 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,154 :: 		}
L_CW30:
;Controle_Motor_Passo.c,156 :: 		}
	RETURN
; end of _CW
