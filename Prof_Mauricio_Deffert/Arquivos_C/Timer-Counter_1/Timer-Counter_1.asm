
_main:

;Timer-Counter_1.c,20 :: 		void main() {
;Timer-Counter_1.c,21 :: 		TRISD = 0;  // define PORT D como saída
	CLRF       TRISD+0
;Timer-Counter_1.c,22 :: 		PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
	CLRF       PORTD+0
;Timer-Counter_1.c,24 :: 		OPTION_REG = 0b10000111;      // modo temporizador - prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;Timer-Counter_1.c,25 :: 		TMR0 = 0;                     // carregamento inicial do registrador TMR0
	CLRF       TMR0+0
;Timer-Counter_1.c,26 :: 		INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_1.c,28 :: 		while(1){
L_main0:
;Timer-Counter_1.c,29 :: 		if(INTCON.TMR0IF == 1){     // se houve um estouro
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;Timer-Counter_1.c,30 :: 		PORTD.RD0 = ~PORTD.RD0;   // inverte o pino RD0 (LED 0)
	MOVLW      1
	XORWF      PORTD+0, 1
;Timer-Counter_1.c,31 :: 		TMR0 = 0;                 // reincia o registrador TMR0
	CLRF       TMR0+0
;Timer-Counter_1.c,32 :: 		INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_1.c,33 :: 		}
L_main2:
;Timer-Counter_1.c,34 :: 		}
	GOTO       L_main0
;Timer-Counter_1.c,35 :: 		}
	GOTO       $+0
; end of _main
