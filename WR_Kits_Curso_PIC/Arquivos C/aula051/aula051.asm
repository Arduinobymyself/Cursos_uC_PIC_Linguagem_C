
_main:

;aula051.c,68 :: 		void main() {
;aula051.c,69 :: 		CMCON = 0X07;                // desabilita compardores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula051.c,71 :: 		T1CON = 0X01;                // habilita contagem do Timer 1, com prescaler
	MOVLW      1
	MOVWF      T1CON+0
;aula051.c,72 :: 		CCP1CON = 0X07;              // configura captura a cada 16 bordas de subida
	MOVLW      7
	MOVWF      CCP1CON+0
;aula051.c,73 :: 		CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
	BSF        CCP1IE_bit+0, 2
;aula051.c,74 :: 		GIE_bit = 0x01;              // habilita interrupção global
	BSF        GIE_bit+0, 7
;aula051.c,75 :: 		PEIE_bit = 0x01;             // habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;aula051.c,77 :: 		TRISA = 0XFF;                // configura o PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula051.c,78 :: 		TRISB = 0X0C;                // configura RB2 e RB3 como entrada 0b00001100
	MOVLW      12
	MOVWF      TRISB+0
;aula051.c,79 :: 		PORTA = 0XFF;                // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula051.c,80 :: 		PORTB = 0X00;                // inicializa o PORT B
	CLRF       PORTB+0
;aula051.c,82 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula051.c,83 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula051.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula051.c,85 :: 		Lcd_Out(1, 1, text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula051.c,86 :: 		Lcd_Out(2, 14, text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula051.c,87 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;aula051.c,89 :: 		while(1)
L_main1:
;aula051.c,91 :: 		time2 = abs(time2 - time1);              // calcula o tempo de 16 períodos
	MOVF       _time1+0, 0
	SUBWF      _time2+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _time1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _time2+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0+0, 0
	MOVWF      _time2+0
	MOVF       R0+1, 0
	MOVWF      _time2+1
;aula051.c,92 :: 		time2 = (time2) >> 4;                    // divide o valor por 16 (2^4) para obter o tempo de um período
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R2+0, 0
L__main7:
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	ADDLW      255
	GOTO       L__main7
L__main8:
	MOVF       R4+0, 0
	MOVWF      _time2+0
	MOVF       R4+1, 0
	MOVWF      _time2+1
;aula051.c,93 :: 		Frequencia = 1/ (time2 * 1E-6);          // converte período para frequência em Hz
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      189
	MOVWF      R4+0
	MOVLW      55
	MOVWF      R4+1
	MOVLW      6
	MOVWF      R4+2
	MOVLW      107
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Longword+0
	MOVF       R0+0, 0
	MOVWF      _Frequencia+0
	MOVF       R0+1, 0
	MOVWF      _Frequencia+1
	MOVF       R0+2, 0
	MOVWF      _Frequencia+2
	MOVF       R0+3, 0
	MOVWF      _Frequencia+3
;aula051.c,94 :: 		LongToStr(Frequencia, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_LongToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_LongToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_LongToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_LongToStr_input+3
	MOVLW      _txt+0
	MOVWF      FARG_LongToStr_output+0
	CALL       _LongToStr+0
;aula051.c,95 :: 		Lcd_Out(2, 1, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula051.c,97 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula051.c,98 :: 		}
	GOTO       L_main1
;aula051.c,100 :: 		}
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula051.c,103 :: 		void interrupt(){
;aula051.c,104 :: 		if(CCP1IF_bit){
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_interrupt4
;aula051.c,105 :: 		CCP1IF_bit = 0x00;                      // limpa flag para nova captura
	BCF        CCP1IF_bit+0, 2
;aula051.c,106 :: 		if(!flag0.B0){
	BTFSC      _flag0+0, 0
	GOTO       L_interrupt5
;aula051.c,107 :: 		time1 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 1
	MOVF       CCPR1H+0, 0
	MOVWF      _time1+1
	CLRF       _time1+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time1+1, 1
;aula051.c,108 :: 		flag0.B0 = 0x01;
	BSF        _flag0+0, 0
;aula051.c,109 :: 		} else {
	GOTO       L_interrupt6
L_interrupt5:
;aula051.c,110 :: 		time2 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 2
	MOVF       CCPR1H+0, 0
	MOVWF      _time2+1
	CLRF       _time2+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time2+1, 1
;aula051.c,111 :: 		flag0.B0 = 0x00;
	BCF        _flag0+0, 0
;aula051.c,112 :: 		flag0.B1 = 0x01;
	BSF        _flag0+0, 1
;aula051.c,113 :: 		}
L_interrupt6:
;aula051.c,114 :: 		}
L_interrupt4:
;aula051.c,115 :: 		}
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
