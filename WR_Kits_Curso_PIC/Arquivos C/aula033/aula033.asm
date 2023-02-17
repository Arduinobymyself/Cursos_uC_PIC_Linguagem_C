
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula033.c,63 :: 		void interrupt(){
;aula033.c,64 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt0
;aula033.c,65 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, 2
;aula033.c,66 :: 		TMR0 = 0;
	CLRF       TMR0+0
;aula033.c,67 :: 		if(col_1 && control == 0x01){
	BTFSS      RB1_bit+0, 1
	GOTO       L_interrupt3
	MOVF       _control+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
L__interrupt39:
;aula033.c,68 :: 		control = 0x02;
	MOVLW      2
	MOVWF      _control+0
;aula033.c,69 :: 		col_1 = 0x00;
	BCF        RB1_bit+0, 1
;aula033.c,70 :: 		col_2 = 0x01;
	BSF        RB2_bit+0, 2
;aula033.c,71 :: 		col_3 = 0x01;
	BSF        RB3_bit+0, 3
;aula033.c,72 :: 		if(!row_A)      chrWrite(1);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt4
	MOVLW      1
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt5
L_interrupt4:
;aula033.c,73 :: 		else if(!row_B) chrWrite(4);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt6
	MOVLW      4
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt7
L_interrupt6:
;aula033.c,74 :: 		else if(!row_C) chrWrite(7);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt8
	MOVLW      7
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt9
L_interrupt8:
;aula033.c,75 :: 		else if(!row_D) value = 50; // força o duty para 50% tecla (*)
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt10
	MOVLW      50
	MOVWF      _value+0
L_interrupt10:
L_interrupt9:
L_interrupt7:
L_interrupt5:
;aula033.c,76 :: 		}
L_interrupt3:
;aula033.c,77 :: 		if(col_2 && control == 0x02){
	BTFSS      RB2_bit+0, 2
	GOTO       L_interrupt13
	MOVF       _control+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
L__interrupt38:
;aula033.c,78 :: 		control = 0x03;
	MOVLW      3
	MOVWF      _control+0
;aula033.c,79 :: 		col_1 = 0x01;
	BSF        RB1_bit+0, 1
;aula033.c,80 :: 		col_2 = 0x00;
	BCF        RB2_bit+0, 2
;aula033.c,81 :: 		col_3 = 0x01;
	BSF        RB3_bit+0, 3
;aula033.c,82 :: 		if(!row_A)      chrWrite(2);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt14
	MOVLW      2
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt15
L_interrupt14:
;aula033.c,83 :: 		else if(!row_B) chrWrite(5);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt16
	MOVLW      5
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt17
L_interrupt16:
;aula033.c,84 :: 		else if(!row_C) chrWrite(8);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt18
	MOVLW      8
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt19
L_interrupt18:
;aula033.c,85 :: 		else if(!row_D) chrWrite(0);
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt20
	CLRF       FARG_chrWrite_number+0
	CALL       _chrWrite+0
L_interrupt20:
L_interrupt19:
L_interrupt17:
L_interrupt15:
;aula033.c,86 :: 		}
L_interrupt13:
;aula033.c,87 :: 		if(col_3 && control == 0x03){
	BTFSS      RB3_bit+0, 3
	GOTO       L_interrupt23
	MOVF       _control+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt23
L__interrupt37:
;aula033.c,88 :: 		control = 0x01;
	MOVLW      1
	MOVWF      _control+0
;aula033.c,89 :: 		col_1 = 0x01;
	BSF        RB1_bit+0, 1
;aula033.c,90 :: 		col_2 = 0x01;
	BSF        RB2_bit+0, 2
;aula033.c,91 :: 		col_3 = 0x00;
	BCF        RB3_bit+0, 3
;aula033.c,92 :: 		if(!row_A)      chrWrite(3);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt24
	MOVLW      3
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt25
L_interrupt24:
;aula033.c,93 :: 		else if(!row_B) chrWrite(6);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt26
	MOVLW      6
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt27
L_interrupt26:
;aula033.c,94 :: 		else if(!row_C) chrWrite(9);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt28
	MOVLW      9
	MOVWF      FARG_chrWrite_number+0
	CALL       _chrWrite+0
	GOTO       L_interrupt29
L_interrupt28:
;aula033.c,95 :: 		else if(!row_D) aux = 0x00; // atualiza duty tecla (#)
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt30
	CLRF       _aux+0
L_interrupt30:
L_interrupt29:
L_interrupt27:
L_interrupt25:
;aula033.c,96 :: 		}
L_interrupt23:
;aula033.c,97 :: 		}
L_interrupt0:
;aula033.c,98 :: 		}
L__interrupt40:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;aula033.c,103 :: 		void main() {
;aula033.c,104 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;aula033.c,105 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;aula033.c,107 :: 		OPTION_REG = 0b10000111; // Timer 0 com ciclo de instrução, prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;aula033.c,108 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, 7
;aula033.c,109 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, 6
;aula033.c,110 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, 5
;aula033.c,112 :: 		TMR0 = 0;
	CLRF       TMR0+0
;aula033.c,114 :: 		TRISB = 0xF0; // nibble MSB do PORT B como entrada
	MOVLW      240
	MOVWF      TRISB+0
;aula033.c,115 :: 		PORTB = 0xFF; // nibble MSB inicia em nível BAIXO
	MOVLW      255
	MOVWF      PORTB+0
;aula033.c,116 :: 		TRISC = 0b11111011; // Saída RC2 PWM
	MOVLW      251
	MOVWF      TRISC+0
;aula033.c,117 :: 		TRISD = 0b00000011; // Saídas para o LCD
	MOVLW      3
	MOVWF      TRISD+0
;aula033.c,119 :: 		TRISA = 0X03;
	MOVLW      3
	MOVWF      TRISA+0
;aula033.c,120 :: 		PORTA = 0X03;
	MOVLW      3
	MOVWF      PORTA+0
;aula033.c,123 :: 		PWM1_Init(2000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;aula033.c,125 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;aula033.c,126 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula033.c,127 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;aula033.c,128 :: 		Lcd_Out(1, 4, text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;aula033.c,130 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;aula033.c,133 :: 		while(1){
L_main31:
;aula033.c,134 :: 		disp; // chama macro
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_aula033+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      48
	ADDWF      _dezena+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVLW      48
	ADDWF      _unidade+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;aula033.c,135 :: 		if(!aux){
	MOVF       _aux+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;aula033.c,136 :: 		value = StrToValue(dezena, unidade);
	MOVF       _dezena+0, 0
	MOVWF      FARG_StrToValue_dez+0
	MOVF       _unidade+0, 0
	MOVWF      FARG_StrToValue_uni+0
	CALL       _StrToValue+0
	MOVF       R0+0, 0
	MOVWF      _value+0
;aula033.c,137 :: 		aux = 1;
	MOVLW      1
	MOVWF      _aux+0
;aula033.c,138 :: 		store = 0;
	CLRF       _store+0
;aula033.c,139 :: 		}
L_main33:
;aula033.c,140 :: 		PWM1_Set_Duty((value*255)/100);
	MOVF       _value+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;aula033.c,141 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
;aula033.c,142 :: 		}
	GOTO       L_main31
;aula033.c,144 :: 		}
	GOTO       $+0
; end of _main

_chrWrite:

;aula033.c,147 :: 		void chrWrite(char number){// atualiza valores de dezena e unidade
;aula033.c,148 :: 		if(store == 0){
	MOVF       _store+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_chrWrite35
;aula033.c,149 :: 		dezena = number;
	MOVF       FARG_chrWrite_number+0, 0
	MOVWF      _dezena+0
;aula033.c,150 :: 		store = 1;
	MOVLW      1
	MOVWF      _store+0
;aula033.c,151 :: 		} else {
	GOTO       L_chrWrite36
L_chrWrite35:
;aula033.c,152 :: 		unidade = number;
	MOVF       FARG_chrWrite_number+0, 0
	MOVWF      _unidade+0
;aula033.c,153 :: 		}
L_chrWrite36:
;aula033.c,154 :: 		}
	RETURN
; end of _chrWrite

_StrToValue:

;aula033.c,156 :: 		unsigned char StrToValue(char dez, char uni){// converte dezena e unidade em valor unico
;aula033.c,158 :: 		result = (10*dez)+uni; // transforma 2 números individuais em um único número
	MOVF       FARG_StrToValue_dez+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       FARG_StrToValue_uni+0, 0
	ADDWF      R0+0, 1
;aula033.c,159 :: 		return result;
;aula033.c,160 :: 		}
	RETURN
; end of _StrToValue
