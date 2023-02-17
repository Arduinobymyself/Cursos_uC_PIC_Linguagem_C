
_main:

;ConversaoAD_ViaSerial.c,8 :: 		void main() {
;ConversaoAD_ViaSerial.c,9 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ConversaoAD_ViaSerial.c,10 :: 		ADCON1 = 0;
	CLRF       ADCON1+0
;ConversaoAD_ViaSerial.c,11 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;ConversaoAD_ViaSerial.c,12 :: 		do {
L_main0:
;ConversaoAD_ViaSerial.c,13 :: 		temp_res = ADC_Read(0) >> 2;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _temp_res+0
;ConversaoAD_ViaSerial.c,14 :: 		UART1_Write(temp_res);
	MOVF       R2+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ConversaoAD_ViaSerial.c,15 :: 		} while (1);
	GOTO       L_main0
;ConversaoAD_ViaSerial.c,16 :: 		}
	GOTO       $+0
; end of _main
