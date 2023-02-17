
_main:

;Conversor-AD_2.c,10 :: 		void main() {
;Conversor-AD_2.c,11 :: 		TRISD = 0b00000000;                  // configura PORT D  como saída
	CLRF       TRISD+0
;Conversor-AD_2.c,12 :: 		PORTD = 0b00000000;                  // LEDs apagados
	CLRF       PORTD+0
;Conversor-AD_2.c,13 :: 		TRISA.RA0 = 1;                       // AN0(RA0) configurado como entrada
	BSF        TRISA+0, 0
;Conversor-AD_2.c,15 :: 		while(1){
L_main0:
;Conversor-AD_2.c,16 :: 		leituraAD = ADC_Read(0) / 4;       // lê o canal analógico 0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _leituraAD+0
;Conversor-AD_2.c,20 :: 		PORTD = leituraAD;                 // carrega resultado para o PORT D
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;Conversor-AD_2.c,21 :: 		}
	GOTO       L_main0
;Conversor-AD_2.c,22 :: 		}
	GOTO       $+0
; end of _main
