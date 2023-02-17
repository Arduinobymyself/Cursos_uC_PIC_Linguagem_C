
_main:

;aula016.c,34 :: 		void main() {
;aula016.c,35 :: 		CMCON = 0X07; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula016.c,36 :: 		TRISA = 0X03; // RA2 e RA3 configurados como entrada digital
	MOVLW      3
	MOVWF      TRISA+0
;aula016.c,37 :: 		TRISB = 0X00; // PORTB configurado como saída digital
	CLRF       TRISB+0
;aula016.c,39 :: 		DIGIT1 = 0;   // desabilita digito 1
	BCF        PORTB+0, 7
;aula016.c,40 :: 		DIGIT2 = 0;   // desabilita digito 2
	BCF        PORTA+0, 2
;aula016.c,41 :: 		DIGIT3 = 0;   // desabilita digito 3
	BCF        PORTA+0, 3
;aula016.c,43 :: 		while(1)
L_main0:
;aula016.c,45 :: 		changeCount();
	CALL       _changeCount+0
;aula016.c,47 :: 		Cen = (Cnt/100)-((Cnt%100)/100); // digito das centenas
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Cnt+0, 0
	MOVWF      R0+0
	MOVF       _Cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Cnt+0, 0
	MOVWF      R0+0
	MOVF       _Cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Cen+0
	MOVF       R0+1, 0
	MOVWF      _Cen+1
;aula016.c,49 :: 		PORTB = display(Cen);            // envia para o PORTB
	MOVF       R0+0, 0
	MOVWF      FARG_display_no+0
	MOVF       R0+1, 0
	MOVWF      FARG_display_no+1
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula016.c,50 :: 		DIGIT1 = 1;                      // habilita digito 1 (centena)
	BSF        PORTB+0, 7
;aula016.c,51 :: 		delay_ms(5);                     // aguarda 5 milisegundos
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
;aula016.c,52 :: 		DIGIT1 = 0;                      // desabilita digito 1 (centena)
	BCF        PORTB+0, 7
;aula016.c,54 :: 		Msd = (Cnt%100);
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Cnt+0, 0
	MOVWF      R0+0
	MOVF       _Cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Msd+0
	MOVF       R0+1, 0
	MOVWF      _Msd+1
;aula016.c,55 :: 		Msd = (Msd/10)-((Msd%10)/10);    // digito mais significativo (dezena)
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Msd+0, 0
	MOVWF      R0+0
	MOVF       _Msd+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Msd+0
	MOVF       R0+1, 0
	MOVWF      _Msd+1
;aula016.c,57 :: 		PORTB = display(Msd);            // envia para o PORTB
	MOVF       R0+0, 0
	MOVWF      FARG_display_no+0
	MOVF       R0+1, 0
	MOVWF      FARG_display_no+1
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula016.c,58 :: 		DIGIT2 = 1;                      // habilita digito 2 (dezena)
	BSF        PORTA+0, 2
;aula016.c,59 :: 		delay_ms(5);                     // aguarda 5 milisegundos
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;aula016.c,60 :: 		DIGIT2 = 0;                      // desabilita digito 2 (dezena)
	BCF        PORTA+0, 2
;aula016.c,62 :: 		Lsd = Cnt%10;                    // digito menos significativo (unidade)
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Cnt+0, 0
	MOVWF      R0+0
	MOVF       _Cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Lsd+0
	MOVF       R0+1, 0
	MOVWF      _Lsd+1
;aula016.c,64 :: 		PORTB = display(Lsd);            // envia para o PORTB
	MOVF       R0+0, 0
	MOVWF      FARG_display_no+0
	MOVF       R0+1, 0
	MOVWF      FARG_display_no+1
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula016.c,65 :: 		DIGIT3 = 1;                      // habilita digito 3 (unidade)
	BSF        PORTA+0, 3
;aula016.c,66 :: 		delay_ms(5);                     // aguarda 5 milisegundos
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;aula016.c,67 :: 		DIGIT3 = 0;                      // desabilita digito 3 (unidade)
	BCF        PORTA+0, 3
;aula016.c,69 :: 		}
	GOTO       L_main0
;aula016.c,71 :: 		}
	GOTO       $+0
; end of _main

_display:

;aula016.c,74 :: 		int display(int no)
;aula016.c,77 :: 		int SEGMENTO[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
	MOVLW      63
	MOVWF      display_SEGMENTO_L0+0
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+1
	MOVLW      6
	MOVWF      display_SEGMENTO_L0+2
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+3
	MOVLW      91
	MOVWF      display_SEGMENTO_L0+4
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+5
	MOVLW      79
	MOVWF      display_SEGMENTO_L0+6
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+7
	MOVLW      102
	MOVWF      display_SEGMENTO_L0+8
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+9
	MOVLW      109
	MOVWF      display_SEGMENTO_L0+10
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+11
	MOVLW      125
	MOVWF      display_SEGMENTO_L0+12
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+13
	MOVLW      7
	MOVWF      display_SEGMENTO_L0+14
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+15
	MOVLW      127
	MOVWF      display_SEGMENTO_L0+16
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+17
	MOVLW      111
	MOVWF      display_SEGMENTO_L0+18
	MOVLW      0
	MOVWF      display_SEGMENTO_L0+19
;aula016.c,78 :: 		Pattern = SEGMENTO[no];
	MOVF       FARG_display_no+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_no+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      display_SEGMENTO_L0+0
	MOVWF      FSR
;aula016.c,79 :: 		return Pattern;
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
;aula016.c,80 :: 		}
	RETURN
; end of _display

_changeCount:

;aula016.c,82 :: 		void changeCount()
;aula016.c,84 :: 		while(MAIS == 1)            // botão MAIS pressionado
L_changeCount5:
	BTFSS      PORTA+0, 1
	GOTO       L_changeCount6
;aula016.c,86 :: 		Cnt += 10;                // incremento em 10 unidades
	MOVLW      10
	ADDWF      _Cnt+0, 1
	BTFSC      STATUS+0, 0
	INCF       _Cnt+1, 1
;aula016.c,87 :: 		delay_ms(300);            // debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_changeCount7:
	DECFSZ     R13+0, 1
	GOTO       L_changeCount7
	DECFSZ     R12+0, 1
	GOTO       L_changeCount7
	DECFSZ     R11+0, 1
	GOTO       L_changeCount7
;aula016.c,88 :: 		if(Cnt > 300) Cnt = 300;  // chegou em 300 não incrementa mais
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeCount13
	MOVF       _Cnt+0, 0
	SUBLW      44
L__changeCount13:
	BTFSC      STATUS+0, 0
	GOTO       L_changeCount8
	MOVLW      44
	MOVWF      _Cnt+0
	MOVLW      1
	MOVWF      _Cnt+1
L_changeCount8:
;aula016.c,89 :: 		}
	GOTO       L_changeCount5
L_changeCount6:
;aula016.c,91 :: 		while(MENOS == 1)           // botão MENOS pressionado
L_changeCount9:
	BTFSS      PORTA+0, 0
	GOTO       L_changeCount10
;aula016.c,93 :: 		Cnt -= 10;                // decremento em 10 unidades
	MOVLW      10
	SUBWF      _Cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Cnt+1, 1
;aula016.c,94 :: 		delay_ms(300);            // debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_changeCount11:
	DECFSZ     R13+0, 1
	GOTO       L_changeCount11
	DECFSZ     R12+0, 1
	GOTO       L_changeCount11
	DECFSZ     R11+0, 1
	GOTO       L_changeCount11
;aula016.c,95 :: 		if(Cnt < 1) Cnt = 0;      // chegou em 1 não decrementa mais
	MOVLW      128
	XORWF      _Cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeCount14
	MOVLW      1
	SUBWF      _Cnt+0, 0
L__changeCount14:
	BTFSC      STATUS+0, 0
	GOTO       L_changeCount12
	CLRF       _Cnt+0
	CLRF       _Cnt+1
L_changeCount12:
;aula016.c,96 :: 		}
	GOTO       L_changeCount9
L_changeCount10:
;aula016.c,97 :: 		}
	RETURN
; end of _changeCount
