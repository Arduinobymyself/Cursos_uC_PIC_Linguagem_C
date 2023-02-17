
_main:

;VSaulao59_I2C_PCF8574_LCD.c,28 :: 		void main() {     // Função Obrigatória da linguagem C
;VSaulao59_I2C_PCF8574_LCD.c,32 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;VSaulao59_I2C_PCF8574_LCD.c,36 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaulao59_I2C_PCF8574_LCD.c,37 :: 		PORTD = 0x01;
	MOVLW      1
	MOVWF      PORTD+0
;VSaulao59_I2C_PCF8574_LCD.c,41 :: 		for(;;) //Loop infinito -- inicio do código -- Obrigatória
L_main0:
;VSaulao59_I2C_PCF8574_LCD.c,44 :: 		writePCF8574(0,PORTD);
	CLRF       FARG_writePCF8574_wdispositivo+0
	MOVF       PORTD+0, 0
	MOVWF      FARG_writePCF8574_wvalor+0
	CALL       _writePCF8574+0
;VSaulao59_I2C_PCF8574_LCD.c,45 :: 		Delay_ms(2000);
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
;VSaulao59_I2C_PCF8574_LCD.c,47 :: 		}//final do Loop
	GOTO       L_main0
;VSaulao59_I2C_PCF8574_LCD.c,48 :: 		}//Final da main
	GOTO       $+0
; end of _main

_writePCF8574:

;VSaulao59_I2C_PCF8574_LCD.c,50 :: 		void writePCF8574(char wdispositivo, char wvalor)
;VSaulao59_I2C_PCF8574_LCD.c,53 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaulao59_I2C_PCF8574_LCD.c,54 :: 		I2C1_Wr((0b01000000) | (wdispositivo << 1));
	MOVF       FARG_writePCF8574_wdispositivo+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaulao59_I2C_PCF8574_LCD.c,55 :: 		I2C1_Wr( wvalor );
	MOVF       FARG_writePCF8574_wvalor+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaulao59_I2C_PCF8574_LCD.c,56 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaulao59_I2C_PCF8574_LCD.c,57 :: 		Delay_ms(5);
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
;VSaulao59_I2C_PCF8574_LCD.c,59 :: 		}
	RETURN
; end of _writePCF8574
