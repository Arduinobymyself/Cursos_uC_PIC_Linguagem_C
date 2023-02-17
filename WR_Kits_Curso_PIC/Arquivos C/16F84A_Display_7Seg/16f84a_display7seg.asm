
_main:

;16f84a_display7seg.c,23 :: 		void main() {
;16f84a_display7seg.c,25 :: 		TRISB = 0b00000000; // port B como saída
	CLRF       TRISB+0
;16f84a_display7seg.c,26 :: 		PORTB = 0b00000000; // port B inicia em nível baixo
	CLRF       PORTB+0
;16f84a_display7seg.c,28 :: 		while(1){
L_main0:
;16f84a_display7seg.c,30 :: 		for(i=0; i<16; i++){
	CLRF       _i+0
L_main2:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;16f84a_display7seg.c,31 :: 		PORTB = digitosCA[i];
	MOVF       _i+0, 0
	ADDLW      _digitosCA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;16f84a_display7seg.c,32 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;16f84a_display7seg.c,30 :: 		for(i=0; i<16; i++){
	INCF       _i+0, 1
;16f84a_display7seg.c,33 :: 		}
	GOTO       L_main2
L_main3:
;16f84a_display7seg.c,35 :: 		}
	GOTO       L_main0
;16f84a_display7seg.c,37 :: 		}
	GOTO       $+0
; end of _main
