
_main:

;programa_2.c,11 :: 		void main() {
;programa_2.c,12 :: 		TRISD = 0b00000000;                  // configura PORT D  como saída
	CLRF       TRISD+0
;programa_2.c,13 :: 		PORTD = 0b00000000;                  // LEDs apagados
	CLRF       PORTD+0
;programa_2.c,14 :: 		TRISA.RA1 = 1;                       // AN1(RA1) configurado como entrada
	BSF        TRISA+0, 1
;programa_2.c,16 :: 		while(1){
L_main0:
;programa_2.c,17 :: 		leituraAD = ADC_Read(1);           // lê o canal analógico 0
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leituraAD+0
;programa_2.c,18 :: 		leituraAD /= 4;                    // salva na variável
	MOVF       R0+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVF       R2+0, 0
	MOVWF      _leituraAD+0
;programa_2.c,22 :: 		temp = leituraAD*0.4887;
	MOVF       R2+0, 0
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;programa_2.c,24 :: 		PORTD = leituraAD;                 // carrega resultado para o PORT D
	MOVF       _leituraAD+0, 0
	MOVWF      PORTD+0
;programa_2.c,25 :: 		}
	GOTO       L_main0
;programa_2.c,26 :: 		}
	GOTO       $+0
; end of _main
