
_main:

;aula053.c,41 :: 		void main() {
;aula053.c,42 :: 		CMCON = 0x07;             // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula053.c,43 :: 		OPTION_REG = 0b10111000;  // resistores de pull-up desabilitados
	MOVLW      184
	MOVWF      OPTION_REG+0
;aula053.c,48 :: 		INTCON = 0b10100000;      // interrupção global (GIE)
	MOVLW      160
	MOVWF      INTCON+0
;aula053.c,51 :: 		TMR0 = 250;               // incializa o TMR0
	MOVLW      250
	MOVWF      TMR0+0
;aula053.c,53 :: 		TRISA = 0b11110111;       // apenas RA3 como saída
	MOVLW      247
	MOVWF      TRISA+0
;aula053.c,54 :: 		L1 = 0;                   // LED1 inicia apagado
	BCF        RA3_bit+0, 3
;aula053.c,56 :: 		while(1)
L_main0:
;aula053.c,59 :: 		}
	GOTO       L_main0
;aula053.c,61 :: 		}
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

;aula053.c,64 :: 		void interrupt(){
;aula053.c,66 :: 		if(T0IF_bit){ // houve estouro do TIMER 0?
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt2
;aula053.c,68 :: 		T0IF_bit = 0;
	BCF        T0IF_bit+0, 2
;aula053.c,69 :: 		TMR0 = 250;
	MOVLW      250
	MOVWF      TMR0+0
;aula053.c,70 :: 		L1 = ~L1;
	MOVLW      8
	XORWF      RA3_bit+0, 1
;aula053.c,71 :: 		}
L_interrupt2:
;aula053.c,73 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
