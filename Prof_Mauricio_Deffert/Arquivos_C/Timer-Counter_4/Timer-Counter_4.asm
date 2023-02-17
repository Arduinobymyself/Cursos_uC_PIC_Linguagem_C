
_main:

;Timer-Counter_4.c,13 :: 		void main() {
;Timer-Counter_4.c,14 :: 		TRISD = 0;  // define PORT D como saída
	CLRF       TRISD+0
;Timer-Counter_4.c,15 :: 		PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
	CLRF       PORTD+0
;Timer-Counter_4.c,16 :: 		TRISA.RA4 = 1; // pino contador RA4/T0CKI configurado como entrada
	BSF        TRISA+0, 4
;Timer-Counter_4.c,20 :: 		OPTION_REG = 0b10111000;      // modo contador - prescaler desligado PSA = 1 - borda de escida
	MOVLW      184
	MOVWF      OPTION_REG+0
;Timer-Counter_4.c,21 :: 		TMR0 = 246;                   // carregamento inicial do registrador TMR0
	MOVLW      246
	MOVWF      TMR0+0
;Timer-Counter_4.c,22 :: 		INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_4.c,24 :: 		while(1){
L_main0:
;Timer-Counter_4.c,25 :: 		PORTD = TMR0;
	MOVF       TMR0+0, 0
	MOVWF      PORTD+0
;Timer-Counter_4.c,26 :: 		if(INTCON.TMR0IF == 1){     // se houve um estouro
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;Timer-Counter_4.c,27 :: 		PORTD.RD0 = ~PORTD.RD0;   // inverte o pino RD0 (LED 0)
	MOVLW      1
	XORWF      PORTD+0, 1
;Timer-Counter_4.c,28 :: 		TMR0 = 246;               // reincia o registrador TMR0
	MOVLW      246
	MOVWF      TMR0+0
;Timer-Counter_4.c,29 :: 		INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_4.c,30 :: 		}
L_main2:
;Timer-Counter_4.c,31 :: 		}
	GOTO       L_main0
;Timer-Counter_4.c,32 :: 		}
	GOTO       $+0
; end of _main
