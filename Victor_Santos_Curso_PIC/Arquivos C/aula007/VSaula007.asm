
_main:
;VSaula007.c,34 :: 		void main() {
;VSaula007.c,35 :: 		cmcon = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula007.c,36 :: 		trisD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula007.c,37 :: 		trisB = 0x03;  // port B RB1 e RB2 configurado com entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;VSaula007.c,39 :: 		portD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula007.c,41 :: 		while(1){
L_main0:
;VSaula007.c,61 :: 		if (Button(&PORTB, 0, 50, 1)) L6 = 1;
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
	BSF        RD6_bit+0, 6
	GOTO       L_main3
L_main2:
;VSaula007.c,62 :: 		else L6 = 0;
	BCF        RD6_bit+0, 6
L_main3:
;VSaula007.c,63 :: 		if (Button(&PORTB, 1, 50, 0)) L7 = 1;
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BSF        RD7_bit+0, 7
	GOTO       L_main5
L_main4:
;VSaula007.c,64 :: 		else L7 = 0;
	BCF        RD7_bit+0, 7
L_main5:
;VSaula007.c,70 :: 		}
	GOTO       L_main0
;VSaula007.c,71 :: 		}
	GOTO       $+0
; end of _main
