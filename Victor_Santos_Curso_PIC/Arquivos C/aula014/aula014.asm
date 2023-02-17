
_main:

;aula014.c,55 :: 		void main() {
;aula014.c,56 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula014.c,57 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;aula014.c,58 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;aula014.c,59 :: 		TRISA = 0b00000001;  // RA0 como entrada digital B0
	MOVLW      1
	MOVWF      TRISA+0
;aula014.c,60 :: 		PORTA = 0X00;
	CLRF       PORTA+0
;aula014.c,62 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula014.c,93 :: 		while(1){
L_main0:
;aula014.c,94 :: 		Lcd_Out(1, 1, "  ABMS Telecom  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_aula014+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula014.c,95 :: 		Lcd_Out(2, 1, " Seja Bem Vindo!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_aula014+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula014.c,96 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;aula014.c,97 :: 		Lcd_Out(1, 1, "  Linguagem C   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_aula014+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula014.c,98 :: 		Lcd_Out(2, 1, "   MikroC PRO   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_aula014+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula014.c,99 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;aula014.c,100 :: 		}
	GOTO       L_main0
;aula014.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
