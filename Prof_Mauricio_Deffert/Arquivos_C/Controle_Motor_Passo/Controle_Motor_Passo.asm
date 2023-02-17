
_main:

;Controle_Motor_Passo.c,29 :: 		void main() {
;Controle_Motor_Passo.c,32 :: 		PORTC = 0b00000001; // A1=1 (RC0)
	MOVLW      1
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,33 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,34 :: 		PORTC = 0b00000010; // A1=1 (RC0)
	MOVLW      2
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,35 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,36 :: 		PORTC = 0b00000100; // A1=1 (RC0)
	MOVLW      4
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,37 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,38 :: 		PORTC = 0b00001000; // A1=1 (RC0)
	MOVLW      8
	MOVWF      PORTC+0
;Controle_Motor_Passo.c,39 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Controle_Motor_Passo.c,41 :: 		}
	GOTO       $+0
; end of _main
