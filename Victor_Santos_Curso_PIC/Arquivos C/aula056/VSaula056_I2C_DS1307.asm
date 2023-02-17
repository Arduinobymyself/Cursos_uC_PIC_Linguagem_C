
_main:

;VSaula056_I2C_DS1307.c,37 :: 		void main() {
;VSaula056_I2C_DS1307.c,39 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;VSaula056_I2C_DS1307.c,40 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula056_I2C_DS1307.c,43 :: 		I2C1_Wr(11010000);      // escreve o endereço do DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,44 :: 		I2C1_Wr(0x04);          // escreve no endereço do dia
	MOVLW      4
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,45 :: 		I2C1_Wr(dec2Bcd(14));   // escreve o dia 14
	MOVLW      14
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,47 :: 		I2C1_Wr(0x05);          // escreve no endereço do mês
	MOVLW      5
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,48 :: 		I2C1_Wr(dec2Bcd(2));   // escreve o mês fevereiro
	MOVLW      2
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,50 :: 		I2C1_Wr(0x06);          // escreve no endereço do ano
	MOVLW      6
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,51 :: 		I2C1_Wr(dec2Bcd(23));   // escreve o ano
	MOVLW      23
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,53 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula056_I2C_DS1307.c,54 :: 		delay_ms(100);
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
;VSaula056_I2C_DS1307.c,58 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;VSaula056_I2C_DS1307.c,59 :: 		I2C1_Wr(11010000);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,60 :: 		I2C1_Wr(0x06); // lê o ano
	MOVLW      6
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,61 :: 		I2C1_Repeated_Start(); // restarta
	CALL       _I2C1_Repeated_Start+0
;VSaula056_I2C_DS1307.c,62 :: 		I2C1_Wr(11010001);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;VSaula056_I2C_DS1307.c,63 :: 		valorDS = Bcd2Dec(I2C1_Rd(0)); // lê e para, armazena na variável
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _valorDS+0
	CLRF       _valorDS+1
;VSaula056_I2C_DS1307.c,64 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;VSaula056_I2C_DS1307.c,65 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;VSaula056_I2C_DS1307.c,74 :: 		while(1){
L_main2:
;VSaula056_I2C_DS1307.c,76 :: 		}
	GOTO       L_main2
;VSaula056_I2C_DS1307.c,79 :: 		}
	GOTO       $+0
; end of _main
