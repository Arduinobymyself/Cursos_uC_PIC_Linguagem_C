
_main:

;VSaula037_Timer1_Temporizador.c,6 :: 		void main() {
;VSaula037_Timer1_Temporizador.c,7 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula037_Timer1_Temporizador.c,8 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula037_Timer1_Temporizador.c,11 :: 		T1CON.T1CKPS0 = 1; // prescaler 1:2
	BSF        T1CON+0, 4
;VSaula037_Timer1_Temporizador.c,12 :: 		T1CON.T1CKPS1 = 0;
	BCF        T1CON+0, 5
;VSaula037_Timer1_Temporizador.c,13 :: 		T1CON.T1OSCEN = 0;
	BCF        T1CON+0, 3
;VSaula037_Timer1_Temporizador.c,14 :: 		T1CON.NOT_T1SYNC = 1;
	BSF        T1CON+0, 2
;VSaula037_Timer1_Temporizador.c,15 :: 		T1CON.TMR1CS = 0;
	BCF        T1CON+0, 1
;VSaula037_Timer1_Temporizador.c,16 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;VSaula037_Timer1_Temporizador.c,18 :: 		TMR1H = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;VSaula037_Timer1_Temporizador.c,19 :: 		TMR1L = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;VSaula037_Timer1_Temporizador.c,21 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;VSaula037_Timer1_Temporizador.c,22 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;VSaula037_Timer1_Temporizador.c,23 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;VSaula037_Timer1_Temporizador.c,24 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;VSaula037_Timer1_Temporizador.c,27 :: 		while(1){
L_main0:
;VSaula037_Timer1_Temporizador.c,28 :: 		RD7_bit = ~RD7_bit;
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula037_Timer1_Temporizador.c,29 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;VSaula037_Timer1_Temporizador.c,30 :: 		}
	GOTO       L_main0
;VSaula037_Timer1_Temporizador.c,32 :: 		}
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

;VSaula037_Timer1_Temporizador.c,34 :: 		void interrupt(){
;VSaula037_Timer1_Temporizador.c,35 :: 		if(PIR1.TMR1IF){
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt3
;VSaula037_Timer1_Temporizador.c,36 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;VSaula037_Timer1_Temporizador.c,37 :: 		TMR1H = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;VSaula037_Timer1_Temporizador.c,38 :: 		TMR1L = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;VSaula037_Timer1_Temporizador.c,39 :: 		RD0_bit = ~RD0_bit;
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula037_Timer1_Temporizador.c,40 :: 		}
L_interrupt3:
;VSaula037_Timer1_Temporizador.c,41 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
