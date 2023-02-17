
_main:

;aula041.c,36 :: 		void main() {
;aula041.c,37 :: 		CMCON = 0b00000111;   // desabilita comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula041.c,39 :: 		T1CON = 0b00110001;   // prescaler 1:8, Timer1 On
	MOVLW      49
	MOVWF      T1CON+0
;aula041.c,41 :: 		TMR1H = 0xFC;         // inicializa o TMR1
	MOVLW      252
	MOVWF      TMR1H+0
;aula041.c,42 :: 		TMR1L = 0x18;
	MOVLW      24
	MOVWF      TMR1L+0
;aula041.c,44 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, 7
;aula041.c,45 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, 6
;aula041.c,46 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, 0
;aula041.c,47 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, 0
;aula041.c,50 :: 		TRISC = 0;
	CLRF       TRISC+0
;aula041.c,51 :: 		PORTC = 0;
	CLRF       PORTC+0
;aula041.c,53 :: 		while(1){
L_main0:
;aula041.c,55 :: 		}
	GOTO       L_main0
;aula041.c,60 :: 		}
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

;aula041.c,63 :: 		void interrupt(){
;aula041.c,64 :: 		if(TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, 0
	GOTO       L_interrupt2
;aula041.c,65 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, 0
;aula041.c,67 :: 		TMR1H = 0xFC;
	MOVLW      252
	MOVWF      TMR1H+0
;aula041.c,68 :: 		TMR1L = 0x18;
	MOVLW      24
	MOVWF      TMR1L+0
;aula041.c,70 :: 		RC4_bit = 0;
	BCF        RC4_bit+0, 4
;aula041.c,72 :: 		aux++;
	INCF       _aux+0, 1
;aula041.c,74 :: 		if(aux == 50){ // 50 * 2ms = 100ms
	MOVF       _aux+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;aula041.c,75 :: 		aux = 0;
	CLRF       _aux+0
;aula041.c,76 :: 		RC4_bit = 1;
	BSF        RC4_bit+0, 4
;aula041.c,77 :: 		RC5_bit = ~RC5_bit;
	MOVLW      32
	XORWF      RC5_bit+0, 1
;aula041.c,78 :: 		}
L_interrupt3:
;aula041.c,84 :: 		}
L_interrupt2:
;aula041.c,85 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
