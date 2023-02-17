
_main:

;VSaula055_USART_Leitura_Escrita.c,11 :: 		void main() {
;VSaula055_USART_Leitura_Escrita.c,13 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;VSaula055_USART_Leitura_Escrita.c,14 :: 		ADC_Init();
	CALL       _ADC_Init+0
;VSaula055_USART_Leitura_Escrita.c,15 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
;VSaula055_USART_Leitura_Escrita.c,17 :: 		UART1_Write_Text("PIC");
	MOVLW      ?lstr1_VSaula055_USART_Leitura_Escrita+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;VSaula055_USART_Leitura_Escrita.c,18 :: 		while(!UART1_Tx_Idle());
L_main1:
	CALL       _UART1_Tx_Idle+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	GOTO       L_main1
L_main2:
;VSaula055_USART_Leitura_Escrita.c,19 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,20 :: 		while(!UART1_Tx_Idle());
L_main3:
	CALL       _UART1_Tx_Idle+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;VSaula055_USART_Leitura_Escrita.c,23 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, 7
;VSaula055_USART_Leitura_Escrita.c,24 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, 6
;VSaula055_USART_Leitura_Escrita.c,25 :: 		RCIE_bit = 1;
	BSF        RCIE_bit+0, 5
;VSaula055_USART_Leitura_Escrita.c,27 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, 6
;VSaula055_USART_Leitura_Escrita.c,28 :: 		TRISC7_bit = 1;
	BSF        TRISC7_bit+0, 7
;VSaula055_USART_Leitura_Escrita.c,30 :: 		TRISA = 0b00000011; // RA0 e RA1 como entrada
	MOVLW      3
	MOVWF      TRISA+0
;VSaula055_USART_Leitura_Escrita.c,32 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula055_USART_Leitura_Escrita.c,33 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula055_USART_Leitura_Escrita.c,35 :: 		ADCON1.PCFG3 = 0;
	BCF        ADCON1+0, 3
;VSaula055_USART_Leitura_Escrita.c,36 :: 		ADCON1.PCFG2 = 0;
	BCF        ADCON1+0, 2
;VSaula055_USART_Leitura_Escrita.c,37 :: 		ADCON1.PCFG1 = 0;
	BCF        ADCON1+0, 1
;VSaula055_USART_Leitura_Escrita.c,38 :: 		ADCON1.PCFG0 = 0;
	BCF        ADCON1+0, 0
;VSaula055_USART_Leitura_Escrita.c,40 :: 		while(1){
L_main5:
;VSaula055_USART_Leitura_Escrita.c,41 :: 		if(pot0){
	BTFSS      _pot0+0, BitPos(_pot0+0)
	GOTO       L_main7
;VSaula055_USART_Leitura_Escrita.c,42 :: 		valorAD = ADC_Get_Sample(0)*4.8878;
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	CALL       _Word2Double+0
	MOVLW      220
	MOVWF      R4+0
	MOVLW      104
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
;VSaula055_USART_Leitura_Escrita.c,43 :: 		UART1_Write('(');
	MOVLW      40
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,44 :: 		UART1_Write_text("pot0 = ");
	MOVLW      ?lstr2_VSaula055_USART_Leitura_Escrita+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;VSaula055_USART_Leitura_Escrita.c,45 :: 		UART1_write(((valorAD/1000)+48));
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,46 :: 		UART1_Write('.');
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,47 :: 		UART1_write(((valorAD/100)%10+48));
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,48 :: 		UART1_write(((valorAD/10)%10+48));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,49 :: 		UART1_Write('V');
	MOVLW      86
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,50 :: 		UART1_Write(')');
	MOVLW      41
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,51 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,52 :: 		pot0 = 0;
	BCF        _pot0+0, BitPos(_pot0+0)
;VSaula055_USART_Leitura_Escrita.c,53 :: 		}
L_main7:
;VSaula055_USART_Leitura_Escrita.c,54 :: 		if(pot1){
	BTFSS      _pot1+0, BitPos(_pot1+0)
	GOTO       L_main8
;VSaula055_USART_Leitura_Escrita.c,55 :: 		valorAD = ADC_Get_Sample(1)*4.8876; // 1023 -> 5V ; pot0 = xV -> vlor da tensão
	MOVLW      1
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	CALL       _Word2Double+0
	MOVLW      56
	MOVWF      R4+0
	MOVLW      103
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
;VSaula055_USART_Leitura_Escrita.c,57 :: 		UART1_Write('(');
	MOVLW      40
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,58 :: 		UART1_Write_text("pot1 = ");
	MOVLW      ?lstr3_VSaula055_USART_Leitura_Escrita+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;VSaula055_USART_Leitura_Escrita.c,59 :: 		UART1_write(((valorAD/1000)+48));
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,60 :: 		UART1_Write('.');
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,61 :: 		UART1_write(((valorAD/100)%10+48));
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,62 :: 		UART1_write(((valorAD/10)%10+48));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,63 :: 		UART1_Write('V');
	MOVLW      86
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,64 :: 		UART1_Write(')');
	MOVLW      41
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,65 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula055_USART_Leitura_Escrita.c,66 :: 		pot1 = 0;
	BCF        _pot1+0, BitPos(_pot1+0)
;VSaula055_USART_Leitura_Escrita.c,67 :: 		}
L_main8:
;VSaula055_USART_Leitura_Escrita.c,68 :: 		}
	GOTO       L_main5
;VSaula055_USART_Leitura_Escrita.c,71 :: 		}
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

;VSaula055_USART_Leitura_Escrita.c,74 :: 		void interrupt(){
;VSaula055_USART_Leitura_Escrita.c,76 :: 		if(RCIF_bit){
	BTFSS      RCIF_bit+0, 5
	GOTO       L_interrupt9
;VSaula055_USART_Leitura_Escrita.c,78 :: 		texto[c_texto] = UART1_Read();
	MOVF       _c_texto+0, 0
	ADDLW      _texto+0
	MOVWF      FLOC__interrupt+0
	CALL       _UART1_Read+0
	MOVF       FLOC__interrupt+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;VSaula055_USART_Leitura_Escrita.c,80 :: 		if(texto[0] != '!'){
	MOVF       _texto+0, 0
	XORLW      33
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt10
;VSaula055_USART_Leitura_Escrita.c,81 :: 		c_texto = 0;
	CLRF       _c_texto+0
;VSaula055_USART_Leitura_Escrita.c,82 :: 		} else {
	GOTO       L_interrupt11
L_interrupt10:
;VSaula055_USART_Leitura_Escrita.c,83 :: 		if(texto[c_texto] == '#'){
	MOVF       _c_texto+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
;VSaula055_USART_Leitura_Escrita.c,85 :: 		c_texto = 0;
	CLRF       _c_texto+0
;VSaula055_USART_Leitura_Escrita.c,86 :: 		if((texto[0] == '!') && (texto[1] == 'l') && (texto[2] == 'e') && (texto[3] == 'd')){
	MOVF       _texto+0, 0
	XORLW      33
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt15
	MOVF       _texto+1, 0
	XORLW      108
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt15
	MOVF       _texto+2, 0
	XORLW      101
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt15
	MOVF       _texto+3, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt15
L__interrupt38:
;VSaula055_USART_Leitura_Escrita.c,87 :: 		switch(texto[4]){
	GOTO       L_interrupt16
;VSaula055_USART_Leitura_Escrita.c,88 :: 		case '0': LEDs = 0; break; // apaga tudo!
L_interrupt18:
	CLRF       PORTD+0
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,89 :: 		case '1': LEDs.b0 = ~LEDs.b0; break; // acende LED 1 mantendo a condição dos anteriores
L_interrupt19:
	MOVLW      1
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,90 :: 		case '2': LEDs.b1 = ~LEDs.b1; break;
L_interrupt20:
	MOVLW      2
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,91 :: 		case '3': LEDs.b2 = ~LEDs.b2; break;
L_interrupt21:
	MOVLW      4
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,92 :: 		case '4': LEDs.b3 = ~LEDs.b3; break;
L_interrupt22:
	MOVLW      8
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,93 :: 		case '5': LEDs.b4 = ~LEDs.b4; break;
L_interrupt23:
	MOVLW      16
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,94 :: 		case '6': LEDs.b5 = ~LEDs.b5; break;
L_interrupt24:
	MOVLW      32
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,95 :: 		case '7': LEDs.b6 = ~LEDs.b6; break;
L_interrupt25:
	MOVLW      64
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,96 :: 		case '8': LEDs.b7 = ~LEDs.b7; break;
L_interrupt26:
	MOVLW      128
	XORWF      PORTD+0, 1
	GOTO       L_interrupt17
;VSaula055_USART_Leitura_Escrita.c,97 :: 		}
L_interrupt16:
	MOVF       _texto+4, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt18
	MOVF       _texto+4, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt19
	MOVF       _texto+4, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt20
	MOVF       _texto+4, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt21
	MOVF       _texto+4, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt22
	MOVF       _texto+4, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt23
	MOVF       _texto+4, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt24
	MOVF       _texto+4, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt25
	MOVF       _texto+4, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt26
L_interrupt17:
;VSaula055_USART_Leitura_Escrita.c,98 :: 		} else {
	GOTO       L_interrupt27
L_interrupt15:
;VSaula055_USART_Leitura_Escrita.c,99 :: 		if((texto[0] == '!') && (texto[1] == 'p') && (texto[2] == 'o') && (texto[3] == 't')){
	MOVF       _texto+0, 0
	XORLW      33
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt30
	MOVF       _texto+1, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt30
	MOVF       _texto+2, 0
	XORLW      111
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt30
	MOVF       _texto+3, 0
	XORLW      116
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt30
L__interrupt37:
;VSaula055_USART_Leitura_Escrita.c,100 :: 		switch(texto[4]){
	GOTO       L_interrupt31
;VSaula055_USART_Leitura_Escrita.c,101 :: 		case '0': pot0 = 1; break;
L_interrupt33:
	BSF        _pot0+0, BitPos(_pot0+0)
	GOTO       L_interrupt32
;VSaula055_USART_Leitura_Escrita.c,102 :: 		case '1': pot1 = 1; break;
L_interrupt34:
	BSF        _pot1+0, BitPos(_pot1+0)
	GOTO       L_interrupt32
;VSaula055_USART_Leitura_Escrita.c,103 :: 		}
L_interrupt31:
	MOVF       _texto+4, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt33
	MOVF       _texto+4, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt34
L_interrupt32:
;VSaula055_USART_Leitura_Escrita.c,104 :: 		}
L_interrupt30:
;VSaula055_USART_Leitura_Escrita.c,105 :: 		}
L_interrupt27:
;VSaula055_USART_Leitura_Escrita.c,106 :: 		} else {
	GOTO       L_interrupt35
L_interrupt12:
;VSaula055_USART_Leitura_Escrita.c,107 :: 		c_texto++;
	INCF       _c_texto+0, 1
;VSaula055_USART_Leitura_Escrita.c,108 :: 		if(c_texto > 5) c_texto = 0;
	MOVF       _c_texto+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt36
	CLRF       _c_texto+0
L_interrupt36:
;VSaula055_USART_Leitura_Escrita.c,109 :: 		}
L_interrupt35:
;VSaula055_USART_Leitura_Escrita.c,110 :: 		}
L_interrupt11:
;VSaula055_USART_Leitura_Escrita.c,111 :: 		RCIF_bit = 0;
	BCF        RCIF_bit+0, 5
;VSaula055_USART_Leitura_Escrita.c,112 :: 		}
L_interrupt9:
;VSaula055_USART_Leitura_Escrita.c,114 :: 		}
L__interrupt39:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
