
_main:

;USART_2.c,25 :: 		void main() {
;USART_2.c,26 :: 		CMCON = 0x07;                   // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;USART_2.c,28 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;USART_2.c,29 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;USART_2.c,30 :: 		TRISD = 0;
	CLRF       TRISD+0
;USART_2.c,31 :: 		PORTD = 0;
	CLRF       PORTD+0
;USART_2.c,33 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;USART_2.c,34 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;USART_2.c,36 :: 		UART1_Write_Text("Start, teste de Echo");
	MOVLW      ?lstr1_USART_2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;USART_2.c,37 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,38 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,40 :: 		while (1) {                     // Endless loop
L_main1:
;USART_2.c,41 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;USART_2.c,42 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;USART_2.c,43 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,44 :: 		}
L_main3:
;USART_2.c,46 :: 		switch(uart_rd) {
	GOTO       L_main4
;USART_2.c,47 :: 		case 'A': RD0_bit = 1; break;  // liga LED 0
L_main6:
	BSF        RD0_bit+0, 0
	GOTO       L_main5
;USART_2.c,48 :: 		case 'B': RD1_bit = 1; break;  // liga LED 1
L_main7:
	BSF        RD1_bit+0, 1
	GOTO       L_main5
;USART_2.c,49 :: 		case 'C': RD2_bit = 1; break;
L_main8:
	BSF        RD2_bit+0, 2
	GOTO       L_main5
;USART_2.c,50 :: 		case 'D': RD3_bit = 1; break;
L_main9:
	BSF        RD3_bit+0, 3
	GOTO       L_main5
;USART_2.c,51 :: 		case 'E': RD4_bit = 1; break;
L_main10:
	BSF        RD4_bit+0, 4
	GOTO       L_main5
;USART_2.c,52 :: 		case 'F': RD5_bit = 1; break;
L_main11:
	BSF        RD5_bit+0, 5
	GOTO       L_main5
;USART_2.c,53 :: 		case 'G': RD6_bit = 1; break;
L_main12:
	BSF        RD6_bit+0, 6
	GOTO       L_main5
;USART_2.c,54 :: 		case 'H': RD7_bit = 1; break;
L_main13:
	BSF        RD7_bit+0, 7
	GOTO       L_main5
;USART_2.c,55 :: 		case 'I': PORTD = 0; break;    // desliga tudo
L_main14:
	CLRF       PORTD+0
	GOTO       L_main5
;USART_2.c,56 :: 		}
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _uart_rd+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _uart_rd+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _uart_rd+0, 0
	XORLW      71
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _uart_rd+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _uart_rd+0, 0
	XORLW      73
	BTFSC      STATUS+0, 2
	GOTO       L_main14
L_main5:
;USART_2.c,58 :: 		if(!RB0_bit) {
	BTFSC      RB0_bit+0, 0
	GOTO       L_main15
;USART_2.c,59 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;USART_2.c,60 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,61 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,62 :: 		UART1_Write_Text("Botao Alerta Pressionado");
	MOVLW      ?lstr2_USART_2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;USART_2.c,63 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,64 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_2.c,65 :: 		}
L_main15:
;USART_2.c,67 :: 		}
	GOTO       L_main1
;USART_2.c,68 :: 		}
	GOTO       $+0
; end of _main
