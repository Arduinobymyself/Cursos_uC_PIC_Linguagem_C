
_main:

;aula044.c,23 :: 		void main() {
;aula044.c,25 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;aula044.c,26 :: 		OPTION_REG = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;aula044.c,27 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, 7
;aula044.c,28 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, 6
;aula044.c,29 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, 5
;aula044.c,30 :: 		ADON_bit = 1;
	BSF        ADON_bit+0, 0
;aula044.c,31 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;aula044.c,32 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;aula044.c,33 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;aula044.c,34 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;aula044.c,36 :: 		duty = 16; // duty-cycle 50%
	MOVLW      16
	MOVWF      _duty+0
;aula044.c,54 :: 		while(1){
L_main0:
;aula044.c,56 :: 		ADC = (Adc_Read(0))/64;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      6
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main5:
	BTFSC      STATUS+0, 2
	GOTO       L__main6
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main5
L__main6:
	MOVF       R2+0, 0
	MOVWF      _ADC+0
	MOVF       R2+1, 0
	MOVWF      _ADC+1
;aula044.c,67 :: 		duty = ADC + 16; // soma 16 ao ADC (mapeamento)
	MOVLW      16
	ADDWF      R2+0, 0
	MOVWF      _duty+0
;aula044.c,71 :: 		}
	GOTO       L_main0
;aula044.c,73 :: 		}
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;aula044.c,76 :: 		void interrupt(){
;aula044.c,78 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt2
;aula044.c,79 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, 2
;aula044.c,80 :: 		if(servo1){
	BTFSS      RC0_bit+0, 0
	GOTO       L_interrupt3
;aula044.c,81 :: 		TMR0 = duty;
	MOVF       _duty+0, 0
	MOVWF      TMR0+0
;aula044.c,82 :: 		servo1 = 0;
	BCF        RC0_bit+0, 0
;aula044.c,83 :: 		} else {
	GOTO       L_interrupt4
L_interrupt3:
;aula044.c,84 :: 		TMR0 = 255 - duty;
	MOVF       _duty+0, 0
	SUBLW      255
	MOVWF      TMR0+0
;aula044.c,85 :: 		servo1 = 1;
	BSF        RC0_bit+0, 0
;aula044.c,86 :: 		}
L_interrupt4:
;aula044.c,87 :: 		}
L_interrupt2:
;aula044.c,92 :: 		}
L__interrupt7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
