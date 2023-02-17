
_main:

;Timer-Counter_Ex_2.c,15 :: 		void main() {
;Timer-Counter_Ex_2.c,16 :: 		ADCON1 = 7; // pinos A/D como digitais
	MOVLW      7
	MOVWF      ADCON1+0
;Timer-Counter_Ex_2.c,17 :: 		TRISD = 0;  // define PORT D como saída
	CLRF       TRISD+0
;Timer-Counter_Ex_2.c,18 :: 		PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
	CLRF       PORTD+0
;Timer-Counter_Ex_2.c,19 :: 		TRISB.RB0 = 1; // RB0 como entrada digital
	BSF        TRISB+0, 0
;Timer-Counter_Ex_2.c,20 :: 		PORTB.RB0 = 1; // RB0 com pull-up
	BSF        PORTB+0, 0
;Timer-Counter_Ex_2.c,21 :: 		TRISA.RA4 = 1; // pino contador RA4/T0CKI configurado como entrada
	BSF        TRISA+0, 4
;Timer-Counter_Ex_2.c,24 :: 		PORTA.RA4 = 1;
	BSF        PORTA+0, 4
;Timer-Counter_Ex_2.c,26 :: 		INTCON.GIE = 1;     // habilita interrupção global
	BSF        INTCON+0, 7
;Timer-Counter_Ex_2.c,27 :: 		INTCON.PEIE = 0;    // desabilita interrupção por periféricos
	BCF        INTCON+0, 6
;Timer-Counter_Ex_2.c,28 :: 		INTCON.TMR0IE = 1;  // habilita interrupção por TIMER 0
	BSF        INTCON+0, 5
;Timer-Counter_Ex_2.c,31 :: 		OPTION_REG = 0b10111000;      // modo contador - prescaler desligado PSA = 1 - borda de escida
	MOVLW      184
	MOVWF      OPTION_REG+0
;Timer-Counter_Ex_2.c,32 :: 		TMR0 = 246;                   // carregamento inicial do registrador TMR0
	MOVLW      246
	MOVWF      TMR0+0
;Timer-Counter_Ex_2.c,33 :: 		INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_Ex_2.c,35 :: 		while(1){
L_main0:
;Timer-Counter_Ex_2.c,36 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;Timer-Counter_Ex_2.c,37 :: 		TMR0 = 246;               // reincia o registrador TMR0
	MOVLW      246
	MOVWF      TMR0+0
;Timer-Counter_Ex_2.c,38 :: 		INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_Ex_2.c,39 :: 		PORTD.RD0 = 0;            // desliga LED 0 (RD0)
	BCF        PORTD+0, 0
;Timer-Counter_Ex_2.c,40 :: 		}
L_main2:
;Timer-Counter_Ex_2.c,41 :: 		}
	GOTO       L_main0
;Timer-Counter_Ex_2.c,42 :: 		}
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

;Timer-Counter_Ex_2.c,44 :: 		void interrupt(){
;Timer-Counter_Ex_2.c,45 :: 		if(INTCON.TMR0IF == 1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt3
;Timer-Counter_Ex_2.c,46 :: 		PORTD.RD0 = 1;      // liga LED 0 (RD0)
	BSF        PORTD+0, 0
;Timer-Counter_Ex_2.c,47 :: 		INTCON.TMR0IF = 0;  // reinicia o flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_Ex_2.c,48 :: 		}
L_interrupt3:
;Timer-Counter_Ex_2.c,49 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
