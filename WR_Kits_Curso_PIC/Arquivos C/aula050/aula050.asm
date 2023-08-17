
_main:

;aula050.c,64 :: 		void main() {
;aula050.c,65 :: 		CMCON = 0X07;                // desabilita compardores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula050.c,66 :: 		TRISA = 0XFF;                // configura o PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula050.c,67 :: 		TRISB = 0X08;                // configura RB3 como entrada 0b00001000
	MOVLW      8
	MOVWF      TRISB+0
;aula050.c,68 :: 		PORTA = 0XFF;                // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula050.c,69 :: 		PORTB = 0X00;                // inicializa o PORT B
	CLRF       PORTB+0
;aula050.c,70 :: 		INTCON = 0XC0;               // habilita interrupção global e por periféricos
	MOVLW      192
	MOVWF      INTCON+0
;aula050.c,71 :: 		TMR1IE_bit = 0X00;           // desabilita interrupçãoes por TMR1
	BCF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;aula050.c,72 :: 		CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula050.c,73 :: 		CCP1CON = 0X05;              // configura captura por borda de subida
	MOVLW      5
	MOVWF      CCP1CON+0
;aula050.c,75 :: 		T1CKPS1_bit = 0X00;          // prescaler TMR1 1:1
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;aula050.c,76 :: 		T1CKPS0_bit = 0X00;          //
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;aula050.c,77 :: 		TMR1CS_bit = 0X00;           // clock: Fosc/4
	BCF        TMR1CS_bit+0, BitPos(TMR1CS_bit+0)
;aula050.c,78 :: 		TMR1ON_bit = 0X00;           // para contagem do TIMER 1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;aula050.c,80 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula050.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula050.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula050.c,83 :: 		Lcd_Out(1, 1, "Distancia:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_aula050+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula050.c,84 :: 		Lcd_Out(2, 14, "cm");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_aula050+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula050.c,85 :: 		delay_ms(100);
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
;aula050.c,87 :: 		while(1)
L_main1:
;aula050.c,89 :: 		trigger();
	CALL       _trigger+0
;aula050.c,90 :: 		delay_ms(100);                             // taxa de atualização
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
;aula050.c,91 :: 		Periodo = (Tempo_H << 8) + Tempo_L;        // calcula período em us
	MOVF       _Tempo_H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       _Tempo_L+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _Periodo+0
	MOVF       R0+1, 0
	MOVWF      _Periodo+1
;aula050.c,92 :: 		Distancia = Periodo / 58;                  // converte o período para cm
	MOVLW      58
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _Distancia+0
	MOVF       R0+1, 0
	MOVWF      _Distancia+1
;aula050.c,93 :: 		IntToStr(Distancia, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;aula050.c,94 :: 		Lcd_Out(2, 8, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula050.c,95 :: 		}
	GOTO       L_main1
;aula050.c,97 :: 		}
L_end_main:
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

;aula050.c,100 :: 		void interrupt(){
;aula050.c,101 :: 		if(CCP1IF_bit && CCP1CON.B0){
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_interrupt6
	BTFSS      CCP1CON+0, 0
	GOTO       L_interrupt6
L__interrupt10:
;aula050.c,102 :: 		CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;aula050.c,103 :: 		CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
	BCF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula050.c,104 :: 		CCP1CON = 0x04;                     // configura captura por borda de descida
	MOVLW      4
	MOVWF      CCP1CON+0
;aula050.c,105 :: 		CCP1IE_bit = 0x01;                  // abilita interrupção do periférioco CCP
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula050.c,106 :: 		TMR1H = 0x00;                       // zera registrador TMR1
	CLRF       TMR1H+0
;aula050.c,107 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;aula050.c,108 :: 		TMR1ON_bit = 0x01;                  // habilita contagem de tempo
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;aula050.c,109 :: 		} else if(CCP1IF_bit){
	GOTO       L_interrupt7
L_interrupt6:
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_interrupt8
;aula050.c,110 :: 		CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;aula050.c,111 :: 		TMR1ON_bit = 0x00;                  // habilita contagem de tempo
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;aula050.c,112 :: 		CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
	BCF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula050.c,113 :: 		CCP1CON = 0x05;                     // configura captura por borda de subida
	MOVLW      5
	MOVWF      CCP1CON+0
;aula050.c,114 :: 		CCP1IE_bit = 0x01;                  // habilita interrupção por periférico CCP
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula050.c,115 :: 		Tempo_H = CCPR1H;                     // valor do tempo em us é armazenado
	MOVF       CCPR1H+0, 0
	MOVWF      _Tempo_H+0
;aula050.c,116 :: 		Tempo_L = CCPR1L;
	MOVF       CCPR1L+0, 0
	MOVWF      _Tempo_L+0
;aula050.c,118 :: 		}
L_interrupt8:
L_interrupt7:
;aula050.c,119 :: 		}
L_end_interrupt:
L__interrupt13:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_trigger:

;aula050.c,121 :: 		void trigger(){
;aula050.c,122 :: 		Trig = 0x01;                          // RB2 em nível alto
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;aula050.c,123 :: 		delay_us(10);                         // pulso de 10us
	MOVLW      3
	MOVWF      R13+0
L_trigger9:
	DECFSZ     R13+0, 1
	GOTO       L_trigger9
;aula050.c,124 :: 		Trig = 0x00;                          // RB2 em nível baixo
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;aula050.c,125 :: 		}
L_end_trigger:
	RETURN
; end of _trigger
