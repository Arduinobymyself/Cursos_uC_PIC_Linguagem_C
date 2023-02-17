
_main:

;Conversor-AD_3.c,10 :: 		void main() {
;Conversor-AD_3.c,12 :: 		TRISB = 0b00000000;           // PORT B como saída
	CLRF       TRISB+0
;Conversor-AD_3.c,13 :: 		PORTB = 0b00000000;           // LEDs apagados
	CLRF       PORTB+0
;Conversor-AD_3.c,14 :: 		TRISC = 0b00000000;           // PORT C como saída
	CLRF       TRISC+0
;Conversor-AD_3.c,15 :: 		PORTC = 0b00000000;           // LEDs apagados
	CLRF       PORTC+0
;Conversor-AD_3.c,16 :: 		TRISD = 0b00000000;           // PORT D como saída
	CLRF       TRISD+0
;Conversor-AD_3.c,17 :: 		PORTD = 0b00000000;           // LEDs apagados
	CLRF       PORTD+0
;Conversor-AD_3.c,19 :: 		TRISA.RA0 = 1;                // AN0(RA0) configurado como entrada
	BSF        TRISA+0, 0
;Conversor-AD_3.c,21 :: 		while(1){
L_main0:
;Conversor-AD_3.c,22 :: 		leituraAD1 = ADC_Read(0) / 4; // lê AN0(RA0) - salva na variável
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
	MOVWF      _leituraAD1+0
	MOVF       R2+1, 0
	MOVWF      _leituraAD1+1
;Conversor-AD_3.c,24 :: 		PORTD = leituraAD1;           // carrega resultado no PORT D
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;Conversor-AD_3.c,25 :: 		leituraAD2 = ADC_Read(0);     // lê AN0(RA0) - salva na variável
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leituraAD2+0
	MOVF       R0+1, 0
	MOVWF      _leituraAD2+1
;Conversor-AD_3.c,26 :: 		PORTB = leituraAD2;           // carrega 8 bits LSB no PORT B
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Conversor-AD_3.c,27 :: 		PORTC = leituraAD2 >> 8;      // carrega 2 bits MSB em RC1 e RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTC+0
;Conversor-AD_3.c,28 :: 		}
	GOTO       L_main0
;Conversor-AD_3.c,30 :: 		}
	GOTO       $+0
; end of _main
