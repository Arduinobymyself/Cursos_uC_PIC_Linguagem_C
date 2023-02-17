
_main:

;16f84a_paradoxus.c,20 :: 		void main() {
;16f84a_paradoxus.c,22 :: 		TRISA = 0b00000011; // RA0 e RA1 como entrada
	MOVLW      3
	MOVWF      TRISA+0
;16f84a_paradoxus.c,23 :: 		PORTA = 0b00000011; // RA0 e RA1 com resistores de pull-up
	MOVLW      3
	MOVWF      PORTA+0
;16f84a_paradoxus.c,25 :: 		TRISB = 0b00000000; // port B como saída
	CLRF       TRISB+0
;16f84a_paradoxus.c,26 :: 		PORTB = 0b00000000; // port B inicia em nível baixo
	CLRF       PORTB+0
;16f84a_paradoxus.c,28 :: 		while(1){
L_main0:
;16f84a_paradoxus.c,30 :: 		if(!S1 && flagS1 == 0){  // se pressionou botão
	BTFSC      RA0_bit+0, 0
	GOTO       L_main4
	BTFSC      _flagS1+0, BitPos(_flagS1+0)
	GOTO       L_main4
L__main17:
;16f84a_paradoxus.c,31 :: 		flagS1 = 1;            // seta flag
	BSF        _flagS1+0, BitPos(_flagS1+0)
;16f84a_paradoxus.c,32 :: 		}
L_main4:
;16f84a_paradoxus.c,33 :: 		if(S1 && flagS1 == 1){   // se soltou botão
	BTFSS      RA0_bit+0, 0
	GOTO       L_main7
	BTFSS      _flagS1+0, BitPos(_flagS1+0)
	GOTO       L_main7
L__main16:
;16f84a_paradoxus.c,34 :: 		flagS1 = 0;            // reseta flag
	BCF        _flagS1+0, BitPos(_flagS1+0)
;16f84a_paradoxus.c,35 :: 		L1 = ~L1;              // executa ação
	MOVLW      4
	XORWF      RA2_bit+0, 1
;16f84a_paradoxus.c,36 :: 		}
L_main7:
;16f84a_paradoxus.c,38 :: 		if(!S2 && flagS2 == 0){
	BTFSC      RA1_bit+0, 1
	GOTO       L_main10
	BTFSC      _flagS2+0, BitPos(_flagS2+0)
	GOTO       L_main10
L__main15:
;16f84a_paradoxus.c,39 :: 		flagS2 = 1;
	BSF        _flagS2+0, BitPos(_flagS2+0)
;16f84a_paradoxus.c,40 :: 		}
L_main10:
;16f84a_paradoxus.c,41 :: 		if(S2 && flagS2 == 1){
	BTFSS      RA1_bit+0, 1
	GOTO       L_main13
	BTFSS      _flagS2+0, BitPos(_flagS2+0)
	GOTO       L_main13
L__main14:
;16f84a_paradoxus.c,42 :: 		flagS2 = 0;
	BCF        _flagS2+0, BitPos(_flagS2+0)
;16f84a_paradoxus.c,43 :: 		L2 = ~L2;
	MOVLW      8
	XORWF      RA3_bit+0, 1
;16f84a_paradoxus.c,44 :: 		}
L_main13:
;16f84a_paradoxus.c,46 :: 		}
	GOTO       L_main0
;16f84a_paradoxus.c,48 :: 		}
	GOTO       $+0
; end of _main
