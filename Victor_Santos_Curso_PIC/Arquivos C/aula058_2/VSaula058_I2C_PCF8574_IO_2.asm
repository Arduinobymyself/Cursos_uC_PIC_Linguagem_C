
_main:

;VSaula058_I2C_PCF8574_IO_2.c,34 :: 		void main() {
;VSaula058_I2C_PCF8574_IO_2.c,38 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;VSaula058_I2C_PCF8574_IO_2.c,42 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula058_I2C_PCF8574_IO_2.c,43 :: 		PORTD = 0x01;
	MOVLW      1
	MOVWF      PORTD+0
;VSaula058_I2C_PCF8574_IO_2.c,47 :: 		while(1){
L_main0:
;VSaula058_I2C_PCF8574_IO_2.c,49 :: 		writePCF8574(0,PORTD);
	CLRF       FARG_writePCF8574_wdispositivo+0
	MOVF       PORTD+0, 0
	MOVWF      FARG_writePCF8574_wvalor+0
	CALL       _writePCF8574+0
;VSaula058_I2C_PCF8574_IO_2.c,50 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;VSaula058_I2C_PCF8574_IO_2.c,52 :: 		}//final do Loop
	GOTO       L_main0
;VSaula058_I2C_PCF8574_IO_2.c,54 :: 		}//Final da main
	GOTO       $+0
; end of _main

_writePCF8574:

;VSaula058_I2C_PCF8574_IO_2.c,56 :: 		void writePCF8574(char wdispositivo, char wvalor)
;VSaula058_I2C_PCF8574_IO_2.c,59 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula058_I2C_PCF8574_IO_2.c,60 :: 		I2C1_Wr((0b01000000) | (wdispositivo << 1));
	MOVF       FARG_writePCF8574_wdispositivo+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO_2.c,61 :: 		I2C1_Wr( wvalor );
	MOVF       FARG_writePCF8574_wvalor+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO_2.c,62 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula058_I2C_PCF8574_IO_2.c,63 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writePCF85743:
	DECFSZ     R13+0, 1
	GOTO       L_writePCF85743
	DECFSZ     R12+0, 1
	GOTO       L_writePCF85743
	NOP
	NOP
;VSaula058_I2C_PCF8574_IO_2.c,65 :: 		}
	RETURN
; end of _writePCF8574
