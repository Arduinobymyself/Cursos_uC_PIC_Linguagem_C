
_main:

;aula027.c,33 :: 		void main() {
;aula027.c,34 :: 		CMCON = 7; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula027.c,36 :: 		OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128
	MOVLW      134
	MOVWF      OPTION_REG+0
;aula027.c,38 :: 		INTCON.GIE = 1;  // habilita a interrupção global
	BSF        INTCON+0, 7
;aula027.c,39 :: 		INTCON.PEIE = 1; // habilita a interrupção por periféricos
	BSF        INTCON+0, 6
;aula027.c,40 :: 		INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0
	BSF        INTCON+0, 5
;aula027.c,42 :: 		TMR0 = 0x6C;
	MOVLW      108
	MOVWF      TMR0+0
;aula027.c,45 :: 		TRISA = 0X03; // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula027.c,46 :: 		PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
	MOVLW      3
	MOVWF      PORTA+0
;aula027.c,50 :: 		while(1)
L_main0:
;aula027.c,54 :: 		L2 = 0;
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;aula027.c,55 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;aula027.c,56 :: 		L2 = 1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;aula027.c,57 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula027.c,59 :: 		}
	GOTO       L_main0
;aula027.c,61 :: 		}
L_end_main:
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

;aula027.c,64 :: 		void interrupt(){
;aula027.c,66 :: 		if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt4
;aula027.c,67 :: 		INTCON.T0IF = 0; // limpa a flag de estouro do Timer 0
	BCF        INTCON+0, 2
;aula027.c,68 :: 		TMR0 = 0x6C; // reinicia o registrador TMR0
	MOVLW      108
	MOVWF      TMR0+0
;aula027.c,71 :: 		if(!S1){
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_interrupt5
;aula027.c,72 :: 		L1 = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;aula027.c,73 :: 		}
	GOTO       L_interrupt6
L_interrupt5:
;aula027.c,74 :: 		else if(!S2){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_interrupt7
;aula027.c,75 :: 		L1 = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;aula027.c,76 :: 		}
L_interrupt7:
L_interrupt6:
;aula027.c,78 :: 		}
L_interrupt4:
;aula027.c,79 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
