
_main:

;aula038.c,30 :: 		void main() {
;aula038.c,31 :: 		CMCON = 0b00000010;   // habilita comparadores 1 e 2 modo Two Independent Comparators
	MOVLW      2
	MOVWF      CMCON+0
;aula038.c,34 :: 		GIE_bit = 1;          // habilita interrupção global
	BSF        GIE_bit+0, 7
;aula038.c,35 :: 		PEIE_bit = 1;         // habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;aula038.c,36 :: 		CMIE_bit = 1;         // habilita interrupção por comparadores
	BSF        CMIE_bit+0, 6
;aula038.c,38 :: 		TRISA = 0b00001111;   // nible LSB como entrada
	MOVLW      15
	MOVWF      TRISA+0
;aula038.c,39 :: 		TRISB = 0;
	CLRF       TRISB+0
;aula038.c,40 :: 		PORTB = 0;
	CLRF       PORTB+0
;aula038.c,47 :: 		}
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

;aula038.c,50 :: 		void interrupt(){
;aula038.c,51 :: 		if(CMIF_bit){     // testa flag de interrupção
	BTFSS      CMIF_bit+0, 6
	GOTO       L_interrupt0
;aula038.c,52 :: 		CMIF_bit = 0;   // limpa flag de interrupção
	BCF        CMIF_bit+0, 6
;aula038.c,53 :: 		if(C1OUT_bit){  // verifica flag de saída do comparador
	BTFSS      C1OUT_bit+0, 6
	GOTO       L_interrupt1
;aula038.c,54 :: 		RB3_bit = 1;  // se alto
	BSF        RB3_bit+0, 3
;aula038.c,55 :: 		} else {
	GOTO       L_interrupt2
L_interrupt1:
;aula038.c,56 :: 		RB3_bit = 0;  // se baixo
	BCF        RB3_bit+0, 3
;aula038.c,57 :: 		}
L_interrupt2:
;aula038.c,58 :: 		}
L_interrupt0:
;aula038.c,59 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
