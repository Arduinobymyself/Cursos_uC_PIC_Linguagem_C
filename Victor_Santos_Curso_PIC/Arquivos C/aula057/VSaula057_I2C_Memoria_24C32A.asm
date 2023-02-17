
_write24C32A:

;24c32a_i2c_lib.h,20 :: 		void write24C32A(char wdevice, char w24C32A_reg, char w24C32A_value){
;24c32a_i2c_lib.h,22 :: 		I2C1_Start();        // inicia comunicação
	CALL       _I2C1_Start+0
;24c32a_i2c_lib.h,23 :: 		I2C1_Wr((0b10100000) | (wdevice << 1));
	MOVF       FARG_write24C32A_wdevice+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      160
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,24 :: 		I2C1_Wr(w24C32A_reg >> 4);
	MOVF       FARG_write24C32A_w24C32A_reg+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,25 :: 		I2C1_Wr(w24C32A_reg &  0x0F);
	MOVLW      15
	ANDWF      FARG_write24C32A_w24C32A_reg+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,26 :: 		I2C1_Wr(w24C32A_value);
	MOVF       FARG_write24C32A_w24C32A_value+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,27 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;24c32a_i2c_lib.h,28 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_write24C32A0:
	DECFSZ     R13+0, 1
	GOTO       L_write24C32A0
	DECFSZ     R12+0, 1
	GOTO       L_write24C32A0
	NOP
	NOP
;24c32a_i2c_lib.h,29 :: 		}
	RETURN
; end of _write24C32A

_read24C32A:

;24c32a_i2c_lib.h,31 :: 		char read24C32A(char rdevice, char r24C32A_reg){
;24c32a_i2c_lib.h,34 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;24c32a_i2c_lib.h,35 :: 		I2C1_Wr((0b10100000) | (rdevice << 1));
	MOVF       FARG_read24C32A_rdevice+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      160
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,36 :: 		I2C1_Wr(r24C32A_reg >> 4);
	MOVF       FARG_read24C32A_r24C32A_reg+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	RRF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 7
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,37 :: 		I2C1_Wr(r24C32A_reg &  0x0F);
	MOVLW      15
	ANDWF      FARG_read24C32A_r24C32A_reg+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,38 :: 		I2C1_repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;24c32a_i2c_lib.h,39 :: 		I2C1_Wr((0b10100001) | (rdevice << 1));
	MOVF       FARG_read24C32A_rdevice+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      161
	IORWF      R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;24c32a_i2c_lib.h,40 :: 		r24C32A_value = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      read24C32A_r24C32A_value_L0+0
;24c32a_i2c_lib.h,41 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;24c32a_i2c_lib.h,42 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_read24C32A1:
	DECFSZ     R13+0, 1
	GOTO       L_read24C32A1
	DECFSZ     R12+0, 1
	GOTO       L_read24C32A1
	NOP
	NOP
;24c32a_i2c_lib.h,43 :: 		return  r24C32A_value;
	MOVF       read24C32A_r24C32A_value_L0+0, 0
	MOVWF      R0+0
;24c32a_i2c_lib.h,45 :: 		}
	RETURN
; end of _read24C32A

_write24C32A_text:

;24c32a_i2c_lib.h,48 :: 		void write24C32A_text(char wdevice, char w24C32A_reg, char *w24C32A_text){
;24c32a_i2c_lib.h,50 :: 		while(*w24C32A_text != '\0'){
L_write24C32A_text2:
	MOVF       FARG_write24C32A_text_w24C32A_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_write24C32A_text3
;24c32a_i2c_lib.h,51 :: 		write24C32A(wdevice, w24C32A_reg, *w24C32A_text);
	MOVF       FARG_write24C32A_text_wdevice+0, 0
	MOVWF      FARG_write24C32A_wdevice+0
	MOVF       FARG_write24C32A_text_w24C32A_reg+0, 0
	MOVWF      FARG_write24C32A_w24C32A_reg+0
	MOVF       FARG_write24C32A_text_w24C32A_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write24C32A_w24C32A_value+0
	CALL       _write24C32A+0
;24c32a_i2c_lib.h,52 :: 		w24C32A_reg++;
	INCF       FARG_write24C32A_text_w24C32A_reg+0, 1
;24c32a_i2c_lib.h,53 :: 		w24C32A_text++;
	INCF       FARG_write24C32A_text_w24C32A_text+0, 1
;24c32a_i2c_lib.h,54 :: 		}
	GOTO       L_write24C32A_text2
L_write24C32A_text3:
;24c32a_i2c_lib.h,55 :: 		}
	RETURN
; end of _write24C32A_text

_read24C32A_text:

;24c32a_i2c_lib.h,57 :: 		void read24C32A_text(char rdevice, char r24C32A_reg, char *r24C32A_text, char r24C32A_chr){
;24c32a_i2c_lib.h,60 :: 		while(rauxtxt != r24C32A_chr){
L_read24C32A_text4:
	MOVF       read24C32A_text_rauxtxt_L0+0, 0
	XORWF      FARG_read24C32A_text_r24C32A_chr+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_read24C32A_text5
;24c32a_i2c_lib.h,61 :: 		*r24C32A_text = read24C32A(rdevice, r24C32A_reg);
	MOVF       FARG_read24C32A_text_rdevice+0, 0
	MOVWF      FARG_read24C32A_rdevice+0
	MOVF       FARG_read24C32A_text_r24C32A_reg+0, 0
	MOVWF      FARG_read24C32A_r24C32A_reg+0
	CALL       _read24C32A+0
	MOVF       FARG_read24C32A_text_r24C32A_text+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;24c32a_i2c_lib.h,62 :: 		rauxtxt = *r24C32A_text;
	MOVF       FARG_read24C32A_text_r24C32A_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      read24C32A_text_rauxtxt_L0+0
;24c32a_i2c_lib.h,63 :: 		r24C32A_reg++;
	INCF       FARG_read24C32A_text_r24C32A_reg+0, 1
;24c32a_i2c_lib.h,64 :: 		r24C32A_text++;
	INCF       FARG_read24C32A_text_r24C32A_text+0, 1
;24c32a_i2c_lib.h,65 :: 		}
	GOTO       L_read24C32A_text4
L_read24C32A_text5:
;24c32a_i2c_lib.h,67 :: 		}
	RETURN
; end of _read24C32A_text

_main:

;VSaula057_I2C_Memoria_24C32A.c,9 :: 		void main() {
;VSaula057_I2C_Memoria_24C32A.c,10 :: 		I2C1_Init(100000);   // incicializa o I2C1
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;VSaula057_I2C_Memoria_24C32A.c,11 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;VSaula057_I2C_Memoria_24C32A.c,14 :: 		write24C32A(0x00, 0x00, 'a');
	CLRF       FARG_write24C32A_wdevice+0
	CLRF       FARG_write24C32A_w24C32A_reg+0
	MOVLW      97
	MOVWF      FARG_write24C32A_w24C32A_value+0
	CALL       _write24C32A+0
;VSaula057_I2C_Memoria_24C32A.c,15 :: 		caractere = read24C32A(0x00, 0x00);
	CLRF       FARG_read24C32A_rdevice+0
	CLRF       FARG_read24C32A_r24C32A_reg+0
	CALL       _read24C32A+0
	MOVF       R0+0, 0
	MOVWF      _caractere+0
;VSaula057_I2C_Memoria_24C32A.c,16 :: 		UART1_Write(caractere);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula057_I2C_Memoria_24C32A.c,17 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;VSaula057_I2C_Memoria_24C32A.c,19 :: 		write24C32A_text(0x01, 0x00, "Marcelo Moraes#");
	MOVLW      1
	MOVWF      FARG_write24C32A_text_wdevice+0
	CLRF       FARG_write24C32A_text_w24C32A_reg+0
	MOVLW      ?lstr1_VSaula057_I2C_Memoria_24C32A+0
	MOVWF      FARG_write24C32A_text_w24C32A_text+0
	CALL       _write24C32A_text+0
;VSaula057_I2C_Memoria_24C32A.c,20 :: 		read24C32A_text(0x01, 0x00, texto, '#');
	MOVLW      1
	MOVWF      FARG_read24C32A_text_rdevice+0
	CLRF       FARG_read24C32A_text_r24C32A_reg+0
	MOVLW      _texto+0
	MOVWF      FARG_read24C32A_text_r24C32A_text+0
	MOVLW      35
	MOVWF      FARG_read24C32A_text_r24C32A_chr+0
	CALL       _read24C32A_text+0
;VSaula057_I2C_Memoria_24C32A.c,21 :: 		tamanho = strlen(texto);
	MOVLW      _texto+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      _tamanho+0
;VSaula057_I2C_Memoria_24C32A.c,22 :: 		texto[tamanho-1] = '\0';
	MOVLW      1
	SUBWF      R0+0, 1
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      _texto+0
	MOVWF      FSR
	CLRF       INDF+0
;VSaula057_I2C_Memoria_24C32A.c,23 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;VSaula057_I2C_Memoria_24C32A.c,25 :: 		while(1){
L_main6:
;VSaula057_I2C_Memoria_24C32A.c,27 :: 		}
	GOTO       L_main6
;VSaula057_I2C_Memoria_24C32A.c,29 :: 		}
	GOTO       $+0
; end of _main
