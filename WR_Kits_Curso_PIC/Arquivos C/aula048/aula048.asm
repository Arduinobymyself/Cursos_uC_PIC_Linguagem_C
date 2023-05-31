
_main:

;aula048.c,50 :: 		void main() {
;aula048.c,51 :: 		CMCON = 0X07; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula048.c,53 :: 		T1CON = 0x01; // habilita contagem do Timer1, com prescaler 1:1 (incrementa a cada 1us)
	MOVLW      1
	MOVWF      T1CON+0
;aula048.c,54 :: 		CCP1CON = 0x05; // modo de captura a cada borda de subida
	MOVLW      5
	MOVWF      CCP1CON+0
;aula048.c,56 :: 		CCP1IE_bit = 1; // habilita interrupção por módulo CCP
	BSF        CCP1IE_bit+0, 2
;aula048.c,57 :: 		GIE_bit = 1; // habilita interrupção global
	BSF        GIE_bit+0, 7
;aula048.c,58 :: 		PEIE_bit = 1; // habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;aula048.c,61 :: 		TRISA = 0XFF; // PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula048.c,62 :: 		PORTA = 0XFF; // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula048.c,63 :: 		TRISB = 0x09; // RB0 e RB3(CCP1) como entrada digital (0b00001001)
	MOVLW      9
	MOVWF      TRISB+0
;aula048.c,64 :: 		PORTB = 0x09; // inicializa o PORT B
	MOVLW      9
	MOVWF      PORTB+0
;aula048.c,66 :: 		LCD_Init(); // inicializa o LCD
	CALL       _Lcd_Init+0
;aula048.c,67 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula048.c,68 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula048.c,69 :: 		LCD_Out(1,1, text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula048.c,74 :: 		while(1)
L_main0:
;aula048.c,76 :: 		time2 = time2 - time1; // calcula a largura do pulso
	MOVF       _time1+0, 0
	SUBWF      _time2+0, 0
	MOVWF      R0+0
	MOVF       _time1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _time2+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _time2+0
	MOVF       R0+1, 0
	MOVWF      _time2+1
;aula048.c,77 :: 		IntToStr(time2, txt); // converte inteiro para string
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;aula048.c,78 :: 		LCD_Out(2,1, txt);    // mostra no LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula048.c,79 :: 		flag0.B1 = 0; // valida lfag para nova captura
	BCF        _flag0+0, 1
;aula048.c,81 :: 		}
	GOTO       L_main0
;aula048.c,83 :: 		}
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

;aula048.c,87 :: 		void interrupt(){
;aula048.c,88 :: 		if(CCP1IF_bit){ // houve interrupção via CCP1
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_interrupt2
;aula048.c,89 :: 		if(!flag0.B0){ //
	BTFSC      _flag0+0, 0
	GOTO       L_interrupt3
;aula048.c,90 :: 		time1 = (CCPR1H << 8) + CCPR1L; // captura o tempo inicial
	MOVF       CCPR1H+0, 0
	MOVWF      _time1+1
	CLRF       _time1+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time1+1, 1
;aula048.c,93 :: 		flag0.B0 = 1; // invalida essa condição
	BSF        _flag0+0, 0
;aula048.c,94 :: 		} else {
	GOTO       L_interrupt4
L_interrupt3:
;aula048.c,95 :: 		time2 =  (CCPR1H << 8) + CCPR1L; // captura o tempo posterior enquanto esteve em high
	MOVF       CCPR1H+0, 0
	MOVWF      _time2+1
	CLRF       _time2+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time2+1, 1
;aula048.c,96 :: 		flag0.B0 = 0;  // revalida a condição
	BCF        _flag0+0, 0
;aula048.c,97 :: 		flag0.B1 = 1;  // usado no loop infinito
	BSF        _flag0+0, 1
;aula048.c,98 :: 		}
L_interrupt4:
;aula048.c,99 :: 		CCP1IE_bit = 0; // desliga interrupção por CCP
	BCF        CCP1IE_bit+0, 2
;aula048.c,100 :: 		CCP1CON.B0 = ~CCP1CON.B0; // troca entre borda de subida e descida
	MOVLW      1
	XORWF      CCP1CON+0, 1
;aula048.c,101 :: 		CCP1IE_bit = 1; // religa interrupção por CCP
	BSF        CCP1IE_bit+0, 2
;aula048.c,103 :: 		CCP1IF_bit = 0;  // limpa flag para nova captura
	BCF        CCP1IF_bit+0, 2
;aula048.c,104 :: 		}
L_interrupt2:
;aula048.c,105 :: 		}
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
