
_main:

;VSaula053_USART_Library.c,7 :: 		void main() {
;VSaula053_USART_Library.c,9 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;VSaula053_USART_Library.c,10 :: 		UART1_Write_Text("Marcelo Moraes");
	MOVLW      ?lstr1_VSaula053_USART_Library+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;VSaula053_USART_Library.c,12 :: 		while(1){
L_main0:
;VSaula053_USART_Library.c,13 :: 		if(UART1_Data_Ready()){ // se tem algo no buffer
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;VSaula053_USART_Library.c,14 :: 		texto = UART1_read(); // pega informação
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _texto+0
;VSaula053_USART_Library.c,15 :: 		UART1_Write(13);      // próxima linha
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula053_USART_Library.c,16 :: 		UART1_Write(texto);   // faz o echo
	MOVF       _texto+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula053_USART_Library.c,17 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula053_USART_Library.c,18 :: 		while(!UART1_Tx_Idle()); // espera terminar de transmitir
L_main3:
	CALL       _UART1_Tx_Idle+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;VSaula053_USART_Library.c,19 :: 		}
L_main2:
;VSaula053_USART_Library.c,21 :: 		}
	GOTO       L_main0
;VSaula053_USART_Library.c,28 :: 		}
	GOTO       $+0
; end of _main
