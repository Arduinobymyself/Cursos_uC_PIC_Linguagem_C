
_main:

;LCD-Relogio-Digital.c,35 :: 		void main(){
;LCD-Relogio-Digital.c,37 :: 		setupMCU();
	CALL       _setupMCU+0
;LCD-Relogio-Digital.c,39 :: 		while(1){
L_main0:
;LCD-Relogio-Digital.c,40 :: 		clock[0] = horas/10+'0'; // carrega hora (dezena) para índice 0 da string
	MOVF       _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _horas+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,41 :: 		clock[1] = horas%10+'0'; // carrega hora (unidade) para índice 1 da string
	INCF       _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _horas+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,42 :: 		clock[3] = minutos/10+'0'; // carrega minutos (dezena) para índice 3 da string
	MOVLW      3
	ADDWF      _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutos+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,43 :: 		clock[4] = minutos%10+'0'; // carrega minutos (unidade) para índice 4 da string
	MOVLW      4
	ADDWF      _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutos+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,44 :: 		clock[6] = segundos/10+'0'; // carrega segundos (dezena) para índice 6 da string
	MOVLW      6
	ADDWF      _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _segundos+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,45 :: 		clock[7] = segundos%10+'0'; // carrega segundos (unidade) para índice 7 da string
	MOVLW      7
	ADDWF      _clock+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _segundos+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD-Relogio-Digital.c,47 :: 		Lcd_Out(2, 5, clock);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _clock+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Relogio-Digital.c,49 :: 		if(PORTB.RB0) Flags.B0 = 1; // trava tecla
	BTFSS      PORTB+0, 0
	GOTO       L_main2
	BSF        _Flags+0, 0
L_main2:
;LCD-Relogio-Digital.c,50 :: 		if(PORTB.RB1) Flags.B1 = 1; // trava tecla
	BTFSS      PORTB+0, 1
	GOTO       L_main3
	BSF        _Flags+0, 1
L_main3:
;LCD-Relogio-Digital.c,51 :: 		if(PORTB.RB2) Flags.B2 = 1; // trava tecla
	BTFSS      PORTB+0, 2
	GOTO       L_main4
	BSF        _Flags+0, 2
L_main4:
;LCD-Relogio-Digital.c,53 :: 		if(PORTB.RB0 == 0 && Flags.B0){ // ajuste dos segundos
	BTFSC      PORTB+0, 0
	GOTO       L_main7
	BTFSS      _Flags+0, 0
	GOTO       L_main7
L__main22:
;LCD-Relogio-Digital.c,54 :: 		Flags.B0 = 0;
	BCF        _Flags+0, 0
;LCD-Relogio-Digital.c,55 :: 		segundos = 0;
	CLRF       _segundos+0
;LCD-Relogio-Digital.c,56 :: 		}
L_main7:
;LCD-Relogio-Digital.c,58 :: 		if(PORTB.RB1 == 0 && Flags.B1){ // ajuste dos minutos
	BTFSC      PORTB+0, 1
	GOTO       L_main10
	BTFSS      _Flags+0, 1
	GOTO       L_main10
L__main21:
;LCD-Relogio-Digital.c,59 :: 		Flags.B1 = 0;
	BCF        _Flags+0, 1
;LCD-Relogio-Digital.c,60 :: 		minutos++;
	INCF       _minutos+0, 1
;LCD-Relogio-Digital.c,61 :: 		if(minutos >= 60) minutos = 0;
	MOVLW      60
	SUBWF      _minutos+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main11
	CLRF       _minutos+0
L_main11:
;LCD-Relogio-Digital.c,62 :: 		}
L_main10:
;LCD-Relogio-Digital.c,64 :: 		if(PORTB.RB2 == 0 && Flags.B2){ // ajuste das horas
	BTFSC      PORTB+0, 2
	GOTO       L_main14
	BTFSS      _Flags+0, 2
	GOTO       L_main14
L__main20:
;LCD-Relogio-Digital.c,65 :: 		Flags.B2 = 0;
	BCF        _Flags+0, 2
;LCD-Relogio-Digital.c,66 :: 		horas++;
	INCF       _horas+0, 1
;LCD-Relogio-Digital.c,67 :: 		if(horas >= 24) horas = 0;
	MOVLW      24
	SUBWF      _horas+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main15
	CLRF       _horas+0
L_main15:
;LCD-Relogio-Digital.c,68 :: 		}
L_main14:
;LCD-Relogio-Digital.c,70 :: 		}
	GOTO       L_main0
;LCD-Relogio-Digital.c,71 :: 		}
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

;LCD-Relogio-Digital.c,73 :: 		void interrupt(){
;LCD-Relogio-Digital.c,75 :: 		TMR0 = 6; // inicia TMR0 em 6 (contagem a partir de 6 até 255... 250 ciclos de máquina, 1ms)
	MOVLW      6
	MOVWF      TMR0+0
;LCD-Relogio-Digital.c,76 :: 		cont++;
	INCF       _cont+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cont+1, 1
;LCD-Relogio-Digital.c,77 :: 		INTCON.TMR0IF = 0; // reinicializa o flag de estouro do TMR0
	BCF        INTCON+0, 2
;LCD-Relogio-Digital.c,79 :: 		if(cont == 1000){ // se 1000 estouros (1s)
	MOVF       _cont+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt24
	MOVLW      232
	XORWF      _cont+0, 0
L__interrupt24:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt16
;LCD-Relogio-Digital.c,80 :: 		cont = 0;
	CLRF       _cont+0
	CLRF       _cont+1
;LCD-Relogio-Digital.c,81 :: 		segundos++;
	INCF       _segundos+0, 1
;LCD-Relogio-Digital.c,82 :: 		PORTD.RD0 = ~PORTD.RD0; // inverte LED, pisca a cada 1s
	MOVLW      1
	XORWF      PORTD+0, 1
;LCD-Relogio-Digital.c,83 :: 		if(segundos == 60){
	MOVF       _segundos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt17
;LCD-Relogio-Digital.c,84 :: 		segundos = 0;
	CLRF       _segundos+0
;LCD-Relogio-Digital.c,85 :: 		minutos++;
	INCF       _minutos+0, 1
;LCD-Relogio-Digital.c,86 :: 		if(minutos == 60){
	MOVF       _minutos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt18
;LCD-Relogio-Digital.c,87 :: 		segundos = 0;
	CLRF       _segundos+0
;LCD-Relogio-Digital.c,88 :: 		minutos = 0;
	CLRF       _minutos+0
;LCD-Relogio-Digital.c,89 :: 		horas++;
	INCF       _horas+0, 1
;LCD-Relogio-Digital.c,90 :: 		if(horas == 24){
	MOVF       _horas+0, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt19
;LCD-Relogio-Digital.c,91 :: 		segundos = 0;
	CLRF       _segundos+0
;LCD-Relogio-Digital.c,92 :: 		minutos = 0;
	CLRF       _minutos+0
;LCD-Relogio-Digital.c,93 :: 		horas = 0;
	CLRF       _horas+0
;LCD-Relogio-Digital.c,94 :: 		}
L_interrupt19:
;LCD-Relogio-Digital.c,95 :: 		}
L_interrupt18:
;LCD-Relogio-Digital.c,96 :: 		}
L_interrupt17:
;LCD-Relogio-Digital.c,97 :: 		}
L_interrupt16:
;LCD-Relogio-Digital.c,99 :: 		}
L__interrupt23:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_setupMCU:

;LCD-Relogio-Digital.c,101 :: 		void setupMCU(){
;LCD-Relogio-Digital.c,103 :: 		TRISB = 255;    // PORT B como entrada
	MOVLW      255
	MOVWF      TRISB+0
;LCD-Relogio-Digital.c,104 :: 		PORTB = 255;    // PORT B  inicialmente em nível alto HIGH
	MOVLW      255
	MOVWF      PORTB+0
;LCD-Relogio-Digital.c,105 :: 		TRISD = 0;      // PORT D como saída
	CLRF       TRISD+0
;LCD-Relogio-Digital.c,106 :: 		PORTD = 0;      // PORT D inicialmente em nível baixo LOW
	CLRF       PORTD+0
;LCD-Relogio-Digital.c,108 :: 		INTCON.GIE = 1;           // liga chave geral de interrupções (não necessário para TMR0
	BSF        INTCON+0, 7
;LCD-Relogio-Digital.c,109 :: 		INTCON.PEIE = 0;          // interrupção por periféricos desabilitada
	BCF        INTCON+0, 6
;LCD-Relogio-Digital.c,110 :: 		INTCON.TMR0IE = 1;        // interrupção por TMR0 habilitada
	BSF        INTCON+0, 5
;LCD-Relogio-Digital.c,111 :: 		OPTION_REG = 0b10000001;  // modo TIMER, prescaler 1:8
	MOVLW      129
	MOVWF      OPTION_REG+0
;LCD-Relogio-Digital.c,112 :: 		TMR0 = 6;                 // TMR0 inicia me 6 para obter TE = 1ms
	MOVLW      6
	MOVWF      TMR0+0
;LCD-Relogio-Digital.c,114 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD-Relogio-Digital.c,115 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Relogio-Digital.c,116 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Relogio-Digital.c,117 :: 		Lcd_Out(1, 1, "  Basic  Clock");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD_45Relogio_45Digital+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Relogio-Digital.c,119 :: 		}
	RETURN
; end of _setupMCU
