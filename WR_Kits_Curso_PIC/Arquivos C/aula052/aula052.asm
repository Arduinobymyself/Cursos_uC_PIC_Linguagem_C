
_main:

;aula052.c,98 :: 		void main() {
;aula052.c,100 :: 		CMCON = 0X07;                // desabilita compardores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula052.c,101 :: 		T1CON = 0X31;                // habilita contagem do Timer 1, com prescaler 1:8
	MOVLW      49
	MOVWF      T1CON+0
;aula052.c,102 :: 		OPTION_REG = 0x81;            // Pull-ups desabilitados, Prescaler 1:4 associado ao TIMER 0
	MOVLW      129
	MOVWF      OPTION_REG+0
;aula052.c,103 :: 		GIE_bit = 0x01;              // habilita interrupção global
	BSF        GIE_bit+0, 7
;aula052.c,104 :: 		PEIE_bit = 0x01;             // habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;aula052.c,105 :: 		T0IE_bit = 0x01;             // habilita interrupção por TIMER 0
	BSF        T0IE_bit+0, 5
;aula052.c,106 :: 		TMR1IE_bit = 0x01;           // habilita interrupção por TIMER 1, registrador PIE1 e PIR1 (TMRIF_bit)
	BSF        TMR1IE_bit+0, 0
;aula052.c,108 :: 		TMR0 = 0X06;                 // inicializa TMR0
	MOVLW      6
	MOVWF      TMR0+0
;aula052.c,109 :: 		TMR1L = 255;                 // inicializa TMR1L
	MOVLW      255
	MOVWF      TMR1L+0
;aula052.c,110 :: 		TMR1H = 206;                 // inicializa TMR1H
	MOVLW      206
	MOVWF      TMR1H+0
;aula052.c,112 :: 		TRISA = 0XFF;                // configura o PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula052.c,113 :: 		TRISB = 0X00;                // configura RB2 e RB3 como entrada 0b00001100
	CLRF       TRISB+0
;aula052.c,114 :: 		PORTA = 0XFF;                // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula052.c,115 :: 		PORTB = 0X00;                // inicializa o PORT B
	CLRF       PORTB+0
;aula052.c,117 :: 		change = 0x00;
	BCF        _change+0, BitPos(_change+0)
;aula052.c,119 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula052.c,120 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula052.c,121 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula052.c,122 :: 		Lcd_Out(1, 1, text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula052.c,123 :: 		Lcd_Out(2, 14, text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula052.c,124 :: 		delay_ms(100);
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
;aula052.c,126 :: 		while(1)
L_main1:
;aula052.c,128 :: 		if(!change) Lcd_Out(1, 1, text1);
	BTFSC      _change+0, BitPos(_change+0)
	GOTO       L_main3
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main4
L_main3:
;aula052.c,129 :: 		else Lcd_Out(1, 1, text2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main4:
;aula052.c,130 :: 		}
	GOTO       L_main1
;aula052.c,132 :: 		}
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

;aula052.c,135 :: 		void interrupt(){
;aula052.c,137 :: 		if(T0IF_bit){ // houve estouro do TMR0?
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt5
;aula052.c,139 :: 		T0IF_bit = 0x00;                    // limpa a flag
	BCF        T0IF_bit+0, 2
;aula052.c,140 :: 		TMR0 = 0x06;                        // reincia TMR0
	MOVLW      6
	MOVWF      TMR0+0
;aula052.c,141 :: 		counter0++;                         // incrementa counter 0
	INCF       _counter0+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter0+1, 1
;aula052.c,142 :: 		if(counter0 == 500){                // counter igual a 500? 500*1ms = 500ms
	MOVF       _counter0+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt10
	MOVLW      244
	XORWF      _counter0+0, 0
L__interrupt10:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt6
;aula052.c,144 :: 		counter0 = 0x00;                  // reincia counter 0
	CLRF       _counter0+0
	CLRF       _counter0+1
;aula052.c,145 :: 		backlight = ~backlight;           // inverte estado do backlight
	MOVLW      4
	XORWF      RB2_bit+0, 1
;aula052.c,146 :: 		}
L_interrupt6:
;aula052.c,147 :: 		}
L_interrupt5:
;aula052.c,149 :: 		if(TMR1IF_bit){ // houve estouro do TMR1?
	BTFSS      TMR1IF_bit+0, 0
	GOTO       L_interrupt7
;aula052.c,151 :: 		TMR1IF_bit = 0x00;                  // limpa a flag
	BCF        TMR1IF_bit+0, 0
;aula052.c,152 :: 		TMR1L = 255;                        // reincia TMR1
	MOVLW      255
	MOVWF      TMR1L+0
;aula052.c,153 :: 		TMR1H = 206;
	MOVLW      206
	MOVWF      TMR1H+0
;aula052.c,154 :: 		counter1++;                         // incrementa counter 1
	INCF       _counter1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter1+1, 1
;aula052.c,155 :: 		if(counter1 == 10){                 // counter igual a 10? 10*100ms = 1s
	MOVLW      0
	XORWF      _counter1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt11
	MOVLW      10
	XORWF      _counter1+0, 0
L__interrupt11:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt8
;aula052.c,157 :: 		counter1 = 0x00;                  // reincia counter 1
	CLRF       _counter1+0
	CLRF       _counter1+1
;aula052.c,158 :: 		change = ~change;                 // inverte variável de controle de mensagens
	MOVLW
	XORWF      _change+0, 1
;aula052.c,159 :: 		RB3_bit = ~RB3_bit;               // inverte estado do pino RB3
	MOVLW      8
	XORWF      RB3_bit+0, 1
;aula052.c,160 :: 		}
L_interrupt8:
;aula052.c,161 :: 		}
L_interrupt7:
;aula052.c,163 :: 		}
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
