
_main:

;aula054.c,43 :: 		void main() {
;aula054.c,44 :: 		CMCON = 0x07;             // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula054.c,45 :: 		OPTION_REG = 0b10000001;  // (81h)
	MOVLW      129
	MOVWF      OPTION_REG+0
;aula054.c,49 :: 		INTCON = 0b10100000;      // (A0h)
	MOVLW      160
	MOVWF      INTCON+0
;aula054.c,53 :: 		TMR0 = 6;               // incializa o TMR0
	MOVLW      6
	MOVWF      TMR0+0
;aula054.c,55 :: 		TRISB = 0b01111111;       // apenas RB7 como saída
	MOVLW      127
	MOVWF      TRISB+0
;aula054.c,56 :: 		PORTB = 0b01111111;       // PORT RB7 incia em nível baixo
	MOVLW      127
	MOVWF      PORTB+0
;aula054.c,58 :: 		while(1)
L_main0:
;aula054.c,61 :: 		}
	GOTO       L_main0
;aula054.c,63 :: 		}
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

;aula054.c,66 :: 		void interrupt(){
;aula054.c,68 :: 		if(T0IF_bit){ // houve estouro do TIMER 0?
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt2
;aula054.c,70 :: 		T0IF_bit = 0;
	BCF        T0IF_bit+0, 2
;aula054.c,71 :: 		TMR0 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;aula054.c,72 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;aula054.c,73 :: 		if(counter == 500){ // 500 * 1ms = 500ms?
	MOVF       _counter+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt5
	MOVLW      244
	XORWF      _counter+0, 0
L__interrupt5:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;aula054.c,75 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;aula054.c,76 :: 		output = ~output;
	MOVLW      128
	XORWF      RB7_bit+0, 1
;aula054.c,77 :: 		}
L_interrupt3:
;aula054.c,78 :: 		}
L_interrupt2:
;aula054.c,80 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
