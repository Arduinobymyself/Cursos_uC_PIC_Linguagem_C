
_main:

;VSaula036_Timer0Contador.c,6 :: 		void main() {
;VSaula036_Timer0Contador.c,7 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula036_Timer0Contador.c,8 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula036_Timer0Contador.c,9 :: 		TRISA = 0b00001000; // RA4 como entrada
	MOVLW      8
	MOVWF      TRISA+0
;VSaula036_Timer0Contador.c,11 :: 		OPTION_REG.T0CS = 1;
	BSF        OPTION_REG+0, 5
;VSaula036_Timer0Contador.c,12 :: 		OPTION_REG.T0SE = 0;
	BCF        OPTION_REG+0, 4
;VSaula036_Timer0Contador.c,13 :: 		OPTION_REG.PSA = 1;
	BSF        OPTION_REG+0, 3
;VSaula036_Timer0Contador.c,14 :: 		OPTION_REG.PS2 = 0; // PS2:PS1:PS0 = 101 -> prescaler 1:64
	BCF        OPTION_REG+0, 2
;VSaula036_Timer0Contador.c,15 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;VSaula036_Timer0Contador.c,16 :: 		OPTION_REG.PS0 = 0;
	BCF        OPTION_REG+0, 0
;VSaula036_Timer0Contador.c,18 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;VSaula036_Timer0Contador.c,19 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;VSaula036_Timer0Contador.c,20 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;VSaula036_Timer0Contador.c,21 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;VSaula036_Timer0Contador.c,22 :: 		TMR0 = 250;
	MOVLW      250
	MOVWF      TMR0+0
;VSaula036_Timer0Contador.c,24 :: 		while(1){
L_main0:
;VSaula036_Timer0Contador.c,26 :: 		}
	GOTO       L_main0
;VSaula036_Timer0Contador.c,28 :: 		}
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

;VSaula036_Timer0Contador.c,30 :: 		void interrupt(){
;VSaula036_Timer0Contador.c,31 :: 		if(INTCON.TMR0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
;VSaula036_Timer0Contador.c,32 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;VSaula036_Timer0Contador.c,33 :: 		TMR0 = 250;
	MOVLW      250
	MOVWF      TMR0+0
;VSaula036_Timer0Contador.c,34 :: 		RD0_bit = ~RD0_bit;
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula036_Timer0Contador.c,35 :: 		}
L_interrupt2:
;VSaula036_Timer0Contador.c,36 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
