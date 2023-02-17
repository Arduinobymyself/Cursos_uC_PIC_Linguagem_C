
_main:

;programa_04.c,7 :: 		void main() {
;programa_04.c,9 :: 		ADCON1 = 0b00000111;    // configura pinos de I/O como digital
	MOVLW      7
	MOVWF      ADCON1+0
;programa_04.c,10 :: 		TRISD = 0b00000000;     // port D como saída
	CLRF       TRISD+0
;programa_04.c,11 :: 		PORTD = 0b00000000;     // port D inicia em nível LOW LEDs apagados
	CLRF       PORTD+0
;programa_04.c,12 :: 		TRISB = 0b00000001;     // port B pino RB0 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;programa_04.c,13 :: 		PORTB = 0b00000001;     // port B pino RB0 com pull-up
	MOVLW      1
	MOVWF      PORTB+0
;programa_04.c,17 :: 		while(1){
L_main0:
;programa_04.c,18 :: 		int flag = 0;           // sinaliza o estado do botão B0
	CLRF       main_flag_L1+0
	CLRF       main_flag_L1+1
;programa_04.c,19 :: 		if(PORTB.RB0 == 0){ // se botão B0 pressionado
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;programa_04.c,20 :: 		delay_ms(30);     // delay para debouncing do botão
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;programa_04.c,22 :: 		if(flag == 0){
	MOVLW      0
	XORWF      main_flag_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      0
	XORWF      main_flag_L1+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;programa_04.c,23 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte estado do LED D0
	MOVLW      1
	XORWF      PORTD+0, 1
;programa_04.c,24 :: 		flag = 1;               // sinaliza flag de estado do botão (pressionado)
	MOVLW      1
	MOVWF      main_flag_L1+0
	MOVLW      0
	MOVWF      main_flag_L1+1
;programa_04.c,25 :: 		} else {
	GOTO       L_main5
L_main4:
;programa_04.c,26 :: 		flag = 0;               // reincializa o flag
	CLRF       main_flag_L1+0
	CLRF       main_flag_L1+1
;programa_04.c,27 :: 		}
L_main5:
;programa_04.c,29 :: 		}
L_main2:
;programa_04.c,31 :: 		}
	GOTO       L_main0
;programa_04.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
