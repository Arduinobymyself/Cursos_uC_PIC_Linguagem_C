
_main:

;timer0_2.c,28 :: 		void main() {
;timer0_2.c,29 :: 		TRISD = 0;
	CLRF       TRISD+0
;timer0_2.c,30 :: 		PORTD = 0;
	CLRF       PORTD+0
;timer0_2.c,32 :: 		OPTION_REG = 0b10000111;    // liga o Timer 0, prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;timer0_2.c,33 :: 		TMR0 = 0;                   // carregamento do valor inicial do registrador
	CLRF       TMR0+0
;timer0_2.c,34 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;timer0_2.c,36 :: 		while(1){
L_main0:
;timer0_2.c,37 :: 		if(INTCON.TMR0IF == 1){   // se ocorreu estouro...
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;timer0_2.c,38 :: 		if(cont == 10){         // para aumentar o tempo máximo TE*10 = 327,68ms
	MOVF       _cont+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;timer0_2.c,42 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
	MOVLW      1
	XORWF      PORTD+0, 1
;timer0_2.c,43 :: 		cont = 0;               // zera contador
	CLRF       _cont+0
;timer0_2.c,44 :: 		}
L_main3:
;timer0_2.c,45 :: 		cont++;                  // incrementa contador
	INCF       _cont+0, 1
;timer0_2.c,46 :: 		TMR0 = 0;               // inicializa o valor do registrador
	CLRF       TMR0+0
;timer0_2.c,47 :: 		INTCON.TMR0IF = 0;      // restaura o flag de estouro
	BCF        INTCON+0, 2
;timer0_2.c,48 :: 		}
L_main2:
;timer0_2.c,49 :: 		}
	GOTO       L_main0
;timer0_2.c,51 :: 		}
	GOTO       $+0
; end of _main
