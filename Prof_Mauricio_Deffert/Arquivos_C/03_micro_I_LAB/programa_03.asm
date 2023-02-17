
_main:

;programa_03.c,8 :: 		void main() {
;programa_03.c,10 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_03.c,11 :: 		TRISD = 0b00000000;     // port D como saída
	CLRF       TRISD+0
;programa_03.c,12 :: 		PORTD = 0b00000000;     // port D inicia em nível LOW LEDs apagados
	CLRF       PORTD+0
;programa_03.c,13 :: 		TRISB = 0b00000011;     // port B pino RB0 e RB1 como entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;programa_03.c,14 :: 		PORTB = 0b00000011;     // port B pino RB0 e RB1 com pull-up
	MOVLW      3
	MOVWF      PORTB+0
;programa_03.c,16 :: 		while(1){
L_main0:
;programa_03.c,17 :: 		if(PORTB.RB0 == 0) PORTD.RD1 = 1; // se botão B0 pressionado, liga LED D1
	BTFSC      PORTB+0, 0
	GOTO       L_main2
	BSF        PORTD+0, 1
L_main2:
;programa_03.c,18 :: 		if(PORTB.RB1 == 0) PORTD.RD1 = 0; // se botão B1 pressionado, apaga LED D1
	BTFSC      PORTB+0, 1
	GOTO       L_main3
	BCF        PORTD+0, 1
L_main3:
;programa_03.c,19 :: 		PORTD.RD0 = ~PORTD.RD0;           // inverte estado do LED D0
	MOVLW      1
	XORWF      PORTD+0, 1
;programa_03.c,20 :: 		delay_ms(200);                    // aguarda 200ms
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;programa_03.c,21 :: 		}
	GOTO       L_main0
;programa_03.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
