
_main:

;Display_7_Segmentos_Multiplexado.c,19 :: 		void main() {
;Display_7_Segmentos_Multiplexado.c,20 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Display_7_Segmentos_Multiplexado.c,21 :: 		ADCON0 = 0;
	CLRF       ADCON0+0
;Display_7_Segmentos_Multiplexado.c,22 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Display_7_Segmentos_Multiplexado.c,23 :: 		TRISB = 0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;Display_7_Segmentos_Multiplexado.c,24 :: 		TRISD = 0;
	CLRF       TRISD+0
;Display_7_Segmentos_Multiplexado.c,25 :: 		PORTD = 0;
	CLRF       PORTD+0
;Display_7_Segmentos_Multiplexado.c,26 :: 		TRISA = 0;
	CLRF       TRISA+0
;Display_7_Segmentos_Multiplexado.c,27 :: 		PORTA = 0;
	CLRF       PORTA+0
;Display_7_Segmentos_Multiplexado.c,28 :: 		TRISC.RC1 = 0;
	BCF        TRISC+0, 1
;Display_7_Segmentos_Multiplexado.c,29 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;Display_7_Segmentos_Multiplexado.c,34 :: 		while(1){
L_main0:
;Display_7_Segmentos_Multiplexado.c,36 :: 		if(!B0){ // B0 incrementa contador
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;Display_7_Segmentos_Multiplexado.c,37 :: 		if(contador < 9999){
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      39
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      15
	SUBWF      _contador+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Display_7_Segmentos_Multiplexado.c,38 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Display_7_Segmentos_Multiplexado.c,39 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,40 :: 		} else {
	GOTO       L_main4
L_main3:
;Display_7_Segmentos_Multiplexado.c,41 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;Display_7_Segmentos_Multiplexado.c,42 :: 		buzzer(contador);
	CLRF       FARG_buzzer_xBuzzer+0
	CLRF       FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,43 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,44 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,45 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,46 :: 		}
L_main4:
;Display_7_Segmentos_Multiplexado.c,47 :: 		}
L_main2:
;Display_7_Segmentos_Multiplexado.c,48 :: 		if(!B1){ // B0 incrementa contador
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;Display_7_Segmentos_Multiplexado.c,49 :: 		if(contador > 0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _contador+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVF       _contador+0, 0
	SUBLW      0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Display_7_Segmentos_Multiplexado.c,50 :: 		contador--;
	MOVLW      1
	SUBWF      _contador+0, 1
	BTFSS      STATUS+0, 0
	DECF       _contador+1, 1
;Display_7_Segmentos_Multiplexado.c,51 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,52 :: 		} else {
	GOTO       L_main7
L_main6:
;Display_7_Segmentos_Multiplexado.c,53 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,54 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,55 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,56 :: 		buzzer(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_buzzer_xBuzzer+0
	MOVF       _contador+1, 0
	MOVWF      FARG_buzzer_xBuzzer+1
	CALL       _buzzer+0
;Display_7_Segmentos_Multiplexado.c,57 :: 		}
L_main7:
;Display_7_Segmentos_Multiplexado.c,58 :: 		}
L_main5:
;Display_7_Segmentos_Multiplexado.c,59 :: 		muxDisplay(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_muxDisplay_valorNumerico+0
	MOVF       _contador+1, 0
	MOVWF      FARG_muxDisplay_valorNumerico+1
	CALL       _muxDisplay+0
;Display_7_Segmentos_Multiplexado.c,64 :: 		}
	GOTO       L_main0
;Display_7_Segmentos_Multiplexado.c,66 :: 		}
	GOTO       $+0
; end of _main

_muxDisplay:

;Display_7_Segmentos_Multiplexado.c,68 :: 		void muxDisplay(int valorNumerico){
;Display_7_Segmentos_Multiplexado.c,70 :: 		valor = valorNumerico/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_muxDisplay_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_muxDisplay_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;Display_7_Segmentos_Multiplexado.c,71 :: 		PORTD = numero[valor];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_Multiplexado.c,72 :: 		PORTA = display[1];
	MOVF       _display+2, 0
	MOVWF      PORTA+0
;Display_7_Segmentos_Multiplexado.c,73 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_muxDisplay8:
	DECFSZ     R13+0, 1
	GOTO       L_muxDisplay8
	DECFSZ     R12+0, 1
	GOTO       L_muxDisplay8
	NOP
	NOP
;Display_7_Segmentos_Multiplexado.c,76 :: 		valor = valorNumerico/100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_muxDisplay_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_muxDisplay_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;Display_7_Segmentos_Multiplexado.c,77 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _resto+0
	MOVF       R0+1, 0
	MOVWF      _resto+1
;Display_7_Segmentos_Multiplexado.c,78 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_Multiplexado.c,79 :: 		PORTA = display[2];
	MOVF       _display+4, 0
	MOVWF      PORTA+0
;Display_7_Segmentos_Multiplexado.c,80 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_muxDisplay9:
	DECFSZ     R13+0, 1
	GOTO       L_muxDisplay9
	DECFSZ     R12+0, 1
	GOTO       L_muxDisplay9
	NOP
	NOP
;Display_7_Segmentos_Multiplexado.c,83 :: 		valor = valorNumerico/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_muxDisplay_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_muxDisplay_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;Display_7_Segmentos_Multiplexado.c,84 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _resto+0
	MOVF       R0+1, 0
	MOVWF      _resto+1
;Display_7_Segmentos_Multiplexado.c,85 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_Multiplexado.c,86 :: 		PORTA = display[3];
	MOVF       _display+6, 0
	MOVWF      PORTA+0
;Display_7_Segmentos_Multiplexado.c,87 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_muxDisplay10:
	DECFSZ     R13+0, 1
	GOTO       L_muxDisplay10
	DECFSZ     R12+0, 1
	GOTO       L_muxDisplay10
	NOP
	NOP
;Display_7_Segmentos_Multiplexado.c,90 :: 		valor = valorNumerico/1;
	MOVF       FARG_muxDisplay_valorNumerico+0, 0
	MOVWF      _valor+0
	MOVF       FARG_muxDisplay_valorNumerico+1, 0
	MOVWF      _valor+1
;Display_7_Segmentos_Multiplexado.c,91 :: 		resto = valor % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_muxDisplay_valorNumerico+0, 0
	MOVWF      R0+0
	MOVF       FARG_muxDisplay_valorNumerico+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _resto+0
	MOVF       R0+1, 0
	MOVWF      _resto+1
;Display_7_Segmentos_Multiplexado.c,92 :: 		PORTD = numero[resto];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Display_7_Segmentos_Multiplexado.c,93 :: 		PORTA = display[4];
	MOVF       _display+8, 0
	MOVWF      PORTA+0
;Display_7_Segmentos_Multiplexado.c,94 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_muxDisplay11:
	DECFSZ     R13+0, 1
	GOTO       L_muxDisplay11
	DECFSZ     R12+0, 1
	GOTO       L_muxDisplay11
	NOP
	NOP
;Display_7_Segmentos_Multiplexado.c,95 :: 		}
	RETURN
; end of _muxDisplay

_buzzer:

;Display_7_Segmentos_Multiplexado.c,97 :: 		void buzzer(int xBuzzer){
;Display_7_Segmentos_Multiplexado.c,99 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;Display_7_Segmentos_Multiplexado.c,100 :: 		for(i = 0; i < 150; i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer12:
	MOVLW      128
	XORWF      buzzer_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer18
	MOVLW      150
	SUBWF      buzzer_i_L0+0, 0
L__buzzer18:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer13
;Display_7_Segmentos_Multiplexado.c,101 :: 		if(i > 75) PORTC.RC1 = 0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      buzzer_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer19
	MOVF       buzzer_i_L0+0, 0
	SUBLW      75
L__buzzer19:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer15
	BCF        PORTC+0, 1
L_buzzer15:
;Display_7_Segmentos_Multiplexado.c,102 :: 		muxDisplay(xBuzzer);
	MOVF       FARG_buzzer_xBuzzer+0, 0
	MOVWF      FARG_muxDisplay_valorNumerico+0
	MOVF       FARG_buzzer_xBuzzer+1, 0
	MOVWF      FARG_muxDisplay_valorNumerico+1
	CALL       _muxDisplay+0
;Display_7_Segmentos_Multiplexado.c,100 :: 		for(i = 0; i < 150; i++){
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;Display_7_Segmentos_Multiplexado.c,103 :: 		}
	GOTO       L_buzzer12
L_buzzer13:
;Display_7_Segmentos_Multiplexado.c,104 :: 		}
	RETURN
; end of _buzzer
