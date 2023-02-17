
_main:

;12f675_teste_leitura analógica.c,10 :: 		void main() {
;12f675_teste_leitura analógica.c,11 :: 		ANSEL  = 0b00000001; // entrada analógica AN0 selecionada
	MOVLW      1
	MOVWF      ANSEL+0
;12f675_teste_leitura analógica.c,12 :: 		ADCON0 = 0b00000001; // entrada analógica AN0 habilitada
	MOVLW      1
	MOVWF      ADCON0+0
;12f675_teste_leitura analógica.c,13 :: 		CMCON  = 0b00000111; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;12f675_teste_leitura analógica.c,14 :: 		TRISIO = 0b00000001; // GPIO.F0 como entrada
	MOVLW      1
	MOVWF      TRISIO+0
;12f675_teste_leitura analógica.c,15 :: 		GPIO   = 0;          // inicia em nível baixo
	CLRF       GPIO+0
;12f675_teste_leitura analógica.c,17 :: 		while(1){
L_main0:
;12f675_teste_leitura analógica.c,19 :: 		leitura = adc_read(0); // faz a leitura do AN0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leitura+0
	MOVF       R0+1, 0
	MOVWF      _leitura+1
;12f675_teste_leitura analógica.c,21 :: 		if(leitura > 256){
	MOVLW      128
	XORLW      1
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVF       R0+0, 0
	SUBLW      0
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;12f675_teste_leitura analógica.c,22 :: 		L1 = 1;
	BSF        GPIO+0, 1
;12f675_teste_leitura analógica.c,23 :: 		L2 = 0;
	BCF        GPIO+0, 2
;12f675_teste_leitura analógica.c,24 :: 		L3 = 0;
	BCF        GPIO+0, 4
;12f675_teste_leitura analógica.c,25 :: 		}
L_main2:
;12f675_teste_leitura analógica.c,27 :: 		if(leitura > 512){
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVF       _leitura+0, 0
	SUBLW      0
L__main6:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;12f675_teste_leitura analógica.c,28 :: 		L1 = 0;
	BCF        GPIO+0, 1
;12f675_teste_leitura analógica.c,29 :: 		L2 = 1;
	BSF        GPIO+0, 2
;12f675_teste_leitura analógica.c,30 :: 		L3 = 0;
	BCF        GPIO+0, 4
;12f675_teste_leitura analógica.c,31 :: 		}
L_main3:
;12f675_teste_leitura analógica.c,33 :: 		if(leitura > 768){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       _leitura+0, 0
	SUBLW      0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;12f675_teste_leitura analógica.c,34 :: 		L1 = 0;
	BCF        GPIO+0, 1
;12f675_teste_leitura analógica.c,35 :: 		L2 = 0;
	BCF        GPIO+0, 2
;12f675_teste_leitura analógica.c,36 :: 		L3 = 1;
	BSF        GPIO+0, 4
;12f675_teste_leitura analógica.c,37 :: 		}
L_main4:
;12f675_teste_leitura analógica.c,39 :: 		}
	GOTO       L_main0
;12f675_teste_leitura analógica.c,41 :: 		}
	GOTO       $+0
; end of _main
