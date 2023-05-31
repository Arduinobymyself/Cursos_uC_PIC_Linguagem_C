
_main:

;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,12 :: 		void main() {
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,13 :: 		TRISB.RB0 = 0;
	BCF        TRISB+0, 0
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,14 :: 		TRISB1_bit = 0;
	BCF        TRISB1_bit+0, 1
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,15 :: 		TRISB.f2 = 0;
	BCF        TRISB+0, 2
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,17 :: 		while(1){
L_main0:
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,18 :: 		PORTB.RB0 = 1;
	BSF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,19 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, 1
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,20 :: 		PORTB.f2 = 1;
	BSF        PORTB+0, 2
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,22 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,24 :: 		PORTB.RB0 = 0;
	BCF        PORTB+0, 0
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,25 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, 1
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,26 :: 		PORTB.f2 = 0;
	BCF        PORTB+0, 2
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,28 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,29 :: 		}
	GOTO       L_main0
;Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c,31 :: 		}
	GOTO       $+0
; end of _main
