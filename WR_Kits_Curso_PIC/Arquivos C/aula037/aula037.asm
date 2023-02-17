
_main:

;aula037.c,31 :: 		void main() {
;aula037.c,32 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula037.c,33 :: 		OPTION_REG = 0b10001110; // RBPU = 1 (PullUp desabilitado), PSA = 1 (WDT), PS<2:0> = 110 (prescaler 1:128)
	MOVLW      142
	MOVWF      OPTION_REG+0
;aula037.c,34 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;aula037.c,35 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;aula037.c,36 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;aula037.c,38 :: 		TRISA = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;aula037.c,39 :: 		PORTA = 0b00000011;
	MOVLW      3
	MOVWF      PORTA+0
;aula037.c,40 :: 		TRISB = 0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;aula037.c,41 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;aula037.c,43 :: 		L1 = 0;
	BCF        RA3_bit+0, 3
;aula037.c,44 :: 		L2 = 0;
	BCF        RA2_bit+0, 2
;aula037.c,46 :: 		control = 0;
	BCF        _control+0, BitPos(_control+0)
;aula037.c,48 :: 		while(1)
L_main0:
;aula037.c,50 :: 		L1 = ~L1;
	MOVLW      8
	XORWF      RA3_bit+0, 1
;aula037.c,51 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;aula037.c,52 :: 		}
	GOTO       L_main0
;aula037.c,54 :: 		}
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula037.c,57 :: 		void interrupt(){
;aula037.c,58 :: 		if(INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt3
;aula037.c,59 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;aula037.c,60 :: 		control = ~control;
	MOVLW
	XORWF      _control+0, 1
;aula037.c,61 :: 		L2 = ~L2;
	MOVLW      4
	XORWF      RA2_bit+0, 1
;aula037.c,62 :: 		if(control){
	BTFSS      _control+0, BitPos(_control+0)
	GOTO       L_interrupt4
;aula037.c,63 :: 		asm sleep; // coloca o uC em modo sleep
	SLEEP
;aula037.c,64 :: 		}
L_interrupt4:
;aula037.c,65 :: 		}
L_interrupt3:
;aula037.c,66 :: 		}
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
