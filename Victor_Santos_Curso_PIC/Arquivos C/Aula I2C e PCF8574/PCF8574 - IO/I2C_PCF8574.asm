
_main:

	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
	CLRF       TRISD+0
	CLRF       PORTD+0
	BSF        TRISB0_bit+0, 0
	CALL       _I2C1_Start+0
	MOVLW      66
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	CALL       _I2C1_Stop+0
	CALL       _I2C1_Start+0
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
	CALL       _I2C1_Stop+0
L_main0:
	BTFSC      RB0_bit+0, 0
	GOTO       L_main3
	CALL       _I2C1_Start+0
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
	CALL       _I2C1_Stop+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
L_main3:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
