
_main:

;Conversor-AD.c,9 :: 		void main() {
;Conversor-AD.c,10 :: 		TRISD = 0b00000000;     // PORT D como ssída
	CLRF       TRISD+0
;Conversor-AD.c,11 :: 		PORTD = 0B00000000;     // LEDs Apagados
	CLRF       PORTD+0
;Conversor-AD.c,12 :: 		TRISA.RA0 = 1;          // AN0(RA0) como entrada
	BSF        TRISA+0, 0
;Conversor-AD.c,14 :: 		ADCON0 = 0b01000101;    // FOSC / 8 - canal 0 (AN0) - conversor em espera - Módulo A/D ligado
	MOVLW      69
	MOVWF      ADCON0+0
;Conversor-AD.c,15 :: 		ADCON1 = 0b00001110;    // Justificado à esquerda - clock conversão FOSC / 8 -  só AN0 analógico
	MOVLW      14
	MOVWF      ADCON1+0
;Conversor-AD.c,17 :: 		while(1){
L_main0:
;Conversor-AD.c,18 :: 		ADCON0.GO = 1;    // conversção A/D em progresso
	BSF        ADCON0+0, 2
;Conversor-AD.c,20 :: 		while(ADCON0.GO); // Espera enquanto a conversão estiver em progresso
L_main2:
	BTFSS      ADCON0+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Conversor-AD.c,22 :: 		PORTD = ADRESH;   // define o valor convertido no PORTD
	MOVF       ADRESH+0, 0
	MOVWF      PORTD+0
;Conversor-AD.c,23 :: 		delay_ms(20);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
;Conversor-AD.c,24 :: 		}
	GOTO       L_main0
;Conversor-AD.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
