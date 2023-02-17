
_main:

;aula036.c,27 :: 		void main() {
;aula036.c,28 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula036.c,29 :: 		OPTION_REG = 0b10001110; // RBPU = 1 (PullUp desabilitado), PSA = 1 (WDT), PS<2:0> = 110 (prescaler 1:128)
	MOVLW      142
	MOVWF      OPTION_REG+0
;aula036.c,31 :: 		TRISB = 0;
	CLRF       TRISB+0
;aula036.c,32 :: 		PORTB = 0;
	CLRF       PORTB+0
;aula036.c,34 :: 		L7 = 1;
	BSF        RB7_bit+0, 7
;aula036.c,36 :: 		asm clrwdt; // comando assembly para limpar o WDT
	CLRWDT
;aula036.c,38 :: 		while(1)
L_main0:
;aula036.c,40 :: 		asm clrwdt;
	CLRWDT
;aula036.c,41 :: 		L0 = ~L0;
	MOVLW      1
	XORWF      RB0_bit+0, 1
;aula036.c,42 :: 		delay_ms(300);
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
;aula036.c,43 :: 		}
	GOTO       L_main0
;aula036.c,45 :: 		}
	GOTO       $+0
; end of _main
