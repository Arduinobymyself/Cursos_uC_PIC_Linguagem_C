
_main:

;VSaula048.c,71 :: 		void main() {
;VSaula048.c,73 :: 		TRISC = 0b00000100; // RC2/CCP1 como entrada
	MOVLW      4
	MOVWF      TRISC+0
;VSaula048.c,75 :: 		T1CON = 0b00010000; // tempo de incremento do Timer 1 de 1us
	MOVLW      16
	MOVWF      T1CON+0
;VSaula048.c,78 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;VSaula048.c,79 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;VSaula048.c,82 :: 		CCP1M3_bit =0;
	BCF        CCP1M3_bit+0, 3
;VSaula048.c,83 :: 		CCP1M2_bit =1;
	BSF        CCP1M2_bit+0, 2
;VSaula048.c,84 :: 		CCP1M1_bit =0;
	BCF        CCP1M1_bit+0, 1
;VSaula048.c,85 :: 		CCP1M0_bit =1;
	BSF        CCP1M0_bit+0, 0
;VSaula048.c,89 :: 		INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      192
	MOVWF      INTCON+0
;VSaula048.c,90 :: 		TMR1IE_bit = 0; // não precisa habilitar a interrupção do Timer 1
	BCF        TMR1IE_bit+0, 0
;VSaula048.c,91 :: 		CCP1IE_bit = 1; // habilita interrupção por CCP1
	BSF        CCP1IE_bit+0, 2
;VSaula048.c,94 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;VSaula048.c,95 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula048.c,96 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula048.c,97 :: 		LCD_Out(1, 14, "us");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_VSaula048+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula048.c,98 :: 		LCD_Out(2, 14, "Hz");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_VSaula048+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula048.c,100 :: 		while(1){
L_main0:
;VSaula048.c,102 :: 		if(flag.b1){
	BTFSS      _flag+0, 1
	GOTO       L_main2
;VSaula048.c,103 :: 		LongToStr((tempo), texto);
	MOVF       _tempo+0, 0
	MOVWF      FARG_LongToStr_input+0
	MOVF       _tempo+1, 0
	MOVWF      FARG_LongToStr_input+1
	CLRF       FARG_LongToStr_input+2
	CLRF       FARG_LongToStr_input+3
	MOVLW      _texto+0
	MOVWF      FARG_LongToStr_output+0
	CALL       _LongToStr+0
;VSaula048.c,104 :: 		Lcd_Out(1, 1, texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula048.c,105 :: 		freq = 1000000/(2*tempo);
	MOVF       _tempo+0, 0
	MOVWF      R4+0
	MOVF       _tempo+1, 0
	MOVWF      R4+1
	RLF        R4+0, 1
	RLF        R4+1, 1
	BCF        R4+0, 0
	MOVLW      0
	MOVWF      R4+2
	MOVWF      R4+3
	MOVLW      64
	MOVWF      R0+0
	MOVLW      66
	MOVWF      R0+1
	MOVLW      15
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _freq+0
	MOVF       R0+1, 0
	MOVWF      _freq+1
;VSaula048.c,106 :: 		LongToStr(freq, texto);
	MOVF       R0+0, 0
	MOVWF      FARG_LongToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_LongToStr_input+1
	CLRF       FARG_LongToStr_input+2
	CLRF       FARG_LongToStr_input+3
	MOVLW      _texto+0
	MOVWF      FARG_LongToStr_output+0
	CALL       _LongToStr+0
;VSaula048.c,107 :: 		LCD_Out(2, 1, texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula048.c,108 :: 		flag.b1 = 0;
	BCF        _flag+0, 1
;VSaula048.c,109 :: 		}
L_main2:
;VSaula048.c,111 :: 		}
	GOTO       L_main0
;VSaula048.c,113 :: 		}
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

;VSaula048.c,116 :: 		void interrupt(){
;VSaula048.c,118 :: 		if(CCP1IF_bit){
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_interrupt3
;VSaula048.c,119 :: 		if(flag.b0){
	BTFSS      _flag+0, 0
	GOTO       L_interrupt4
;VSaula048.c,120 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;VSaula048.c,121 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;VSaula048.c,122 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, 0
;VSaula048.c,123 :: 		CCP1M0_bit = 0; // configura módulo CCP para captura por borda de descida
	BCF        CCP1M0_bit+0, 0
;VSaula048.c,124 :: 		flag.b0 = 0;
	BCF        _flag+0, 0
;VSaula048.c,125 :: 		} else {
	GOTO       L_interrupt5
L_interrupt4:
;VSaula048.c,126 :: 		TMR1ON_bit = 0;
	BCF        TMR1ON_bit+0, 0
;VSaula048.c,127 :: 		tempo = (TMR1H<<8)+TMR1L;
	MOVF       TMR1H+0, 0
	MOVWF      _tempo+1
	CLRF       _tempo+0
	MOVF       TMR1L+0, 0
	ADDWF      _tempo+0, 1
	BTFSC      STATUS+0, 0
	INCF       _tempo+1, 1
;VSaula048.c,128 :: 		CCP1M0_bit = 1; // configura módulo CCP para captura por borda de subida
	BSF        CCP1M0_bit+0, 0
;VSaula048.c,129 :: 		flag.b0 = 0;
	BCF        _flag+0, 0
;VSaula048.c,130 :: 		flag.b1 = 1;
	BSF        _flag+0, 1
;VSaula048.c,131 :: 		}
L_interrupt5:
;VSaula048.c,132 :: 		CCP1IF_bit = 0;
	BCF        CCP1IF_bit+0, 2
;VSaula048.c,133 :: 		}
L_interrupt3:
;VSaula048.c,135 :: 		}
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
