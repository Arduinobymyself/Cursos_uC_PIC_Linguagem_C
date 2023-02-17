
_main:

;programa_2.c,11 :: 		void main() {
;programa_2.c,12 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_2.c,13 :: 		TRISB = 0XFF;
	MOVLW      255
	MOVWF      TRISB+0
;programa_2.c,14 :: 		PORTB = 0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;programa_2.c,15 :: 		TRISC = 0;
	CLRF       TRISC+0
;programa_2.c,16 :: 		PORTC = 0;
	CLRF       PORTC+0
;programa_2.c,17 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_2.c,18 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,20 :: 		while(1){
L_main0:
;programa_2.c,21 :: 		if(START == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_2.c,22 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;programa_2.c,23 :: 		MOTOR_ON_DIR;
	BSF        PORTC+0, 6
	BCF        PORTC+0, 7
;programa_2.c,24 :: 		}
L_main2:
;programa_2.c,26 :: 		if(SB == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main4
;programa_2.c,27 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;programa_2.c,28 :: 		MOTOR_OFF;
	BCF        PORTC+0, 6
	BCF        PORTC+0, 7
;programa_2.c,29 :: 		while(PORTD < 16){
L_main6:
	MOVLW      16
	SUBWF      PORTD+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;programa_2.c,30 :: 		PORTD++;
	INCF       PORTD+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;programa_2.c,31 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;programa_2.c,32 :: 		}
	GOTO       L_main6
L_main7:
;programa_2.c,33 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,34 :: 		MOTOR_ON_ESQ;
	BCF        PORTC+0, 6
	BSF        PORTC+0, 7
;programa_2.c,35 :: 		}
L_main4:
;programa_2.c,37 :: 		if(SA == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main9
;programa_2.c,38 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;programa_2.c,39 :: 		MOTOR_OFF;
	BCF        PORTC+0, 6
	BCF        PORTC+0, 7
;programa_2.c,40 :: 		while(PORTD < 16){
L_main11:
	MOVLW      16
	SUBWF      PORTD+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;programa_2.c,41 :: 		PORTD++;
	INCF       PORTD+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;programa_2.c,42 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;programa_2.c,43 :: 		}
	GOTO       L_main11
L_main12:
;programa_2.c,44 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,45 :: 		MOTOR_ON_DIR;
	BSF        PORTC+0, 6
	BCF        PORTC+0, 7
;programa_2.c,46 :: 		}
L_main9:
;programa_2.c,48 :: 		if(STOP == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_main14
;programa_2.c,49 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	NOP
	NOP
;programa_2.c,50 :: 		MOTOR_OFF;
	BCF        PORTC+0, 6
	BCF        PORTC+0, 7
;programa_2.c,51 :: 		}
L_main14:
;programa_2.c,57 :: 		}
	GOTO       L_main0
;programa_2.c,60 :: 		}
	GOTO       $+0
; end of _main
