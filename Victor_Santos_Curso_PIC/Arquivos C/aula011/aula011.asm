
_main:

;aula011.c,41 :: 		void main() {
;aula011.c,42 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula011.c,43 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;aula011.c,44 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;aula011.c,45 :: 		TRISB = 0x03;  // port B RB1 e RB2 configurado com entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;aula011.c,48 :: 		while(1){
L_main0:
;aula011.c,50 :: 		if(!B0 && flagB0 == 0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main30:
;aula011.c,51 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;aula011.c,52 :: 		}
L_main4:
;aula011.c,53 :: 		if(B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main29:
;aula011.c,54 :: 		cont++;
	INCF       _cont+0, 1
;aula011.c,55 :: 		if(cont >= 8){ // esse if() é irrelevante
	MOVLW      128
	XORWF      _cont+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      8
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;aula011.c,56 :: 		cont = 8;
	MOVLW      8
	MOVWF      _cont+0
;aula011.c,57 :: 		}
L_main8:
;aula011.c,58 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;aula011.c,59 :: 		}
L_main7:
;aula011.c,62 :: 		if(!B1 && flagB1 == 0){
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
	GOTO       L_main11
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main11
L__main28:
;aula011.c,63 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;aula011.c,64 :: 		}
L_main11:
;aula011.c,65 :: 		if(B1 && flagB1 == 1){
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
	GOTO       L_main14
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main14
L__main27:
;aula011.c,66 :: 		cont--;
	DECF       _cont+0, 1
;aula011.c,67 :: 		if(cont <= 0){ // esse if() é irrelevante
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cont+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main15
;aula011.c,68 :: 		cont = 0;
	CLRF       _cont+0
;aula011.c,69 :: 		}
L_main15:
;aula011.c,70 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;aula011.c,71 :: 		}
L_main14:
;aula011.c,73 :: 		switch(cont){
	GOTO       L_main16
;aula011.c,74 :: 		case 0: LEDs = 0b00000000; break;
L_main18:
	CLRF       PORTD+0
	GOTO       L_main17
;aula011.c,75 :: 		case 1: LEDs = 0b00000001; break;
L_main19:
	MOVLW      1
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,76 :: 		case 2: LEDs = 0b00000010; break;
L_main20:
	MOVLW      2
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,77 :: 		case 3: LEDs = 0b00000100; break;
L_main21:
	MOVLW      4
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,78 :: 		case 4: LEDs = 0b00001000; break;
L_main22:
	MOVLW      8
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,79 :: 		case 5: LEDs = 0b00010000; break;
L_main23:
	MOVLW      16
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,80 :: 		case 6: LEDs = 0b00100000; break;
L_main24:
	MOVLW      32
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,81 :: 		case 7: LEDs = 0b01000000; break;
L_main25:
	MOVLW      64
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,82 :: 		case 8: LEDs = 0b10000000; break;
L_main26:
	MOVLW      128
	MOVWF      PORTD+0
	GOTO       L_main17
;aula011.c,84 :: 		}
L_main16:
	MOVF       _cont+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _cont+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _cont+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _cont+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _cont+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _cont+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _cont+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _cont+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _cont+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main26
L_main17:
;aula011.c,86 :: 		}
	GOTO       L_main0
;aula011.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
