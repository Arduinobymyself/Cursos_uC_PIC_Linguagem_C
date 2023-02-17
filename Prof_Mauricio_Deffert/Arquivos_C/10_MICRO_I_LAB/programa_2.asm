
_main:

;programa_2.c,15 :: 		void main() {
;programa_2.c,16 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_2.c,17 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;programa_2.c,19 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;programa_2.c,20 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;programa_2.c,21 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;programa_2.c,22 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_2.c,24 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;programa_2.c,25 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_2.c,26 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,28 :: 		while(1){
L_main0:
;programa_2.c,29 :: 		PORTD.RD0 = ~PORTD.RD0;
	MOVLW      1
	XORWF      PORTD+0, 1
;programa_2.c,30 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;programa_2.c,31 :: 		}
	GOTO       L_main0
;programa_2.c,33 :: 		}
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

;programa_2.c,36 :: 		void interrupt(){
;programa_2.c,38 :: 		if(INTCON.INTF == 1){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt3
;programa_2.c,39 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,40 :: 		for(i = 0; i < 5; i++){
	CLRF       _i+0
L_interrupt4:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt5
;programa_2.c,41 :: 		PORTD = ~PORTD;
	COMF       PORTD+0, 1
;programa_2.c,42 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt7:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt7
	DECFSZ     R12+0, 1
	GOTO       L_interrupt7
	DECFSZ     R11+0, 1
	GOTO       L_interrupt7
	NOP
	NOP
;programa_2.c,40 :: 		for(i = 0; i < 5; i++){
	INCF       _i+0, 1
;programa_2.c,43 :: 		}
	GOTO       L_interrupt4
L_interrupt5:
;programa_2.c,44 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_2.c,46 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_2.c,48 :: 		}
L_interrupt3:
;programa_2.c,49 :: 		}
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
