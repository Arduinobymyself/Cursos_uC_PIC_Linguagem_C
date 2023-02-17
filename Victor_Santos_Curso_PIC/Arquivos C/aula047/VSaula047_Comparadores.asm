
_main:

;VSaula047_Comparadores.c,15 :: 		void main() {
;VSaula047_Comparadores.c,17 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula047_Comparadores.c,18 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula047_Comparadores.c,20 :: 		TRISA = 0b00001111; // RA0 até RA3 como entrada
	MOVLW      15
	MOVWF      TRISA+0
;VSaula047_Comparadores.c,22 :: 		CMCON = 0b00000010; // [C2OUT C1OUT C2INV C1INV CIS CM2 CM1 CM0]
	MOVLW      2
	MOVWF      CMCON+0
;VSaula047_Comparadores.c,28 :: 		INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      192
	MOVWF      INTCON+0
;VSaula047_Comparadores.c,29 :: 		PIE2 = 0b01000000;   // [--- CMIE --- --- BCLIE LVDIE TMR3IE CCP2IE]
	MOVLW      64
	MOVWF      PIE2+0
;VSaula047_Comparadores.c,30 :: 		PIR2 = 0b00000000;   // [--- CMIF --- --- BCLIF LVDIF TMR3IF CCP2IF]
	CLRF       PIR2+0
;VSaula047_Comparadores.c,39 :: 		while(1){
L_main0:
;VSaula047_Comparadores.c,54 :: 		}
	GOTO       L_main0
;VSaula047_Comparadores.c,56 :: 		}
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

;VSaula047_Comparadores.c,59 :: 		void interrupt(){
;VSaula047_Comparadores.c,61 :: 		if(CMIF_bit){
	BTFSS      CMIF_bit+0, 6
	GOTO       L_interrupt2
;VSaula047_Comparadores.c,63 :: 		if(C1OUT_bit){
	BTFSS      C1OUT_bit+0, 6
	GOTO       L_interrupt3
;VSaula047_Comparadores.c,64 :: 		RD0_bit = 1;
	BSF        RD0_bit+0, 0
;VSaula047_Comparadores.c,65 :: 		} else {
	GOTO       L_interrupt4
L_interrupt3:
;VSaula047_Comparadores.c,66 :: 		RD0_bit = 0;
	BCF        RD0_bit+0, 0
;VSaula047_Comparadores.c,67 :: 		}
L_interrupt4:
;VSaula047_Comparadores.c,69 :: 		if(C2OUT_bit){
	BTFSS      C2OUT_bit+0, 7
	GOTO       L_interrupt5
;VSaula047_Comparadores.c,70 :: 		RD7_bit = 1;
	BSF        RD7_bit+0, 7
;VSaula047_Comparadores.c,71 :: 		} else {
	GOTO       L_interrupt6
L_interrupt5:
;VSaula047_Comparadores.c,72 :: 		RD7_bit = 0;
	BCF        RD7_bit+0, 7
;VSaula047_Comparadores.c,73 :: 		}
L_interrupt6:
;VSaula047_Comparadores.c,75 :: 		}
L_interrupt2:
;VSaula047_Comparadores.c,76 :: 		CMIF_bit = 0;
	BCF        CMIF_bit+0, 6
;VSaula047_Comparadores.c,78 :: 		}
L__interrupt7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
