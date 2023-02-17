
_main:

;VSaula041_Timer2_Temporizador.c,14 :: 		void main() {
;VSaula041_Timer2_Temporizador.c,16 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula041_Timer2_Temporizador.c,17 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula041_Timer2_Temporizador.c,24 :: 		T2CON = 0b01100110; // [--- TOUTPS3 TOUTPS2 TOUTPS1 TOUTPS0 TMR2ON T2CKPS1 T2CKPS0]
	MOVLW      102
	MOVWF      T2CON+0
;VSaula041_Timer2_Temporizador.c,25 :: 		PR2 = 240;
	MOVLW      240
	MOVWF      PR2+0
;VSaula041_Timer2_Temporizador.c,27 :: 		INTCON = 0b11000000; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      192
	MOVWF      INTCON+0
;VSaula041_Timer2_Temporizador.c,29 :: 		PIE1 = 0b00000010; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR2IE TMR1IE]
	MOVLW      2
	MOVWF      PIE1+0
;VSaula041_Timer2_Temporizador.c,30 :: 		PIR1 = 0b00000000; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR2IF TMR1IF]
	CLRF       PIR1+0
;VSaula041_Timer2_Temporizador.c,33 :: 		while(1){
L_main0:
;VSaula041_Timer2_Temporizador.c,35 :: 		}
	GOTO       L_main0
;VSaula041_Timer2_Temporizador.c,37 :: 		}
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

;VSaula041_Timer2_Temporizador.c,39 :: 		void interrupt(){
;VSaula041_Timer2_Temporizador.c,41 :: 		if(PIR1.TMR2IF){
	BTFSS      PIR1+0, 1
	GOTO       L_interrupt2
;VSaula041_Timer2_Temporizador.c,42 :: 		PIR1.TMR2IF = 0;
	BCF        PIR1+0, 1
;VSaula041_Timer2_Temporizador.c,43 :: 		RD7_bit = ~RD7_bit;
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula041_Timer2_Temporizador.c,44 :: 		}
L_interrupt2:
;VSaula041_Timer2_Temporizador.c,46 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
