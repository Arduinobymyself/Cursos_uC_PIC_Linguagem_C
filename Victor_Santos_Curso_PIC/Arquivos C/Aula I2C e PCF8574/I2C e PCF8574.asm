
_main:

	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
	CLRF       TRISD+0
	MOVLW      1
	MOVWF      PORTD+0
L_main0:
	CLRF       FARG_writePCF8574_wdispositivo+0
	MOVF       PORTD+0, 0
	MOVWF      FARG_writePCF8574_wvalor+0
	CALL       _writePCF8574+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main

_writePCF8574:

	CALL       _I2C1_Start+0
	MOVF       FARG_writePCF8574_wdispositivo+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	MOVF       FARG_writePCF8574_wvalor+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	CALL       _I2C1_Stop+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writePCF85744:
	DECFSZ     R13+0, 1
	GOTO       L_writePCF85744
	DECFSZ     R12+0, 1
	GOTO       L_writePCF85744
	NOP
	NOP
L_end_writePCF8574:
	RETURN
; end of _writePCF8574
