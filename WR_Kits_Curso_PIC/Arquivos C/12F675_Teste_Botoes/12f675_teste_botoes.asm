
_main:

;12f675_teste_botoes.c,9 :: 		void main() {
;12f675_teste_botoes.c,10 :: 		ANSEL = 0;    // desliga as entradas AD
	CLRF       ANSEL+0
;12f675_teste_botoes.c,11 :: 		CMCON = 7;    // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;12f675_teste_botoes.c,14 :: 		TRISIO = 0b00110000;
	MOVLW      48
	MOVWF      TRISIO+0
;12f675_teste_botoes.c,15 :: 		GPIO = 0b00110000;
	MOVLW      48
	MOVWF      GPIO+0
;12f675_teste_botoes.c,16 :: 		while(1){
L_main0:
;12f675_teste_botoes.c,18 :: 		if(!B5 && flagB5 == 0){
	MOVLW      GPIO+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB5+0, BitPos(_flagB5+0)
	GOTO       L_main4
L__main17:
;12f675_teste_botoes.c,19 :: 		flagB5 = 1;
	BSF        _flagB5+0, BitPos(_flagB5+0)
;12f675_teste_botoes.c,20 :: 		}
L_main4:
;12f675_teste_botoes.c,21 :: 		if(B5 && flagB5 == 1){
	MOVLW      GPIO+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB5+0, BitPos(_flagB5+0)
	GOTO       L_main7
L__main16:
;12f675_teste_botoes.c,22 :: 		flagB5 = 0;
	BCF        _flagB5+0, BitPos(_flagB5+0)
;12f675_teste_botoes.c,23 :: 		L0 = ~L0;
	MOVLW      1
	XORWF      GPIO+0, 1
;12f675_teste_botoes.c,24 :: 		}
L_main7:
;12f675_teste_botoes.c,26 :: 		if(!B4 && flagB4 == 0){
	MOVLW      GPIO+0
	MOVWF      FARG_Button_port+0
	MOVLW      4
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	BTFSC      _flagB4+0, BitPos(_flagB4+0)
	GOTO       L_main10
L__main15:
;12f675_teste_botoes.c,27 :: 		flagB4 = 1;
	BSF        _flagB4+0, BitPos(_flagB4+0)
;12f675_teste_botoes.c,28 :: 		}
L_main10:
;12f675_teste_botoes.c,29 :: 		if(B4 && flagB4 == 1){
	MOVLW      GPIO+0
	MOVWF      FARG_Button_port+0
	MOVLW      4
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	BTFSS      _flagB4+0, BitPos(_flagB4+0)
	GOTO       L_main13
L__main14:
;12f675_teste_botoes.c,30 :: 		flagB4 = 0;
	BCF        _flagB4+0, BitPos(_flagB4+0)
;12f675_teste_botoes.c,31 :: 		L1 = ~L1;
	MOVLW      2
	XORWF      GPIO+0, 1
;12f675_teste_botoes.c,32 :: 		}
L_main13:
;12f675_teste_botoes.c,34 :: 		}
	GOTO       L_main0
;12f675_teste_botoes.c,37 :: 		}
	GOTO       $+0
; end of _main
