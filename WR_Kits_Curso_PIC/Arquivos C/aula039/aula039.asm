
_main:

;aula039.c,30 :: 		void main() {
;aula039.c,31 :: 		CMCON = 0b00000111;   // desabilita comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula039.c,33 :: 		GIE_bit = 1;          // habilita interrupção global
	BSF        GIE_bit+0, 7
;aula039.c,34 :: 		PEIE_bit = 1;         // habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;aula039.c,35 :: 		RBIE_bit = 1;         // habilita interrupção por comparadores
	BSF        RBIE_bit+0, 3
;aula039.c,37 :: 		TRISB = 0b11110000;   // port B nibble MSB como entrada digital
	MOVLW      240
	MOVWF      TRISB+0
;aula039.c,38 :: 		PORTB = 0b11110000;   // port B nibble MSB com pull-up
	MOVLW      240
	MOVWF      PORTB+0
;aula039.c,39 :: 		TRISC = 0b00000000;   // port C como saída digital
	CLRF       TRISC+0
;aula039.c,40 :: 		PORTC = 0b00000000;   // port C inicia em nível baixo
	CLRF       PORTC+0
;aula039.c,44 :: 		}
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

;aula039.c,47 :: 		void interrupt(){
;aula039.c,48 :: 		if(RBIF_bit){     // testa flag de interrupção
	BTFSS      RBIF_bit+0, 0
	GOTO       L_interrupt0
;aula039.c,49 :: 		RBIF_bit = 0;   // limpa flag de interrupção
	BCF        RBIF_bit+0, 0
;aula039.c,50 :: 		RC4_bit = ~RC4_bit;
	MOVLW      16
	XORWF      RC4_bit+0, 1
;aula039.c,51 :: 		delay_us(500);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
	NOP
	NOP
;aula039.c,52 :: 		}
L_interrupt0:
;aula039.c,53 :: 		}
L__interrupt2:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
