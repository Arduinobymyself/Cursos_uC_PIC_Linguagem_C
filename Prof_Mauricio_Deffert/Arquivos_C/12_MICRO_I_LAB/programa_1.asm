
_main:

;programa_1.c,8 :: 		void main() {
;programa_1.c,9 :: 		TRISD = 0b00000000;     // configuração do PORT D como saída
	CLRF       TRISD+0
;programa_1.c,10 :: 		PORTD = 0b00000000;     // LEDs inicialmente apagados, PORT D em LOW
	CLRF       PORTD+0
;programa_1.c,11 :: 		TRISA.RA0 = 1;          // AN0(RA0) configurado como entrada
	BSF        TRISA+0, 0
;programa_1.c,13 :: 		ADCON0 = 0b01000101;    // [ADCS1 ADCS0 CHS2 CHS1 CHS0 CO/DONE --- ADON]
	MOVLW      69
	MOVWF      ADCON0+0
;programa_1.c,15 :: 		ADCON1 = 0b00001110;    // [ADFM ADCS2 --- --- PCFG3 PCFG2 PCFG1 PCFG0]
	MOVLW      14
	MOVWF      ADCON1+0
;programa_1.c,19 :: 		while(1){
L_main0:
;programa_1.c,20 :: 		ADCON0.GO = 1;          // conversão A/D em progresso
	BSF        ADCON0+0, 2
;programa_1.c,21 :: 		while(ADCON0.GO);       // espera enquanto a conversão estiver em progresso
L_main2:
	BTFSS      ADCON0+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;programa_1.c,22 :: 		PORTD = ADRESH;         // carrega resultado no PORT D
	MOVF       ADRESH+0, 0
	MOVWF      PORTD+0
;programa_1.c,23 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;programa_1.c,24 :: 		}
	GOTO       L_main0
;programa_1.c,25 :: 		}
	GOTO       $+0
; end of _main
