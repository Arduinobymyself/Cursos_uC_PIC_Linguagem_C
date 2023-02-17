
_main:

;timer0_1.c,27 :: 		void main() {
;timer0_1.c,28 :: 		TRISD = 0;
	CLRF       TRISD+0
;timer0_1.c,29 :: 		PORTD = 0;
	CLRF       PORTD+0
;timer0_1.c,31 :: 		OPTION_REG = 0b10000111;    // liga o Timer 0, prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;timer0_1.c,32 :: 		TMR0 = 0;                   // carregamento do valor inicial do registrador
	CLRF       TMR0+0
;timer0_1.c,33 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;timer0_1.c,35 :: 		while(1){
L_main0:
;timer0_1.c,36 :: 		if(INTCON.TMR0IF == 1){   // se ocorreu estouro...
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;timer0_1.c,37 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
	MOVLW      1
	XORWF      PORTD+0, 1
;timer0_1.c,38 :: 		TMR0 = 0;               // inicializa o valor do registrador
	CLRF       TMR0+0
;timer0_1.c,39 :: 		INTCON.TMR0IF = 0;      // restaura o flag de estouro
	BCF        INTCON+0, 2
;timer0_1.c,40 :: 		}
L_main2:
;timer0_1.c,41 :: 		}
	GOTO       L_main0
;timer0_1.c,43 :: 		}
	GOTO       $+0
; end of _main
