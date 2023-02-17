
_main:

;programa_1.c,13 :: 		void main() {
;programa_1.c,14 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_1.c,15 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;programa_1.c,17 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;programa_1.c,18 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;programa_1.c,19 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;programa_1.c,20 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_1.c,22 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;programa_1.c,23 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_1.c,24 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_1.c,26 :: 		while(1){
L_main0:
;programa_1.c,27 :: 		PORTD.RD7 = ~PORTD.RD7;
	MOVLW      128
	XORWF      PORTD+0, 1
;programa_1.c,28 :: 		delay_ms(10000);
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;programa_1.c,29 :: 		}
	GOTO       L_main0
;programa_1.c,31 :: 		}
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

;programa_1.c,34 :: 		void interrupt(){
;programa_1.c,35 :: 		if(INTCON.INTF == 1){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt3
;programa_1.c,36 :: 		PORTD.RD0 = ~PORTD.RD0;
	MOVLW      1
	XORWF      PORTD+0, 1
;programa_1.c,37 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_1.c,38 :: 		}
L_interrupt3:
;programa_1.c,39 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
