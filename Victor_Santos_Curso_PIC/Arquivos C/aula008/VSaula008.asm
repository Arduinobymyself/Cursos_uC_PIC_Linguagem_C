
_main:

;VSaula008.c,41 :: 		void main() {
;VSaula008.c,42 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula008.c,43 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula008.c,44 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula008.c,45 :: 		TRISB = 0x03;  // port B RB1 e RB2 configurado com entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;VSaula008.c,48 :: 		while(1){
L_main0:
;VSaula008.c,130 :: 		if (B0 && flagS0 == 0){
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
	GOTO       L_main4
	BTFSC      _flagS0+0, BitPos(_flagS0+0)
	GOTO       L_main4
L__main17:
;VSaula008.c,131 :: 		flagS0 = 1;
	BSF        _flagS0+0, BitPos(_flagS0+0)
;VSaula008.c,132 :: 		}
L_main4:
;VSaula008.c,133 :: 		if (B1 && flagS1 == 0){
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
	GOTO       L_main7
	BTFSC      _flagS1+0, BitPos(_flagS1+0)
	GOTO       L_main7
L__main16:
;VSaula008.c,134 :: 		flagS1 = 1;
	BSF        _flagS1+0, BitPos(_flagS1+0)
;VSaula008.c,135 :: 		}
L_main7:
;VSaula008.c,136 :: 		if (!B0 && flagS0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	BTFSS      _flagS0+0, BitPos(_flagS0+0)
	GOTO       L_main10
L__main15:
;VSaula008.c,137 :: 		L6 = ~L6;
	MOVLW
	XORWF      RD6_bit+0, 1
;VSaula008.c,138 :: 		flagS0 = 0;
	BCF        _flagS0+0, BitPos(_flagS0+0)
;VSaula008.c,139 :: 		}
L_main10:
;VSaula008.c,140 :: 		if (!B1 && flagS1 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	BTFSS      _flagS1+0, BitPos(_flagS1+0)
	GOTO       L_main13
L__main14:
;VSaula008.c,141 :: 		L7 = ~L7;
	MOVLW
	XORWF      RD7_bit+0, 1
;VSaula008.c,142 :: 		flagS1 = 0;
	BCF        _flagS1+0, BitPos(_flagS1+0)
;VSaula008.c,143 :: 		}
L_main13:
;VSaula008.c,151 :: 		}
	GOTO       L_main0
;VSaula008.c,152 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
