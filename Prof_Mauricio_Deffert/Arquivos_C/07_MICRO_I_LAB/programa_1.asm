
_main:

;programa_1.c,6 :: 		void main() {
;programa_1.c,7 :: 		ADCON1 = 0X07;         // todos os pinos como entrada e saída digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_1.c,8 :: 		TRISB = 0b00000001;    // RB0 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;programa_1.c,9 :: 		TRISD = 0X00;
	CLRF       TRISD+0
;programa_1.c,10 :: 		PORTD = 0X00;
	CLRF       PORTD+0
;programa_1.c,12 :: 		while(TRUE){
L_main0:
;programa_1.c,13 :: 		if(B0 && statusB0 == 0){
	BTFSS      PORTB+0, 0
	GOTO       L_main4
	MOVF       _statusB0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main11:
;programa_1.c,14 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;programa_1.c,15 :: 		statusB0 = 1;
	MOVLW      1
	MOVWF      _statusB0+0
;programa_1.c,16 :: 		PORTD = ~PORTD;
	COMF       PORTD+0, 1
;programa_1.c,17 :: 		}
L_main4:
;programa_1.c,18 :: 		if(!B0 && statusB0 == 1){
	BTFSC      PORTB+0, 0
	GOTO       L_main8
	MOVF       _statusB0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main10:
;programa_1.c,19 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;programa_1.c,20 :: 		statusB0 = 0;
	CLRF       _statusB0+0
;programa_1.c,21 :: 		}
L_main8:
;programa_1.c,22 :: 		}
	GOTO       L_main0
;programa_1.c,24 :: 		}
	GOTO       $+0
; end of _main
