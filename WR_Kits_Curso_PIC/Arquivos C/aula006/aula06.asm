
_main:

;aula06.c,7 :: 		void main() {
;aula06.c,8 :: 		cmcon = 0b00000111; // desliga os comparadores internos CMCON = 7
	MOVLW      7
	MOVWF      CMCON+0
;aula06.c,9 :: 		ansel = 0b00000000; // desligas as entradas A/D
	CLRF       ANSEL+0
;aula06.c,11 :: 		trisio0_bit = 1;  // entradas
	BSF        TRISIO0_bit+0, 0
;aula06.c,12 :: 		trisio1_bit = 1;
	BSF        TRISIO1_bit+0, 1
;aula06.c,14 :: 		trisio4_bit = 0;  // saídas
	BCF        TRISIO4_bit+0, 4
;aula06.c,15 :: 		trisio5_bit = 0;
	BCF        TRISIO5_bit+0, 5
;aula06.c,17 :: 		S1 = 1; // chaves com pullup
	BSF        GPIO+0, 0
;aula06.c,18 :: 		S2 = 1;
	BSF        GPIO+0, 1
;aula06.c,19 :: 		L1 = 0; // leds apagados
	BCF        GPIO+0, 4
;aula06.c,20 :: 		L2 = 0;
	BCF        GPIO+0, 5
;aula06.c,22 :: 		while(1){
L_main0:
;aula06.c,23 :: 		if(!S1){       // se S1 pressionado
	BTFSC      GPIO+0, 0
	GOTO       L_main2
;aula06.c,24 :: 		L1 = ~L1;      // inverte o estado do led 1
	MOVLW      16
	XORWF      GPIO+0, 1
;aula06.c,25 :: 		delay_ms(300); // deboucing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;aula06.c,26 :: 		}
L_main2:
;aula06.c,27 :: 		if(!S2){       // se S2 pressionado
	BTFSC      GPIO+0, 1
	GOTO       L_main4
;aula06.c,28 :: 		L2 = ~L2;      // inverte o estado do led 2
	MOVLW      32
	XORWF      GPIO+0, 1
;aula06.c,29 :: 		delay_ms(300); // deboucing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;aula06.c,30 :: 		}
L_main4:
;aula06.c,31 :: 		}
	GOTO       L_main0
;aula06.c,34 :: 		}
	GOTO       $+0
; end of _main
