
_main:

;VSaula062_EEPROM.c,64 :: 		void main() {
;VSaula062_EEPROM.c,66 :: 		char flagBtn = 0;
	CLRF       main_flagBtn_L0+0
;VSaula062_EEPROM.c,71 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;VSaula062_EEPROM.c,72 :: 		TRISB = 0b11111111;
	MOVLW      255
	MOVWF      TRISB+0
;VSaula062_EEPROM.c,73 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;VSaula062_EEPROM.c,76 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;VSaula062_EEPROM.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula062_EEPROM.c,78 :: 		Lcd_Out(1, 1, texto1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula062_EEPROM.c,79 :: 		senha = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _senha+0
;VSaula062_EEPROM.c,80 :: 		Lcd_Chr(1, 8, (senha+48));
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula062_EEPROM.c,81 :: 		Lcd_Chr(2, 8, (cont+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _cont+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula062_EEPROM.c,83 :: 		LED = 1;
	BSF        RD1_bit+0, 1
;VSaula062_EEPROM.c,84 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;VSaula062_EEPROM.c,85 :: 		LED = 0;
	BCF        RD1_bit+0, 1
;VSaula062_EEPROM.c,86 :: 		LED = 1;
	BSF        RD1_bit+0, 1
;VSaula062_EEPROM.c,87 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
;VSaula062_EEPROM.c,88 :: 		LED = 0;
	BCF        RD1_bit+0, 1
;VSaula062_EEPROM.c,89 :: 		LED = 1;
	BSF        RD1_bit+0, 1
;VSaula062_EEPROM.c,90 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;VSaula062_EEPROM.c,91 :: 		LED = 0;
	BCF        RD1_bit+0, 1
;VSaula062_EEPROM.c,92 :: 		LED = 1;
	BSF        RD1_bit+0, 1
;VSaula062_EEPROM.c,93 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;VSaula062_EEPROM.c,94 :: 		LED = 0;
	BCF        RD1_bit+0, 1
;VSaula062_EEPROM.c,97 :: 		do {
L_main4:
;VSaula062_EEPROM.c,99 :: 		if(B1 && !flagBtn.b1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	BTFSC      main_flagBtn_L0+0, 1
	GOTO       L_main9
L__main46:
;VSaula062_EEPROM.c,100 :: 		flagBtn.b1 = 1;
	BSF        main_flagBtn_L0+0, 1
;VSaula062_EEPROM.c,101 :: 		cont++;
	INCF       _cont+0, 1
;VSaula062_EEPROM.c,102 :: 		if(cont>9) cont = 0;
	MOVF       _cont+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main10
	CLRF       _cont+0
L_main10:
;VSaula062_EEPROM.c,103 :: 		Lcd_Chr(2, 8, (cont+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _cont+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula062_EEPROM.c,104 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;VSaula062_EEPROM.c,105 :: 		}
L_main9:
;VSaula062_EEPROM.c,106 :: 		if(!B1 && flagBtn.b1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	BTFSS      main_flagBtn_L0+0, 1
	GOTO       L_main14
L__main45:
;VSaula062_EEPROM.c,107 :: 		flagBtn.b1 = 0;
	BCF        main_flagBtn_L0+0, 1
;VSaula062_EEPROM.c,108 :: 		}
L_main14:
;VSaula062_EEPROM.c,110 :: 		if(B2 && !flagBtn.b2){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	BTFSC      main_flagBtn_L0+0, 2
	GOTO       L_main17
L__main44:
;VSaula062_EEPROM.c,111 :: 		flagBtn.b2 = 1;
	BSF        main_flagBtn_L0+0, 2
;VSaula062_EEPROM.c,112 :: 		senha++;
	INCF       _senha+0, 1
;VSaula062_EEPROM.c,113 :: 		if(senha>9) senha = 0;
	MOVF       _senha+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main18
	CLRF       _senha+0
L_main18:
;VSaula062_EEPROM.c,114 :: 		Lcd_Chr(1, 8, (senha+48));
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _senha+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula062_EEPROM.c,115 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;VSaula062_EEPROM.c,116 :: 		}
L_main17:
;VSaula062_EEPROM.c,117 :: 		if(!B2 && flagBtn.b2){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main22
	BTFSS      main_flagBtn_L0+0, 2
	GOTO       L_main22
L__main43:
;VSaula062_EEPROM.c,118 :: 		flagBtn.b2 = 0;
	BCF        main_flagBtn_L0+0, 2
;VSaula062_EEPROM.c,119 :: 		}
L_main22:
;VSaula062_EEPROM.c,121 :: 		if(B3 && !flagBtn.b3){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	BTFSC      main_flagBtn_L0+0, 3
	GOTO       L_main25
L__main42:
;VSaula062_EEPROM.c,122 :: 		flagBtn.b3 = 1;
	BSF        main_flagBtn_L0+0, 3
;VSaula062_EEPROM.c,123 :: 		EEPROM_Write(0x00, senha);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _senha+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;VSaula062_EEPROM.c,124 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
;VSaula062_EEPROM.c,125 :: 		}
L_main25:
;VSaula062_EEPROM.c,126 :: 		if(!B3 && flagBtn.b3){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	BTFSS      main_flagBtn_L0+0, 3
	GOTO       L_main29
L__main41:
;VSaula062_EEPROM.c,127 :: 		flagBtn.b3 = 0;
	BCF        main_flagBtn_L0+0, 3
;VSaula062_EEPROM.c,128 :: 		}
L_main29:
;VSaula062_EEPROM.c,130 :: 		if(B4 && !flagBtn.b4){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	BTFSC      main_flagBtn_L0+0, 4
	GOTO       L_main32
L__main40:
;VSaula062_EEPROM.c,131 :: 		flagBtn.b4 = 1;
	BSF        main_flagBtn_L0+0, 4
;VSaula062_EEPROM.c,132 :: 		teste = EEPROM_read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _teste+0
;VSaula062_EEPROM.c,133 :: 		if(teste == cont){
	MOVF       R0+0, 0
	XORWF      _cont+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;VSaula062_EEPROM.c,134 :: 		Lcd_Out(1, 12, texto2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula062_EEPROM.c,135 :: 		LED = 1;
	BSF        RD1_bit+0, 1
;VSaula062_EEPROM.c,136 :: 		teste = 0;
	CLRF       _teste+0
;VSaula062_EEPROM.c,137 :: 		} else {
	GOTO       L_main34
L_main33:
;VSaula062_EEPROM.c,138 :: 		Lcd_Out(1, 12, texto3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula062_EEPROM.c,139 :: 		LED = 0;
	BCF        RD1_bit+0, 1
;VSaula062_EEPROM.c,140 :: 		}
L_main34:
;VSaula062_EEPROM.c,141 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;VSaula062_EEPROM.c,142 :: 		}
L_main32:
;VSaula062_EEPROM.c,143 :: 		if(!B4 && flagBtn.b4){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main38
	BTFSS      main_flagBtn_L0+0, 4
	GOTO       L_main38
L__main39:
;VSaula062_EEPROM.c,144 :: 		flagBtn.b4 = 0;
	BCF        main_flagBtn_L0+0, 4
;VSaula062_EEPROM.c,145 :: 		}
L_main38:
;VSaula062_EEPROM.c,147 :: 		} while (1); //Final do Loop
	GOTO       L_main4
;VSaula062_EEPROM.c,149 :: 		}//Final da main()
	GOTO       $+0
; end of _main
