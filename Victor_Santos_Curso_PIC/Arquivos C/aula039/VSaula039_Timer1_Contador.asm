
_main:

;VSaula039_Timer1_Contador.c,6 :: 		void main() {
;VSaula039_Timer1_Contador.c,8 :: 		TRISC = 0b00000001;
	MOVLW      1
	MOVWF      TRISC+0
;VSaula039_Timer1_Contador.c,9 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;VSaula039_Timer1_Contador.c,10 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula039_Timer1_Contador.c,11 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula039_Timer1_Contador.c,17 :: 		T1CON = 0b00000011; // [--- --- T1CKPS1 T1CKPS0 T1OSCEN T1SYNC| TMR1CS TMR1ON]
	MOVLW      3
	MOVWF      T1CON+0
;VSaula039_Timer1_Contador.c,18 :: 		TMR1H = 0xFF;  // iniciando a contagem em 65534, conta 2 eventos até estouro
	MOVLW      255
	MOVWF      TMR1H+0
;VSaula039_Timer1_Contador.c,19 :: 		TMR1L = 0xFE;
	MOVLW      254
	MOVWF      TMR1L+0
;VSaula039_Timer1_Contador.c,22 :: 		INTCON = 0b11000000; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      192
	MOVWF      INTCON+0
;VSaula039_Timer1_Contador.c,24 :: 		PIE1 = 0b00000001; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR1IE TMR1IE]
	MOVLW      1
	MOVWF      PIE1+0
;VSaula039_Timer1_Contador.c,25 :: 		PIR1 = 0b00000000; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR1IF TMR1IF]
	CLRF       PIR1+0
;VSaula039_Timer1_Contador.c,28 :: 		while(1){
L_main0:
;VSaula039_Timer1_Contador.c,30 :: 		}
	GOTO       L_main0
;VSaula039_Timer1_Contador.c,32 :: 		}
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

;VSaula039_Timer1_Contador.c,34 :: 		void interrupt(){
;VSaula039_Timer1_Contador.c,36 :: 		if(PIR1.TMR1IF){
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt2
;VSaula039_Timer1_Contador.c,37 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;VSaula039_Timer1_Contador.c,38 :: 		TMR1H = 0xFF;
	MOVLW      255
	MOVWF      TMR1H+0
;VSaula039_Timer1_Contador.c,39 :: 		TMR1L = 0xFE;
	MOVLW      254
	MOVWF      TMR1L+0
;VSaula039_Timer1_Contador.c,40 :: 		RD7_bit = ~RD7_bit;
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula039_Timer1_Contador.c,41 :: 		}
L_interrupt2:
;VSaula039_Timer1_Contador.c,43 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
