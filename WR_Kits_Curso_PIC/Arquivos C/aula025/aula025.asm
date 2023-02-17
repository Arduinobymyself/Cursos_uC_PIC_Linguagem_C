
_main:

;aula025.c,40 :: 		void main() {
;aula025.c,41 :: 		CMCON = 0x07; // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula025.c,42 :: 		TRISA = 0x03; // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula025.c,43 :: 		TRISB = 0x00; // todo o port B como saída
	CLRF       TRISB+0
;aula025.c,44 :: 		PORTA = 0x03; // RA0 e RA1 iniciam em nível alto (HIGH)
	MOVLW      3
	MOVWF      PORTA+0
;aula025.c,45 :: 		PORTB = 0x00; // port B inicia em nível baixo (LOW)
	CLRF       PORTB+0
;aula025.c,47 :: 		readEEPROM();
	CALL       _readEEPROM+0
;aula025.c,49 :: 		while(1)
L_main0:
;aula025.c,52 :: 		changeCont();
	CALL       _changeCont+0
;aula025.c,53 :: 		if(!S2) writeEEPROM();
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
	CALL       _writeEEPROM+0
L_main2:
;aula025.c,54 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula025.c,55 :: 		catodo = segmento[cont]; // valor a ser enviado ao port B
	MOVF       _cont+0, 0
	ADDLW      _segmento+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _catodo+0
;aula025.c,56 :: 		PORTB = catodo; // envia o pattern ao port B
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula025.c,57 :: 		}
	GOTO       L_main0
;aula025.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_changeCont:

;aula025.c,60 :: 		void changeCont(){
;aula025.c,61 :: 		if(!S1){
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_changeCont4
;aula025.c,62 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_changeCont5:
	DECFSZ     R13+0, 1
	GOTO       L_changeCont5
	DECFSZ     R12+0, 1
	GOTO       L_changeCont5
	NOP
	NOP
;aula025.c,63 :: 		cont++;
	INCF       _cont+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cont+1, 1
;aula025.c,64 :: 		if(cont > 9) cont = 0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cont+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeCont16
	MOVF       _cont+0, 0
	SUBLW      9
L__changeCont16:
	BTFSC      STATUS+0, 0
	GOTO       L_changeCont6
	CLRF       _cont+0
	CLRF       _cont+1
L_changeCont6:
;aula025.c,65 :: 		}
L_changeCont4:
;aula025.c,66 :: 		}
L_end_changeCont:
	RETURN
; end of _changeCont

_writeEEPROM:

;aula025.c,67 :: 		void writeEEPROM(){
;aula025.c,70 :: 		aux1 = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;aula025.c,71 :: 		if(aux1 == 0xff){
	MOVF       R0+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_writeEEPROM7
;aula025.c,72 :: 		EEPROM_Write(0x00, address);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _address+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;aula025.c,73 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writeEEPROM8:
	DECFSZ     R13+0, 1
	GOTO       L_writeEEPROM8
	DECFSZ     R12+0, 1
	GOTO       L_writeEEPROM8
	NOP
	NOP
;aula025.c,74 :: 		}
L_writeEEPROM7:
;aula025.c,76 :: 		store = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _store+0
	CLRF       _store+1
;aula025.c,77 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writeEEPROM9:
	DECFSZ     R13+0, 1
	GOTO       L_writeEEPROM9
	DECFSZ     R12+0, 1
	GOTO       L_writeEEPROM9
	NOP
	NOP
;aula025.c,78 :: 		aux2 = store;
	MOVF       _store+0, 0
	MOVWF      writeEEPROM_aux2_L0+0
;aula025.c,79 :: 		EEPROM_Write(store, cont);
	MOVF       _store+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _cont+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;aula025.c,80 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writeEEPROM10:
	DECFSZ     R13+0, 1
	GOTO       L_writeEEPROM10
	DECFSZ     R12+0, 1
	GOTO       L_writeEEPROM10
	NOP
	NOP
;aula025.c,81 :: 		aux2++;
	INCF       writeEEPROM_aux2_L0+0, 1
;aula025.c,82 :: 		if(aux2 > 128) aux2 = 0x00;
	MOVF       writeEEPROM_aux2_L0+0, 0
	SUBLW      128
	BTFSC      STATUS+0, 0
	GOTO       L_writeEEPROM11
	CLRF       writeEEPROM_aux2_L0+0
L_writeEEPROM11:
;aula025.c,84 :: 		EEPROM_Write(0x00, aux2);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       writeEEPROM_aux2_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;aula025.c,86 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_writeEEPROM12:
	DECFSZ     R13+0, 1
	GOTO       L_writeEEPROM12
	DECFSZ     R12+0, 1
	GOTO       L_writeEEPROM12
	NOP
	NOP
;aula025.c,87 :: 		L1 = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;aula025.c,88 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_writeEEPROM13:
	DECFSZ     R13+0, 1
	GOTO       L_writeEEPROM13
	DECFSZ     R12+0, 1
	GOTO       L_writeEEPROM13
	DECFSZ     R11+0, 1
	GOTO       L_writeEEPROM13
;aula025.c,89 :: 		L1 = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;aula025.c,90 :: 		}
L_end_writeEEPROM:
	RETURN
; end of _writeEEPROM

_readEEPROM:

;aula025.c,92 :: 		void readEEPROM(){
;aula025.c,94 :: 		anchor = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;aula025.c,95 :: 		cont = EEPROM_Read(0x00+(anchor-1));
	DECF       R0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _cont+0
	CLRF       _cont+1
;aula025.c,96 :: 		}
L_end_readEEPROM:
	RETURN
; end of _readEEPROM
