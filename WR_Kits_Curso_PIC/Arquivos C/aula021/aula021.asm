
_main:

;aula021.c,35 :: 		void main() {
;aula021.c,36 :: 		CMCON = 0x07;                   // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula021.c,37 :: 		ADCON0 = 0x01;                  // configura os conversores AD 0b00000001 ADON = 1
	MOVLW      1
	MOVWF      ADCON0+0
;aula021.c,38 :: 		ADCON1 = 0x0E;                  // configura somente o AN0 como entrada analógica 0b000001110
	MOVLW      14
	MOVWF      ADCON1+0
;aula021.c,40 :: 		TRISB = 0x01;                   // RB0 como entrada
	MOVLW      1
	MOVWF      TRISB+0
;aula021.c,41 :: 		PORTB = 0x00;                   // port B iniciando en nível low
	CLRF       PORTB+0
;aula021.c,42 :: 		TRISD = 0x00;                   // port D como saída
	CLRF       TRISD+0
;aula021.c,43 :: 		PORTD = 0x00;                   // port D inciando em nível low
	CLRF       PORTD+0
;aula021.c,45 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;aula021.c,46 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;aula021.c,47 :: 		UART1_Write_Text("Start");      // escreve algo para testar a serial
	MOVLW      ?lstr1_aula021+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aula021.c,48 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula021.c,49 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula021.c,51 :: 		while (1) {                     // Endless loop
L_main1:
;aula021.c,52 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;aula021.c,53 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;aula021.c,55 :: 		switch(uart_rd) {
	GOTO       L_main4
;aula021.c,56 :: 		case 'y': YELLOW = 0X01; break;
L_main6:
	BSF        RD2_bit+0, 2
	GOTO       L_main5
;aula021.c,57 :: 		case 't': YELLOW = 0x00; break;
L_main7:
	BCF        RD2_bit+0, 2
	GOTO       L_main5
;aula021.c,58 :: 		case 'r': RED = 0X01; break;
L_main8:
	BSF        RD0_bit+0, 0
	GOTO       L_main5
;aula021.c,59 :: 		case 'e': RED = 0x00; break;
L_main9:
	BCF        RD0_bit+0, 0
	GOTO       L_main5
;aula021.c,60 :: 		case 'g': GREEN = 0x01; break;
L_main10:
	BSF        RD1_bit+0, 1
	GOTO       L_main5
;aula021.c,61 :: 		case 'f': GREEN = 0x00; break;
L_main11:
	BCF        RD1_bit+0, 1
	GOTO       L_main5
;aula021.c,62 :: 		}
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      121
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      116
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _uart_rd+0, 0
	XORLW      114
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _uart_rd+0, 0
	XORLW      101
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      103
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      102
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main5:
;aula021.c,63 :: 		}
L_main3:
;aula021.c,65 :: 		if(!S1) {
	BTFSC      RB0_bit+0, 0
	GOTO       L_main12
;aula021.c,66 :: 		valorAD = ADC_Read(0);          // le a entrada analógica 0 e atribui valor à variável
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valorAd+0
	MOVF       R0+1, 0
	MOVWF      _valorAd+1
	CLRF       _valorAd+2
	CLRF       _valorAd+3
;aula021.c,67 :: 		valorAD = valorAD*500/1023;     // converte para temperatura
	MOVF       _valorAd+0, 0
	MOVWF      R0+0
	MOVF       _valorAd+1, 0
	MOVWF      R0+1
	MOVF       _valorAd+2, 0
	MOVWF      R0+2
	MOVF       _valorAd+3, 0
	MOVWF      R0+3
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _valorAd+0
	MOVF       R0+1, 0
	MOVWF      _valorAd+1
	MOVF       R0+2, 0
	MOVWF      _valorAd+2
	MOVF       R0+3, 0
	MOVWF      _valorAd+3
;aula021.c,81 :: 		IntToStr(valorAD, txt);         // converte um int para um string
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;aula021.c,82 :: 		UART1_Write_Text(txt);          // imprime o valor do ADC
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aula021.c,83 :: 		UART1_Write_Text(" Celsius");
	MOVLW      ?lstr2_aula021+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aula021.c,84 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula021.c,85 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula021.c,86 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
	NOP
;aula021.c,87 :: 		}
L_main12:
;aula021.c,88 :: 		}
	GOTO       L_main1
;aula021.c,89 :: 		}
	GOTO       $+0
; end of _main
