
_main:

;Timer-Counter_2.c,22 :: 		void main() {
;Timer-Counter_2.c,23 :: 		TRISD = 0;  // define PORT D como saída
	CLRF       TRISD+0
;Timer-Counter_2.c,24 :: 		PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
	CLRF       PORTD+0
;Timer-Counter_2.c,26 :: 		OPTION_REG = 0b10000111;      // modo temporizador - prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;Timer-Counter_2.c,27 :: 		TMR0 = 0;                     // carregamento inicial do registrador TMR0
	CLRF       TMR0+0
;Timer-Counter_2.c,28 :: 		INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_2.c,30 :: 		while(1){
L_main0:
;Timer-Counter_2.c,31 :: 		if(INTCON.TMR0IF == 1){     // se houve um estouro
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;Timer-Counter_2.c,32 :: 		if(contador == 20){
	MOVLW      0
	XORWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main4
	MOVLW      20
	XORWF      _contador+0, 0
L__main4:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Timer-Counter_2.c,33 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte o pino RD0 (LED 0)
	MOVLW      1
	XORWF      PORTD+0, 1
;Timer-Counter_2.c,34 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;Timer-Counter_2.c,35 :: 		}
L_main3:
;Timer-Counter_2.c,36 :: 		contador++;               // incrementa contagem
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Timer-Counter_2.c,37 :: 		TMR0 = 0;                 // reincia o registrador TMR0
	CLRF       TMR0+0
;Timer-Counter_2.c,38 :: 		INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_2.c,39 :: 		}
L_main2:
;Timer-Counter_2.c,40 :: 		}
	GOTO       L_main0
;Timer-Counter_2.c,41 :: 		}
	GOTO       $+0
; end of _main
