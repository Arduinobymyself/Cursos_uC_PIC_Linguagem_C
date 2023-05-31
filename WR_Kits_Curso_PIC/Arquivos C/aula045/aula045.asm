
_main:

;aula045.c,27 :: 		void main() {
;aula045.c,29 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;aula045.c,30 :: 		OPTION_REG = 0x87; //0b10000111
	MOVLW      135
	MOVWF      OPTION_REG+0
;aula045.c,31 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, 7
;aula045.c,32 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, 6
;aula045.c,33 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, 5
;aula045.c,34 :: 		ADON_bit = 1;
	BSF        ADON_bit+0, 0
;aula045.c,35 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;aula045.c,36 :: 		TRISA = 0xFF; // 0b00000001;
	MOVLW      255
	MOVWF      TRISA+0
;aula045.c,37 :: 		TRISC = 0XFE; // 0b00000000;
	MOVLW      254
	MOVWF      TRISC+0
;aula045.c,38 :: 		PORTC = 0XFE; // 0b00000000;
	MOVLW      254
	MOVWF      PORTC+0
;aula045.c,40 :: 		duty = 23; // duty-cycle servo centralizado
	MOVLW      23
	MOVWF      _duty+0
;aula045.c,42 :: 		while(1){
L_main0:
;aula045.c,43 :: 		servo_slowUp();
	CALL       _servo_slowUp+0
;aula045.c,44 :: 		delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;aula045.c,45 :: 		servo_slowDown();
	CALL       _servo_slowDown+0
;aula045.c,46 :: 		delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;aula045.c,47 :: 		}
	GOTO       L_main0
;aula045.c,48 :: 		}
	GOTO       $+0
; end of _main

_servo_slowUp:

;aula045.c,52 :: 		void servo_slowUp(){
;aula045.c,54 :: 		for(i=9; i<38;i++){
	MOVLW      9
	MOVWF      servo_slowUp_i_L0+0
L_servo_slowUp4:
	MOVLW      38
	SUBWF      servo_slowUp_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_servo_slowUp5
;aula045.c,55 :: 		duty = i;
	MOVF       servo_slowUp_i_L0+0, 0
	MOVWF      _duty+0
;aula045.c,56 :: 		Vdelay_ms(tempo);
	MOVLW      50
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula045.c,54 :: 		for(i=9; i<38;i++){
	INCF       servo_slowUp_i_L0+0, 1
;aula045.c,57 :: 		}
	GOTO       L_servo_slowUp4
L_servo_slowUp5:
;aula045.c,58 :: 		}
	RETURN
; end of _servo_slowUp

_servo_slowDown:

;aula045.c,60 :: 		void servo_slowDown(){
;aula045.c,62 :: 		for(i=37; i>8;i--){
	MOVLW      37
	MOVWF      servo_slowDown_i_L0+0
L_servo_slowDown7:
	MOVF       servo_slowDown_i_L0+0, 0
	SUBLW      8
	BTFSC      STATUS+0, 0
	GOTO       L_servo_slowDown8
;aula045.c,63 :: 		duty = i;
	MOVF       servo_slowDown_i_L0+0, 0
	MOVWF      _duty+0
;aula045.c,64 :: 		Vdelay_ms(tempo);
	MOVLW      50
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula045.c,62 :: 		for(i=37; i>8;i--){
	DECF       servo_slowDown_i_L0+0, 1
;aula045.c,65 :: 		}
	GOTO       L_servo_slowDown7
L_servo_slowDown8:
;aula045.c,66 :: 		}
	RETURN
; end of _servo_slowDown

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula045.c,69 :: 		void interrupt(){
;aula045.c,71 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt10
;aula045.c,72 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, 2
;aula045.c,73 :: 		if(servo1){
	BTFSS      RC0_bit+0, 0
	GOTO       L_interrupt11
;aula045.c,74 :: 		TMR0 = duty;
	MOVF       _duty+0, 0
	MOVWF      TMR0+0
;aula045.c,75 :: 		servo1 = 0;
	BCF        RC0_bit+0, 0
;aula045.c,76 :: 		} else {
	GOTO       L_interrupt12
L_interrupt11:
;aula045.c,77 :: 		TMR0 = 255 - duty;
	MOVF       _duty+0, 0
	SUBLW      255
	MOVWF      TMR0+0
;aula045.c,78 :: 		servo1 = 1;
	BSF        RC0_bit+0, 0
;aula045.c,79 :: 		}
L_interrupt12:
;aula045.c,80 :: 		}
L_interrupt10:
;aula045.c,85 :: 		}
L__interrupt13:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
