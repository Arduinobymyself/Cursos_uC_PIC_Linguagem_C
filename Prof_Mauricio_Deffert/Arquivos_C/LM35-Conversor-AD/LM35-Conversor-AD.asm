
_main:

;LM35-Conversor-AD.c,10 :: 		void main() {
;LM35-Conversor-AD.c,12 :: 		TRISD = 0b00000000;     // PORT D como ssída
	CLRF       TRISD+0
;LM35-Conversor-AD.c,13 :: 		PORTD = 0B00000000;     // LEDs Apagados
	CLRF       PORTD+0
;LM35-Conversor-AD.c,14 :: 		TRISA.RA1 = 1;          // AN1(RA1) como entrada
	BSF        TRISA+0, 1
;LM35-Conversor-AD.c,18 :: 		while(1){
L_main0:
;LM35-Conversor-AD.c,19 :: 		leituraAD = adc_read(1); // leitura do canal AN1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leituraAD+0
	MOVF       R0+1, 0
	MOVWF      _leituraAD+1
;LM35-Conversor-AD.c,20 :: 		leituraAD = (leituraAD / 4); // conversão do resultado de 10 para 8 bits
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
	MOVF       R2+1, 0
	MOVWF      _leituraAD+1
;LM35-Conversor-AD.c,23 :: 		PORTD = leituraAD; // carrega a informação no PORT D
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;LM35-Conversor-AD.c,24 :: 		}
	GOTO       L_main0
;LM35-Conversor-AD.c,25 :: 		}
	GOTO       $+0
; end of _main
