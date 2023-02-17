
_main:

;aula12.c,39 :: 		void main() {
;aula12.c,40 :: 		ansel = 0x01;  // entrada analógica AN0 selecionada (0b00000001)
	MOVLW      1
	MOVWF      ANSEL+0
;aula12.c,41 :: 		adcon0 = 0x01; // entrada analógica AN0 habilitada
	MOVLW      1
	MOVWF      ADCON0+0
;aula12.c,42 :: 		cmcon = 0x07;  // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula12.c,44 :: 		trisio = 0x01; // gpio.f0 configurado como uma entrada (0b00000001)
	MOVLW      1
	MOVWF      TRISIO+0
;aula12.c,45 :: 		gpio = 0x00;   // inicia o todo o gpio em nível baixo
	CLRF       GPIO+0
;aula12.c,47 :: 		while(1){
L_main0:
;aula12.c,49 :: 		leitura = adc_read(0); // faz a leitura
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leitura+0
	MOVF       R0+1, 0
	MOVWF      _leitura+1
;aula12.c,51 :: 		if(leitura > 0){
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       R0+0, 0
	SUBLW      0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;aula12.c,52 :: 		D1 = 0;
	BCF        GPIO+0, 1
;aula12.c,53 :: 		D2 = 0;
	BCF        GPIO+0, 2
;aula12.c,54 :: 		D3 = 0;
	BCF        GPIO+0, 4
;aula12.c,55 :: 		D4 = 0;
	BCF        GPIO+0, 5
;aula12.c,56 :: 		}
L_main2:
;aula12.c,57 :: 		if(leitura > 256){
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _leitura+0, 0
	SUBLW      0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;aula12.c,58 :: 		D1 = 1;
	BSF        GPIO+0, 1
;aula12.c,59 :: 		D2 = 0;
	BCF        GPIO+0, 2
;aula12.c,60 :: 		D3 = 0;
	BCF        GPIO+0, 4
;aula12.c,61 :: 		D4 = 0;
	BCF        GPIO+0, 5
;aula12.c,62 :: 		}
L_main3:
;aula12.c,63 :: 		if(leitura > 512){
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       _leitura+0, 0
	SUBLW      0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;aula12.c,64 :: 		D1 = 1;
	BSF        GPIO+0, 1
;aula12.c,65 :: 		D2 = 1;
	BSF        GPIO+0, 2
;aula12.c,66 :: 		D3 = 0;
	BCF        GPIO+0, 4
;aula12.c,67 :: 		D4 = 0;
	BCF        GPIO+0, 5
;aula12.c,68 :: 		}
L_main4:
;aula12.c,69 :: 		if(leitura > 768){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _leitura+0, 0
	SUBLW      0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;aula12.c,70 :: 		D1 = 1;
	BSF        GPIO+0, 1
;aula12.c,71 :: 		D2 = 1;
	BSF        GPIO+0, 2
;aula12.c,72 :: 		D3 = 1;
	BSF        GPIO+0, 4
;aula12.c,73 :: 		D4 = 0;
	BCF        GPIO+0, 5
;aula12.c,74 :: 		}
L_main5:
;aula12.c,75 :: 		if(leitura > 816){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _leitura+0, 0
	SUBLW      48
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;aula12.c,76 :: 		D1 = 1;
	BSF        GPIO+0, 1
;aula12.c,77 :: 		D2 = 1;
	BSF        GPIO+0, 2
;aula12.c,78 :: 		D3 = 1;
	BSF        GPIO+0, 4
;aula12.c,79 :: 		D4 = 1;
	BSF        GPIO+0, 5
;aula12.c,80 :: 		}
L_main6:
;aula12.c,81 :: 		delay_ms(100); // taxa de atualização
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;aula12.c,82 :: 		}
	GOTO       L_main0
;aula12.c,83 :: 		}
	GOTO       $+0
; end of _main
