
_main:

;Timer-Counter_3.c,23 :: 		void main() {
;Timer-Counter_3.c,24 :: 		TRISD = 0;  // define PORT D como saída
	CLRF       TRISD+0
;Timer-Counter_3.c,25 :: 		PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
	CLRF       PORTD+0
;Timer-Counter_3.c,27 :: 		INTCON.GIE = 1;     // habilita interrupção global
	BSF        INTCON+0, 7
;Timer-Counter_3.c,28 :: 		INTCON.PEIE = 0;    // irrelevante para o TIMER 0
	BCF        INTCON+0, 6
;Timer-Counter_3.c,29 :: 		INTCON.TMR0IE = 1;  // habilita interrupção por TIMER 0
	BSF        INTCON+0, 5
;Timer-Counter_3.c,31 :: 		TMR0 = 6; // carga incial do registrador TMR0
	MOVLW      6
	MOVWF      TMR0+0
;Timer-Counter_3.c,33 :: 		OPTION_REG = 0b10000010;      // modo temporizador - prescaler 1:8 (...010)
	MOVLW      130
	MOVWF      OPTION_REG+0
;Timer-Counter_3.c,37 :: 		while(1){
L_main0:
;Timer-Counter_3.c,38 :: 		if(contador == 1000){ // multiplica por 1000 o TE, 1000*1ms=1s
	MOVF       _contador+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main3
	MOVLW      232
	XORWF      _contador+0, 0
L__main3:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Timer-Counter_3.c,39 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte o pino RD0 (LED 0)
	MOVLW      1
	XORWF      PORTD+0, 1
;Timer-Counter_3.c,40 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;Timer-Counter_3.c,41 :: 		}
L_main2:
;Timer-Counter_3.c,42 :: 		}
	GOTO       L_main0
;Timer-Counter_3.c,43 :: 		}
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

;Timer-Counter_3.c,45 :: 		void interrupt(){
;Timer-Counter_3.c,46 :: 		contador++;         // para cada interrupção do TIMER 0, incrementa o contador
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Timer-Counter_3.c,47 :: 		TMR0 = 6;           // carga incial do registrador TMR0
	MOVLW      6
	MOVWF      TMR0+0
;Timer-Counter_3.c,48 :: 		INTCON.TMR0IF = 0;  // limpa a flag de interrupção por TIMER 0 *** NUNCA ESQUECER DISTO!!!***
	BCF        INTCON+0, 2
;Timer-Counter_3.c,49 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
