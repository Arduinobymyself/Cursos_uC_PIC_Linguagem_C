
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;teste_interrupcao.c,4 :: 		void interrupt(){
;teste_interrupcao.c,5 :: 		if(INTCON.INTF == 1){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;teste_interrupcao.c,6 :: 		PORTD.RD2 = ~PORTD.RD2;
	MOVLW      4
	XORWF      PORTD+0, 1
;teste_interrupcao.c,7 :: 		INTCON.INTF = 0;  // limpa o flag INTF possibilitando novas interrupçãoes
	BCF        INTCON+0, 1
;teste_interrupcao.c,9 :: 		}
L_interrupt0:
;teste_interrupcao.c,10 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;teste_interrupcao.c,12 :: 		void main() {
;teste_interrupcao.c,13 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;teste_interrupcao.c,14 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;teste_interrupcao.c,16 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;teste_interrupcao.c,17 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;teste_interrupcao.c,18 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;teste_interrupcao.c,19 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;teste_interrupcao.c,21 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;teste_interrupcao.c,22 :: 		TRISD = 0;
	CLRF       TRISD+0
;teste_interrupcao.c,23 :: 		PORTD = 0;
	CLRF       PORTD+0
;teste_interrupcao.c,25 :: 		while(1){
L_main1:
;teste_interrupcao.c,26 :: 		PORTD.RD0 = ~PORTD.RD0;
	MOVLW      1
	XORWF      PORTD+0, 1
;teste_interrupcao.c,27 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;teste_interrupcao.c,28 :: 		}
	GOTO       L_main1
;teste_interrupcao.c,29 :: 		}
	GOTO       $+0
; end of _main
