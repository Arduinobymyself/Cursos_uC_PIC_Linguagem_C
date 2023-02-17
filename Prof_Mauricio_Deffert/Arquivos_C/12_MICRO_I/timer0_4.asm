
_main:

;timer0_4.c,25 :: 		void main() {
;timer0_4.c,27 :: 		ADCON1 = 7;        // entradas nanalógicas desabilitadas
	MOVLW      7
	MOVWF      ADCON1+0
;timer0_4.c,28 :: 		CMCON = 7;         // comparadores desabilitados
	MOVLW      7
	MOVWF      CMCON+0
;timer0_4.c,30 :: 		TRISA.RA4 = 1;     // pino T0CKI configurado como entrada
	BSF        TRISA+0, 4
;timer0_4.c,33 :: 		TRISD = 0; // PORT D como saída digital
	CLRF       TRISD+0
;timer0_4.c,34 :: 		PORTD = 0; // PORT D iniciaem nível baixo
	CLRF       PORTD+0
;timer0_4.c,35 :: 		TRISC.RC4 = 0;
	BCF        TRISC+0, 4
;timer0_4.c,36 :: 		PORTC.RC4 = 1; // aciona display 1
	BSF        PORTC+0, 4
;timer0_4.c,39 :: 		OPTION_REG = 0b10111000;    // modo contador, prescaler desligado, borda descida
	MOVLW      184
	MOVWF      OPTION_REG+0
;timer0_4.c,40 :: 		TMR0 = 246;                 // carregamento do valor inicial do registrador
	MOVLW      246
	MOVWF      TMR0+0
;timer0_4.c,43 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;timer0_4.c,45 :: 		while(1){
L_main0:
;timer0_4.c,47 :: 		PORTD = digitos[(10 - (256 - TMR0))]; // ***modificação adicionada***
	MOVF       TMR0+0, 0
	SUBLW      0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	SUBLW      10
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R0+1
	SUBWF      R0+1, 1
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;timer0_4.c,50 :: 		if(INTCON.TMR0IF == 1){ // se houve estouro...
	BTFSS      INTCON+0, 2
	GOTO       L_main2
;timer0_4.c,52 :: 		TMR0 = 246;
	MOVLW      246
	MOVWF      TMR0+0
;timer0_4.c,53 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;timer0_4.c,54 :: 		}
L_main2:
;timer0_4.c,56 :: 		}
	GOTO       L_main0
;timer0_4.c,58 :: 		}
	GOTO       $+0
; end of _main
