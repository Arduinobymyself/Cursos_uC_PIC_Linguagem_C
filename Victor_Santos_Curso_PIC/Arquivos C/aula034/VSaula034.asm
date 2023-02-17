
_main:

;VSaula034.c,9 :: 		void main() {
;VSaula034.c,11 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;VSaula034.c,13 :: 		OPTION_REG.INTEDG = 1; // INTEDG:1 = interrupt on rising edge of RB0/INT pin
	BSF        OPTION_REG+0, 6
;VSaula034.c,14 :: 		INTCON.GIE = 1;        // GIE:1 = anable global interruption
	BSF        INTCON+0, 7
;VSaula034.c,15 :: 		INTCON.PEIE = 0;       // PEIE:0 = disable peripheral interruption
	BCF        INTCON+0, 6
;VSaula034.c,16 :: 		INTCON.INTE = 1;       // INTE:1 = enable external interruption
	BSF        INTCON+0, 4
;VSaula034.c,17 :: 		INTCON.INTF = 0;       // clear external interruption flag
	BCF        INTCON+0, 1
;VSaula034.c,19 :: 		TRISB = 0b00000001;    // RB0 como entrada
	MOVLW      1
	MOVWF      TRISB+0
;VSaula034.c,20 :: 		PORTB = 0b00000001;    // RB0 using pull-up resistor
	MOVLW      1
	MOVWF      PORTB+0
;VSaula034.c,21 :: 		TRISD = 0;             // PORTD como saída digital
	CLRF       TRISD+0
;VSaula034.c,22 :: 		PORTD = 0;             // PORTD inicia em nível baixo
	CLRF       PORTD+0
;VSaula034.c,24 :: 		while(1){
L_main0:
;VSaula034.c,25 :: 		RD0_bit = ~RD0_bit;  // inverte LED vermelho a cada 500ms
	MOVLW      1
	XORWF      RD0_bit+0, 1
;VSaula034.c,26 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;VSaula034.c,27 :: 		}
	GOTO       L_main0
;VSaula034.c,28 :: 		}
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

;VSaula034.c,30 :: 		void interrupt(){
;VSaula034.c,31 :: 		if(INTF_bit){
	BTFSS      INTF_bit+0, 1
	GOTO       L_interrupt3
;VSaula034.c,32 :: 		INTF_bit = 0;       // reinicia a flag de interrupção
	BCF        INTF_bit+0, 1
;VSaula034.c,33 :: 		RD7_bit = ~RD7_bit; // inverte LED verde a cada pressionamento em B0
	MOVLW      128
	XORWF      RD7_bit+0, 1
;VSaula034.c,34 :: 		}
L_interrupt3:
;VSaula034.c,35 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
