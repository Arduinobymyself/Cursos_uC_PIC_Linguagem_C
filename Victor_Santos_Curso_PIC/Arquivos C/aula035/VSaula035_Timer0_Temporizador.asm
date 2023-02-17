
_main:

;VSaula035_Timer0_Temporizador.c,6 :: 		void main() {
;VSaula035_Timer0_Temporizador.c,7 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula035_Timer0_Temporizador.c,8 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula035_Timer0_Temporizador.c,10 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;VSaula035_Timer0_Temporizador.c,11 :: 		OPTION_REG.T0SE = 0;
	BCF        OPTION_REG+0, 4
;VSaula035_Timer0_Temporizador.c,12 :: 		OPTION_REG.PSA = 0;
	BCF        OPTION_REG+0, 3
;VSaula035_Timer0_Temporizador.c,13 :: 		OPTION_REG.PS2 = 1; // PS2:PS1:PS0 = 101 -> prescaler 1:64
	BSF        OPTION_REG+0, 2
;VSaula035_Timer0_Temporizador.c,14 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;VSaula035_Timer0_Temporizador.c,15 :: 		OPTION_REG.PS0 = 1;
	BSF        OPTION_REG+0, 0
;VSaula035_Timer0_Temporizador.c,17 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;VSaula035_Timer0_Temporizador.c,18 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;VSaula035_Timer0_Temporizador.c,19 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;VSaula035_Timer0_Temporizador.c,20 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;VSaula035_Timer0_Temporizador.c,21 :: 		TMR0 = 0;
	CLRF       TMR0+0
;VSaula035_Timer0_Temporizador.c,23 :: 		while(1){
L_main0:
;VSaula035_Timer0_Temporizador.c,24 :: 		RD7_bit = ~RD7_bit; // pulsa a cada 32ms por polling
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula035_Timer0_Temporizador.c,25 :: 		delay_ms(32);
	MOVLW      84
	MOVWF      R12+0
	MOVLW      28
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;VSaula035_Timer0_Temporizador.c,26 :: 		}
	GOTO       L_main0
;VSaula035_Timer0_Temporizador.c,28 :: 		}
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

;VSaula035_Timer0_Temporizador.c,30 :: 		void interrupt(){
;VSaula035_Timer0_Temporizador.c,31 :: 		if(INTCON.TMR0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt3
;VSaula035_Timer0_Temporizador.c,32 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;VSaula035_Timer0_Temporizador.c,33 :: 		TMR0 = 0;
	CLRF       TMR0+0
;VSaula035_Timer0_Temporizador.c,34 :: 		RD0_bit = ~RD0_bit; // pulsa a cada 8,192ms por interrupção do Timer0
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula035_Timer0_Temporizador.c,37 :: 		}
L_interrupt3:
;VSaula035_Timer0_Temporizador.c,38 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
