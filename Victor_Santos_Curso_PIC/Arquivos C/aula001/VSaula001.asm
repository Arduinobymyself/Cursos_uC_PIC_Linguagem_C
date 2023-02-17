
_main:
;VSaula001.c,29 :: 		void main() {
;VSaula001.c,30 :: 		cmcon = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula001.c,31 :: 		trisD = 0x00;  // RD0 a RD7 como saída digital
	CLRF       TRISD+0
;VSaula001.c,32 :: 		portA = 0x00;  // RD0 a RD7 iniciam em nível baixo
	CLRF       PORTA+0
;VSaula001.c,34 :: 		while(1){ // liga alternadamente os leds no port D
L_main0:
;VSaula001.c,35 :: 		portd = 0b10101010; // 0xAA, 170
	MOVLW      170
	MOVWF      PORTD+0
;VSaula001.c,36 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;VSaula001.c,37 :: 		portd = 0b01010101; // 0x55, 85
	MOVLW      85
	MOVWF      PORTD+0
;VSaula001.c,38 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;VSaula001.c,39 :: 		}
	GOTO       L_main0
;VSaula001.c,40 :: 		}
	GOTO       $+0
; end of _main
