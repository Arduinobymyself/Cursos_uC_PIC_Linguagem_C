
_main:

;aula049.c,50 :: 		void main() {
;aula049.c,51 :: 		CMCON = 0X07; // desabilita compardores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula049.c,52 :: 		TRISA = 0XFF; // configura o PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula049.c,53 :: 		TRISB = 0X08; // configura RB0 e RB3 como entrada
	MOVLW      8
	MOVWF      TRISB+0
;aula049.c,54 :: 		PORTA = 0XFF; // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula049.c,55 :: 		PORTB = 0X00; // inicializa o PORT B
	CLRF       PORTB+0
;aula049.c,56 :: 		INTCON = 0XC0; // habilita interrupção global e por periféricos
	MOVLW      192
	MOVWF      INTCON+0
;aula049.c,57 :: 		TMR1IE_bit = 0X00; // desabilita interrupçãoes por TMR1
	BCF        TMR1IE_bit+0, 0
;aula049.c,58 :: 		CCP1IE_bit = 0X01; // habilita interrupções no módulo CCP
	BSF        CCP1IE_bit+0, 2
;aula049.c,59 :: 		CCP1CON = 0X05; // configura captura por borda de subida
	MOVLW      5
	MOVWF      CCP1CON+0
;aula049.c,61 :: 		T1CKPS1_bit = 0X00; // prescaler TMR1 1:1
	BCF        T1CKPS1_bit+0, 5
;aula049.c,62 :: 		T1CKPS0_bit = 0X00; //
	BCF        T1CKPS0_bit+0, 4
;aula049.c,63 :: 		TMR1CS_bit = 0X00; // clock: Fosc/4
	BCF        TMR1CS_bit+0, 1
;aula049.c,64 :: 		TMR1ON_bit = 0X00; // para contagem do TIMER 1
	BCF        TMR1ON_bit+0, 0
;aula049.c,66 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula049.c,67 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula049.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula049.c,69 :: 		Lcd_Out(1, 1, "Medida de Pulso");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_aula049+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula049.c,70 :: 		Lcd_Out(2, 14, "us");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_aula049+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula049.c,71 :: 		delay_ms(100);
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
;aula049.c,73 :: 		while(1)
L_main1:
;aula049.c,75 :: 		delay_ms(100);
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
;aula049.c,76 :: 		Periodo = (Tempo_H << 8) + Tempo_L;
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
;aula049.c,77 :: 		IntToStr(Periodo, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;aula049.c,78 :: 		Lcd_Out(2, 8, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula049.c,79 :: 		}
	GOTO       L_main1
;aula049.c,81 :: 		}
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

;aula049.c,84 :: 		void interrupt(){
;aula049.c,85 :: 		if(CCP1IF_bit && CCP1CON.B0){
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_interrupt6
	BTFSS      CCP1CON+0, 0
	GOTO       L_interrupt6
L__interrupt9:
;aula049.c,86 :: 		CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
	BCF        CCP1IF_bit+0, 2
;aula049.c,87 :: 		CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
	BCF        CCP1IE_bit+0, 2
;aula049.c,88 :: 		CCP1CON = 0x04;                     // configura captura por borda de descida
	MOVLW      4
	MOVWF      CCP1CON+0
;aula049.c,89 :: 		TMR1H = 0x00;                       // zera registrador TMR1
	CLRF       TMR1H+0
;aula049.c,90 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;aula049.c,91 :: 		TMR1ON_bit = 0x01;                  // habilita contagem de tempo
	BSF        TMR1ON_bit+0, 0
;aula049.c,92 :: 		} else if(CCP1IF_bit){
	GOTO       L_interrupt7
L_interrupt6:
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_interrupt8
;aula049.c,93 :: 		CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
	BCF        CCP1IF_bit+0, 2
;aula049.c,94 :: 		TMR1ON_bit = 0x01;                  // habilita contagem de tempo
	BSF        TMR1ON_bit+0, 0
;aula049.c,95 :: 		CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
	BCF        CCP1IE_bit+0, 2
;aula049.c,96 :: 		CCP1CON = 0x05;                     // configura captura por borda de subida
	MOVLW      5
	MOVWF      CCP1CON+0
;aula049.c,97 :: 		TMR1H = CCPR1H;                     // valor do tempo em us é armazenado
	MOVF       CCPR1H+0, 0
	MOVWF      TMR1H+0
;aula049.c,98 :: 		TMR1L = CCPR1L;
	MOVF       CCPR1L+0, 0
	MOVWF      TMR1L+0
;aula049.c,100 :: 		}
L_interrupt8:
L_interrupt7:
;aula049.c,101 :: 		}
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
