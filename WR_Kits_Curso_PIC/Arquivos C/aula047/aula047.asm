
_main:

;aula047.c,39 :: 		void main() {
;aula047.c,40 :: 		int tempo = 100;
	MOVLW      100
	MOVWF      main_tempo_L0+0
	MOVLW      0
	MOVWF      main_tempo_L0+1
;aula047.c,42 :: 		CMCON = 0X07; // desabilita os compareadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula047.c,43 :: 		TRISA = 0X03; // 0b00000011 // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula047.c,44 :: 		PORTA = 0X03; // 0b00000011 // RA0 e RA1 iniciam em HIGH
	MOVLW      3
	MOVWF      PORTA+0
;aula047.c,45 :: 		VRCON = 0xE7; // 0b11100111
	MOVLW      231
	MOVWF      VRCON+0
;aula047.c,51 :: 		while(1)
L_main0:
;aula047.c,53 :: 		VRCON = 0xE7;
	MOVLW      231
	MOVWF      VRCON+0
;aula047.c,54 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,55 :: 		VRCON = 0xE6;
	MOVLW      230
	MOVWF      VRCON+0
;aula047.c,56 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,57 :: 		VRCON = 0xE5;
	MOVLW      229
	MOVWF      VRCON+0
;aula047.c,58 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,59 :: 		VRCON = 0xE4;
	MOVLW      228
	MOVWF      VRCON+0
;aula047.c,60 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,61 :: 		VRCON = 0xE3;
	MOVLW      227
	MOVWF      VRCON+0
;aula047.c,62 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,63 :: 		VRCON = 0xE2;
	MOVLW      226
	MOVWF      VRCON+0
;aula047.c,64 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,65 :: 		VRCON = 0xE1;
	MOVLW      225
	MOVWF      VRCON+0
;aula047.c,66 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,67 :: 		VRCON = 0xE0;
	MOVLW      224
	MOVWF      VRCON+0
;aula047.c,68 :: 		Vdelay_ms(tempo);
	MOVF       main_tempo_L0+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       main_tempo_L0+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;aula047.c,69 :: 		}
	GOTO       L_main0
;aula047.c,71 :: 		}
	GOTO       $+0
; end of _main
