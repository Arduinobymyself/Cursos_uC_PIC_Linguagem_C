
_main:

;aula020.c,32 :: 		void main() {
;aula020.c,33 :: 		CMCON = 0x07;                   // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula020.c,34 :: 		ADCON0 = 0x00;                  // desabilita os conversores AD
	CLRF       ADCON0+0
;aula020.c,35 :: 		ADCON1 = 0x06;                  // tornar todo o ADC digital 0b000000110
	MOVLW      6
	MOVWF      ADCON1+0
;aula020.c,37 :: 		TRISB = 0x80;                   // RB7 como entrada
	MOVLW      128
	MOVWF      TRISB+0
;aula020.c,38 :: 		PORTB = 0x00;                   // port B iniciando en nível low
	CLRF       PORTB+0
;aula020.c,40 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;aula020.c,41 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;aula020.c,42 :: 		UART1_Write_Text("Start");
	MOVLW      ?lstr1_aula020+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aula020.c,43 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula020.c,44 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula020.c,45 :: 		while (1) {                     // Endless loop
L_main1:
;aula020.c,46 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;aula020.c,47 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;aula020.c,49 :: 		switch(uart_rd) {
	GOTO       L_main4
;aula020.c,50 :: 		case 'y': YELLOW = 0X01; break;
L_main6:
	BSF        RB0_bit+0, 0
	GOTO       L_main5
;aula020.c,51 :: 		case 't': YELLOW = 0x00; break;
L_main7:
	BCF        RB0_bit+0, 0
	GOTO       L_main5
;aula020.c,52 :: 		case 'r': RED = 0X01; break;
L_main8:
	BSF        RB1_bit+0, 1
	GOTO       L_main5
;aula020.c,53 :: 		case 'e': RED = 0x00; break;
L_main9:
	BCF        RB1_bit+0, 1
	GOTO       L_main5
;aula020.c,54 :: 		case 'g': GREEN = 0x01; break;
L_main10:
	BSF        RB2_bit+0, 2
	GOTO       L_main5
;aula020.c,55 :: 		case 'f': GREEN = 0x00; break;
L_main11:
	BCF        RB2_bit+0, 2
	GOTO       L_main5
;aula020.c,56 :: 		}
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
;aula020.c,57 :: 		}
L_main3:
;aula020.c,58 :: 		if(S1) {
	BTFSS      RB7_bit+0, 7
	GOTO       L_main12
;aula020.c,59 :: 		delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;aula020.c,60 :: 		UART1_Write_Text("Botão Alerta Pressionado");
	MOVLW      ?lstr2_aula020+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aula020.c,61 :: 		UART1_Write(10);                // Line Feed (ASCII)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula020.c,62 :: 		UART1_Write(13);                // Carriage Return (ASCII)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;aula020.c,63 :: 		}
L_main12:
;aula020.c,64 :: 		}
	GOTO       L_main1
;aula020.c,65 :: 		}
	GOTO       $+0
; end of _main
