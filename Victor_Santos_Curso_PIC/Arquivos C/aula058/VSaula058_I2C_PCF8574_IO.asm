
_main:

;VSaula058_I2C_PCF8574_IO.c,3 :: 		void main()
;VSaula058_I2C_PCF8574_IO.c,5 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;VSaula058_I2C_PCF8574_IO.c,6 :: 		TRISD = 0;
	CLRF       TRISD+0
;VSaula058_I2C_PCF8574_IO.c,7 :: 		PORTD = 0;
	CLRF       PORTD+0
;VSaula058_I2C_PCF8574_IO.c,8 :: 		TRISB0_bit = 1;
	BSF        TRISB0_bit+0, 0
;VSaula058_I2C_PCF8574_IO.c,11 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula058_I2C_PCF8574_IO.c,12 :: 		I2C1_Wr(0b01000010); // 7 bits de endereço, último bit em 0 -> escrita
	MOVLW      66
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO.c,13 :: 		I2C1_Wr(0b01000001); //escreve em P7 ... P0
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO.c,14 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula058_I2C_PCF8574_IO.c,18 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula058_I2C_PCF8574_IO.c,19 :: 		I2C1_Wr(0b01000001); // 7 bits de endereço, último bit em 1 -> leitura
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO.c,20 :: 		PORTD = I2C1_Rd(0);  // faz a leitura e envia ao PORT D
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;VSaula058_I2C_PCF8574_IO.c,21 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula058_I2C_PCF8574_IO.c,24 :: 		while(1){//Inicio do Loop
L_main0:
;VSaula058_I2C_PCF8574_IO.c,26 :: 		if(!RB0_bit){
	BTFSC      RB0_bit+0, 0
	GOTO       L_main2
;VSaula058_I2C_PCF8574_IO.c,28 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula058_I2C_PCF8574_IO.c,29 :: 		I2C1_Wr(0b01000001);
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula058_I2C_PCF8574_IO.c,30 :: 		PORTD = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;VSaula058_I2C_PCF8574_IO.c,31 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula058_I2C_PCF8574_IO.c,32 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;VSaula058_I2C_PCF8574_IO.c,33 :: 		}
L_main2:
;VSaula058_I2C_PCF8574_IO.c,35 :: 		}//Final do Loop
	GOTO       L_main0
;VSaula058_I2C_PCF8574_IO.c,37 :: 		}//Final da main
	GOTO       $+0
; end of _main
