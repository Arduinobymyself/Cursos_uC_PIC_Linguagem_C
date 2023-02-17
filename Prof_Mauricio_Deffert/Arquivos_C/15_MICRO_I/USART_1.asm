
_main:

;USART_1.c,25 :: 		void main() {
;USART_1.c,26 :: 		CMCON = 0x07;                   // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;USART_1.c,28 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;USART_1.c,29 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;USART_1.c,30 :: 		UART1_Write_Text("Start, teste de Echo");
	MOVLW      ?lstr1_USART_1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;USART_1.c,31 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_1.c,32 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_1.c,33 :: 		while (1) {                     // Endless loop
L_main1:
;USART_1.c,34 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;USART_1.c,35 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;USART_1.c,36 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;USART_1.c,37 :: 		}
L_main3:
;USART_1.c,38 :: 		}
	GOTO       L_main1
;USART_1.c,39 :: 		}
	GOTO       $+0
; end of _main
