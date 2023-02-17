
_main:

;WDT_Teste.c,1 :: 		void main() {
;WDT_Teste.c,2 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;WDT_Teste.c,3 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;WDT_Teste.c,4 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;WDT_Teste.c,5 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;WDT_Teste.c,6 :: 		PORTD = 0b11000000; // LED7 e LED6 ligados
	MOVLW      192
	MOVWF      PORTD+0
;WDT_Teste.c,8 :: 		OPTION_REG = 0b10001100; // PSA<3> = 1 para WDT - PS<2:0> prescaler 1:32 = 101
	MOVLW      140
	MOVWF      OPTION_REG+0
;WDT_Teste.c,11 :: 		while(1){
L_main0:
;WDT_Teste.c,12 :: 		PORTD.RD0 = ~PORTD.RD0;
	MOVLW      1
	XORWF      PORTD+0, 1
;WDT_Teste.c,13 :: 		asm clrwdt; // chama interrupção do Assembly, limpando a flag de estouro do WDT
	CLRWDT
;WDT_Teste.c,14 :: 		delay_ms(500); // na simulação, podemos variar esse tempo, se for maior que 576ms
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;WDT_Teste.c,18 :: 		}
	GOTO       L_main0
;WDT_Teste.c,19 :: 		}
	GOTO       $+0
; end of _main
