
_main:

;programa_3.c,11 :: 		void main() {
;programa_3.c,12 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;programa_3.c,13 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;programa_3.c,15 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;programa_3.c,16 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;programa_3.c,17 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;programa_3.c,18 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_3.c,20 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;programa_3.c,21 :: 		TRISD = 0;
	CLRF       TRISD+0
;programa_3.c,22 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_3.c,24 :: 		while(1){
L_main0:
;programa_3.c,25 :: 		PORTD = 0b11000000;
	MOVLW      192
	MOVWF      PORTD+0
;programa_3.c,26 :: 		delay_ms(100);
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
;programa_3.c,27 :: 		PORTD = 0b00000011;
	MOVLW      3
	MOVWF      PORTD+0
;programa_3.c,28 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;programa_3.c,29 :: 		}
	GOTO       L_main0
;programa_3.c,31 :: 		}
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

;programa_3.c,34 :: 		void interrupt(){
;programa_3.c,36 :: 		if(INTCON.INTF == 1){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt4
;programa_3.c,38 :: 		PORTD = 0b10000001;
	MOVLW      129
	MOVWF      PORTD+0
;programa_3.c,39 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	DECFSZ     R11+0, 1
	GOTO       L_interrupt5
;programa_3.c,40 :: 		PORTD = 0b01000010;
	MOVLW      66
	MOVWF      PORTD+0
;programa_3.c,41 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	DECFSZ     R11+0, 1
	GOTO       L_interrupt6
;programa_3.c,42 :: 		PORTD = 0b00100100;
	MOVLW      36
	MOVWF      PORTD+0
;programa_3.c,43 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt7:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt7
	DECFSZ     R12+0, 1
	GOTO       L_interrupt7
	DECFSZ     R11+0, 1
	GOTO       L_interrupt7
;programa_3.c,44 :: 		PORTD = 0b00011000;
	MOVLW      24
	MOVWF      PORTD+0
;programa_3.c,45 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt8:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt8
	DECFSZ     R12+0, 1
	GOTO       L_interrupt8
	DECFSZ     R11+0, 1
	GOTO       L_interrupt8
;programa_3.c,46 :: 		PORTD = 0b00100100;
	MOVLW      36
	MOVWF      PORTD+0
;programa_3.c,47 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt9:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt9
	DECFSZ     R12+0, 1
	GOTO       L_interrupt9
	DECFSZ     R11+0, 1
	GOTO       L_interrupt9
;programa_3.c,48 :: 		PORTD = 0b01000010;
	MOVLW      66
	MOVWF      PORTD+0
;programa_3.c,49 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt10:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt10
	DECFSZ     R12+0, 1
	GOTO       L_interrupt10
	DECFSZ     R11+0, 1
	GOTO       L_interrupt10
;programa_3.c,50 :: 		PORTD = 0b10000001;
	MOVLW      129
	MOVWF      PORTD+0
;programa_3.c,51 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	DECFSZ     R11+0, 1
	GOTO       L_interrupt11
;programa_3.c,53 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;programa_3.c,55 :: 		}
L_interrupt4:
;programa_3.c,56 :: 		}
L__interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
