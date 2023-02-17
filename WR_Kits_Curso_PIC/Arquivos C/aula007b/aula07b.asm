
_main:

;aula07b.c,3 :: 		void main() {
;aula07b.c,5 :: 		trisb = 0x00; // port b como saída
	CLRF       TRISB+0
;aula07b.c,6 :: 		portb = 0xff; // port b inicia em nível alto
	MOVLW      255
	MOVWF      PORTB+0
;aula07b.c,9 :: 		while(1){
L_main0:
;aula07b.c,10 :: 		portb = control; // liga todos os leds
	MOVF       _control+0, 0
	MOVWF      PORTB+0
;aula07b.c,11 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;aula07b.c,12 :: 		control = control << 1; // desloca para esquerda
	MOVF       _control+0, 0
	MOVWF      R1+0
	MOVF       _control+1, 0
	MOVWF      R1+1
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	MOVWF      _control+0
	MOVF       R1+1, 0
	MOVWF      _control+1
;aula07b.c,13 :: 		if(control == 0b10000000){
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      128
	XORWF      R1+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;aula07b.c,14 :: 		while(control != 0b00000001){
L_main4:
	MOVLW      0
	XORWF      _control+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      1
	XORWF      _control+0, 0
L__main8:
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;aula07b.c,15 :: 		portb = control;
	MOVF       _control+0, 0
	MOVWF      PORTB+0
;aula07b.c,16 :: 		control = control >> 1; // Ddesloca para direita
	RRF        _control+1, 1
	RRF        _control+0, 1
	BCF        _control+1, 7
	BTFSC      _control+1, 6
	BSF        _control+1, 7
;aula07b.c,17 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;aula07b.c,18 :: 		}
	GOTO       L_main4
L_main5:
;aula07b.c,20 :: 		}
L_main3:
;aula07b.c,21 :: 		}
	GOTO       L_main0
;aula07b.c,23 :: 		}
	GOTO       $+0
; end of _main
