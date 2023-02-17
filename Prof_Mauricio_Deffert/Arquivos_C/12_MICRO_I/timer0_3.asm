
_main:

;timer0_3.c,30 :: 		void main() {
;timer0_3.c,32 :: 		ADCON1 = 7;        // entradas nanalógicas desabilitadas
	MOVLW      7
	MOVWF      ADCON1+0
;timer0_3.c,33 :: 		CMCON = 7;         // comparadores desabilitados
	MOVLW      7
	MOVWF      CMCON+0
;timer0_3.c,35 :: 		INTCON.GIE = 1;    // habilita a chave geral de interrupções
	BSF        INTCON+0, 7
;timer0_3.c,36 :: 		INTCON.PEIE = 1;   // habilita a chave de interrupções por periféricos (não necessária)
	BSF        INTCON+0, 6
;timer0_3.c,37 :: 		INTCON.TMR0IE = 1; // habilita a interrupção por Timer 0
	BSF        INTCON+0, 5
;timer0_3.c,39 :: 		TRISD = 0; // PORT D como saída digital
	CLRF       TRISD+0
;timer0_3.c,40 :: 		PORTD = 0; // PORT D iniciaem nível baixo
	CLRF       PORTD+0
;timer0_3.c,42 :: 		OPTION_REG = 0b10000010;    // liga o Timer 0, prescaler 1:8
	MOVLW      130
	MOVWF      OPTION_REG+0
;timer0_3.c,43 :: 		TMR0 = 6;                   // carregamento do valor inicial do registrador
	MOVLW      6
	MOVWF      TMR0+0
;timer0_3.c,47 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;timer0_3.c,49 :: 		while(1){
L_main0:
;timer0_3.c,51 :: 		if(cont == tempo){        // para aumentar o tempo máximo TE*10 = 327,68ms
	MOVF       _cont+1, 0
	XORWF      _tempo+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main3
	MOVF       _tempo+0, 0
	XORWF      _cont+0, 0
L__main3:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;timer0_3.c,55 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
	MOVLW      1
	XORWF      PORTD+0, 1
;timer0_3.c,56 :: 		cont = 0;               // zera contador
	CLRF       _cont+0
	CLRF       _cont+1
;timer0_3.c,57 :: 		}
L_main2:
;timer0_3.c,59 :: 		}
	GOTO       L_main0
;timer0_3.c,61 :: 		}
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

;timer0_3.c,64 :: 		void interrupt(){// se ocorreu estouro....
;timer0_3.c,65 :: 		cont++;            // a cada interrupçãoincrementa a contagem
	INCF       _cont+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cont+1, 1
;timer0_3.c,66 :: 		TMR0 = 6;          // inicia o registrador TMR0 em 6, ou seja,
	MOVLW      6
	MOVWF      TMR0+0
;timer0_3.c,68 :: 		INTCON.TMR0IF = 0; // restaura o flag de estouro
	BCF        INTCON+0, 2
;timer0_3.c,69 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
