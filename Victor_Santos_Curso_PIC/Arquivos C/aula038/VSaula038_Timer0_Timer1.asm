
_main:

;VSaula038_Timer0_Timer1.c,6 :: 		void main() {
;VSaula038_Timer0_Timer1.c,7 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula038_Timer0_Timer1.c,8 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula038_Timer0_Timer1.c,15 :: 		OPTION_REG = 0b10000110; // [RBPU| INTEDG T0CS T0SE PSA PS2 PS1 PS0]
	MOVLW      134
	MOVWF      OPTION_REG+0
;VSaula038_Timer0_Timer1.c,16 :: 		TMR0 = 22;
	MOVLW      22
	MOVWF      TMR0+0
;VSaula038_Timer0_Timer1.c,23 :: 		T1CON = 0b00000101; // [--- --- T1CKPS1 T1CKPS0 T1OSCEN T1SYNC| TMR1CS TMR1ON]
	MOVLW      5
	MOVWF      T1CON+0
;VSaula038_Timer0_Timer1.c,24 :: 		TMR1H = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;VSaula038_Timer0_Timer1.c,25 :: 		TMR1L = 0xAF;
	MOVLW      175
	MOVWF      TMR1L+0
;VSaula038_Timer0_Timer1.c,28 :: 		INTCON = 0b11100100; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      228
	MOVWF      INTCON+0
;VSaula038_Timer0_Timer1.c,29 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, 2
;VSaula038_Timer0_Timer1.c,31 :: 		PIE1 = 0b00000001; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR1IE TMR1IE]
	MOVLW      1
	MOVWF      PIE1+0
;VSaula038_Timer0_Timer1.c,32 :: 		PIR1 = 0b00000001; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR1IF TMR1IF]
	MOVLW      1
	MOVWF      PIR1+0
;VSaula038_Timer0_Timer1.c,35 :: 		while(1){
L_main0:
;VSaula038_Timer0_Timer1.c,37 :: 		}
	GOTO       L_main0
;VSaula038_Timer0_Timer1.c,39 :: 		}
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

;VSaula038_Timer0_Timer1.c,41 :: 		void interrupt(){
;VSaula038_Timer0_Timer1.c,42 :: 		if(PIR1.TMR1IF){
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt2
;VSaula038_Timer0_Timer1.c,43 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;VSaula038_Timer0_Timer1.c,44 :: 		TMR1H = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;VSaula038_Timer0_Timer1.c,45 :: 		TMR1L = 0xAF;
	MOVLW      175
	MOVWF      TMR1L+0
;VSaula038_Timer0_Timer1.c,46 :: 		RD7_bit = ~RD7_bit;
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula038_Timer0_Timer1.c,47 :: 		}
L_interrupt2:
;VSaula038_Timer0_Timer1.c,48 :: 		if(INTCON.TMR0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt3
;VSaula038_Timer0_Timer1.c,49 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;VSaula038_Timer0_Timer1.c,50 :: 		TMR0 = 22;
	MOVLW      22
	MOVWF      TMR0+0
;VSaula038_Timer0_Timer1.c,51 :: 		RD0_bit =~RD0_bit;
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula038_Timer0_Timer1.c,52 :: 		}
L_interrupt3:
;VSaula038_Timer0_Timer1.c,53 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
