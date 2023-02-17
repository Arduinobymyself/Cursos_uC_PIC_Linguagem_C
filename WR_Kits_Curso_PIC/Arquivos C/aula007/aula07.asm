
_main:

;aula07.c,6 :: 		void main() {
;aula07.c,8 :: 		trisb = 0x00; // port b como saída
	CLRF       TRISB+0
;aula07.c,9 :: 		portb = 0xff; // port b inicia em 1 leds apagados (current sinking)
	MOVLW      255
	MOVWF      PORTB+0
;aula07.c,12 :: 		while(1){
L_main0:
;aula07.c,13 :: 		portb = control; // desliga todos os leds
	MOVF       _control+0, 0
	MOVWF      PORTB+0
;aula07.c,14 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;aula07.c,15 :: 		control = control << 1; // desloca para esquerda em um bit (insere um zero)
	RLF        _control+0, 1
	RLF        _control+1, 1
	BCF        _control+0, 0
;aula07.c,16 :: 		if(portb == 0x00){
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;aula07.c,17 :: 		control = 0xff;
	MOVLW      255
	MOVWF      _control+0
	CLRF       _control+1
;aula07.c,18 :: 		}
L_main3:
;aula07.c,19 :: 		}
	GOTO       L_main0
;aula07.c,21 :: 		}
	GOTO       $+0
; end of _main
