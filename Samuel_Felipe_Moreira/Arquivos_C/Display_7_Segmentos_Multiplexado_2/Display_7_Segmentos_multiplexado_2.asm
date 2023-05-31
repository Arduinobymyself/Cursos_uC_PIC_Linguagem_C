
_main:

;Display_7_Segmentos_multiplexado_2.c,9 :: 		void main() {
;Display_7_Segmentos_multiplexado_2.c,11 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Display_7_Segmentos_multiplexado_2.c,13 :: 		ADCON0 = 0;
	CLRF       ADCON0+0
;Display_7_Segmentos_multiplexado_2.c,14 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Display_7_Segmentos_multiplexado_2.c,16 :: 		TRISD = 0;
	CLRF       TRISD+0
;Display_7_Segmentos_multiplexado_2.c,17 :: 		PORTD = 0;
	CLRF       PORTD+0
;Display_7_Segmentos_multiplexado_2.c,18 :: 		TRISA = 0;
	CLRF       TRISA+0
;Display_7_Segmentos_multiplexado_2.c,19 :: 		PORTA = 0;
	CLRF       PORTA+0
;Display_7_Segmentos_multiplexado_2.c,22 :: 		while(1){
L_main0:
;Display_7_Segmentos_multiplexado_2.c,25 :: 		PORTD = erro[0];   // E
	MOVF       _erro+0, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_multiplexado_2.c,26 :: 		PORTA.RA2 = 1;
	BSF        PORTA+0, 2
;Display_7_Segmentos_multiplexado_2.c,27 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,28 :: 		PORTA.RA2 = 0;
	BCF        PORTA+0, 2
;Display_7_Segmentos_multiplexado_2.c,29 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,32 :: 		PORTD = erro[1];   // r
	MOVF       _erro+2, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_multiplexado_2.c,33 :: 		PORTA.RA3 = 1;
	BSF        PORTA+0, 3
;Display_7_Segmentos_multiplexado_2.c,34 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,35 :: 		PORTA.RA3 = 0;
	BCF        PORTA+0, 3
;Display_7_Segmentos_multiplexado_2.c,36 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,39 :: 		PORTD = erro[1];   // r
	MOVF       _erro+2, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_multiplexado_2.c,40 :: 		PORTA.RA4 = 1;
	BSF        PORTA+0, 4
;Display_7_Segmentos_multiplexado_2.c,41 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,42 :: 		PORTA.RA4 = 0;
	BCF        PORTA+0, 4
;Display_7_Segmentos_multiplexado_2.c,43 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,46 :: 		PORTD = erro[2];   // o
	MOVF       _erro+4, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_multiplexado_2.c,47 :: 		PORTA.RA5 = 1;
	BSF        PORTA+0, 5
;Display_7_Segmentos_multiplexado_2.c,48 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,49 :: 		PORTA.RA5 = 0;
	BCF        PORTA+0, 5
;Display_7_Segmentos_multiplexado_2.c,50 :: 		Vdelay_ms(tempo);
	MOVF       _tempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Display_7_Segmentos_multiplexado_2.c,52 :: 		}
	GOTO       L_main0
;Display_7_Segmentos_multiplexado_2.c,54 :: 		}
	GOTO       $+0
; end of _main
