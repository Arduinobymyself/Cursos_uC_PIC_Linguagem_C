
_main:

;Termometro_Digital_LM35_Display7Seg.c,43 :: 		void main() {
;Termometro_Digital_LM35_Display7Seg.c,45 :: 		TRISD = 0b00000000;        // configura PORT D  como saída
	CLRF       TRISD+0
;Termometro_Digital_LM35_Display7Seg.c,46 :: 		PORTD = 0b00000000;        // inicia em nível baixo
	CLRF       PORTD+0
;Termometro_Digital_LM35_Display7Seg.c,47 :: 		TRISB = 0b00000011;        // RB0 e RB1 como entrada (botões)
	MOVLW      3
	MOVWF      TRISB+0
;Termometro_Digital_LM35_Display7Seg.c,48 :: 		PORTB = 0b00000011;        // RB0 e RB1 são botões com pull-up
	MOVLW      3
	MOVWF      PORTB+0
;Termometro_Digital_LM35_Display7Seg.c,49 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;Termometro_Digital_LM35_Display7Seg.c,50 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;Termometro_Digital_LM35_Display7Seg.c,52 :: 		TRISA1_bit = 1;            // AN1(RA1) configurado como entrada
	BSF        TRISA1_bit+0, 1
;Termometro_Digital_LM35_Display7Seg.c,53 :: 		ADC_Init();                // inicializa o ADC com configurações padrão (clock interno RC)
	CALL       _ADC_Init+0
;Termometro_Digital_LM35_Display7Seg.c,55 :: 		minima = 99;
	MOVLW      99
	MOVWF      _minima+0
;Termometro_Digital_LM35_Display7Seg.c,56 :: 		maxima = 0;
	CLRF       _maxima+0
;Termometro_Digital_LM35_Display7Seg.c,58 :: 		while(1){
L_main0:
;Termometro_Digital_LM35_Display7Seg.c,60 :: 		leituraAD = ADC_Read(1);   // lê o canal analógico 1; converte tensão para valor digital
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leituraAD+0
	MOVF       R0+1, 0
	MOVWF      _leituraAD+1
;Termometro_Digital_LM35_Display7Seg.c,63 :: 		temperatura = leituraAD*0.4887; // 1023 -> 500ºC; converte valor digital em temperatura
	CALL       _Word2Double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Byte+0
	MOVF       R0+0, 0
	MOVWF      _temperatura+0
;Termometro_Digital_LM35_Display7Seg.c,66 :: 		if(temperatura > 99) temperatura = 99;
	MOVF       R0+0, 0
	SUBLW      99
	BTFSC      STATUS+0, 0
	GOTO       L_main2
	MOVLW      99
	MOVWF      _temperatura+0
L_main2:
;Termometro_Digital_LM35_Display7Seg.c,67 :: 		if(temperatura < 0) temperatura = 0;
	MOVLW      0
	SUBWF      _temperatura+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	CLRF       _temperatura+0
L_main3:
;Termometro_Digital_LM35_Display7Seg.c,70 :: 		if(temperatura > maxima) maxima = temperatura;
	MOVF       _temperatura+0, 0
	SUBWF      _maxima+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVF       _temperatura+0, 0
	MOVWF      _maxima+0
L_main4:
;Termometro_Digital_LM35_Display7Seg.c,71 :: 		if(minima > temperatura) minima = temperatura;
	MOVF       _minima+0, 0
	SUBWF      _temperatura+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVF       _temperatura+0, 0
	MOVWF      _minima+0
L_main5:
;Termometro_Digital_LM35_Display7Seg.c,73 :: 		display(temperatura);  // chama a função que mostra a temperatura no display
	MOVF       _temperatura+0, 0
	MOVWF      FARG_display_temp+0
	CALL       _display+0
;Termometro_Digital_LM35_Display7Seg.c,76 :: 		if(Button(&PORTB, 0, 10, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;Termometro_Digital_LM35_Display7Seg.c,77 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Termometro_Digital_LM35_Display7Seg.c,78 :: 		}
L_main6:
;Termometro_Digital_LM35_Display7Seg.c,79 :: 		if(Button(&PORTB, 0, 10, 1) && flagB0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main9
L__main31:
;Termometro_Digital_LM35_Display7Seg.c,80 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Termometro_Digital_LM35_Display7Seg.c,81 :: 		while(1){
L_main10:
;Termometro_Digital_LM35_Display7Seg.c,82 :: 		display(maxima);
	MOVF       _maxima+0, 0
	MOVWF      FARG_display_temp+0
	CALL       _display+0
;Termometro_Digital_LM35_Display7Seg.c,83 :: 		if(Button(&PORTB, 0, 10, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;Termometro_Digital_LM35_Display7Seg.c,84 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Termometro_Digital_LM35_Display7Seg.c,85 :: 		}
L_main12:
;Termometro_Digital_LM35_Display7Seg.c,86 :: 		if(Button(&PORTB, 0, 10, 1) && flagB0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main15
L__main30:
;Termometro_Digital_LM35_Display7Seg.c,87 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Termometro_Digital_LM35_Display7Seg.c,88 :: 		break;
	GOTO       L_main11
;Termometro_Digital_LM35_Display7Seg.c,89 :: 		}
L_main15:
;Termometro_Digital_LM35_Display7Seg.c,91 :: 		}
	GOTO       L_main10
L_main11:
;Termometro_Digital_LM35_Display7Seg.c,92 :: 		}
L_main9:
;Termometro_Digital_LM35_Display7Seg.c,95 :: 		if(Button(&PORTB, 1, 10, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
;Termometro_Digital_LM35_Display7Seg.c,96 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Termometro_Digital_LM35_Display7Seg.c,97 :: 		}
L_main16:
;Termometro_Digital_LM35_Display7Seg.c,98 :: 		if(Button(&PORTB, 1, 10, 1) && flagB1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main19
L__main29:
;Termometro_Digital_LM35_Display7Seg.c,99 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Termometro_Digital_LM35_Display7Seg.c,100 :: 		while(1){
L_main20:
;Termometro_Digital_LM35_Display7Seg.c,101 :: 		display(minima);
	MOVF       _minima+0, 0
	MOVWF      FARG_display_temp+0
	CALL       _display+0
;Termometro_Digital_LM35_Display7Seg.c,102 :: 		if(Button(&PORTB, 1, 10, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main22
;Termometro_Digital_LM35_Display7Seg.c,103 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Termometro_Digital_LM35_Display7Seg.c,104 :: 		}
L_main22:
;Termometro_Digital_LM35_Display7Seg.c,105 :: 		if(Button(&PORTB, 1, 10, 1) && flagB1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main25
L__main28:
;Termometro_Digital_LM35_Display7Seg.c,106 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Termometro_Digital_LM35_Display7Seg.c,107 :: 		break;
	GOTO       L_main21
;Termometro_Digital_LM35_Display7Seg.c,108 :: 		}
L_main25:
;Termometro_Digital_LM35_Display7Seg.c,110 :: 		}
	GOTO       L_main20
L_main21:
;Termometro_Digital_LM35_Display7Seg.c,111 :: 		}
L_main19:
;Termometro_Digital_LM35_Display7Seg.c,113 :: 		}
	GOTO       L_main0
;Termometro_Digital_LM35_Display7Seg.c,115 :: 		}
	GOTO       $+0
; end of _main

_display:

;Termometro_Digital_LM35_Display7Seg.c,119 :: 		void display(unsigned char temp){
;Termometro_Digital_LM35_Display7Seg.c,123 :: 		dezena = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_temp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
;Termometro_Digital_LM35_Display7Seg.c,124 :: 		RC4_bit = 1;
	BSF        RC4_bit+0, 4
;Termometro_Digital_LM35_Display7Seg.c,125 :: 		PORTD = digitos[dezena];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Termometro_Digital_LM35_Display7Seg.c,126 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_display26:
	DECFSZ     R13+0, 1
	GOTO       L_display26
	DECFSZ     R12+0, 1
	GOTO       L_display26
	NOP
;Termometro_Digital_LM35_Display7Seg.c,127 :: 		RC4_bit = 0;
	BCF        RC4_bit+0, 4
;Termometro_Digital_LM35_Display7Seg.c,128 :: 		PORTD = 0;
	CLRF       PORTD+0
;Termometro_Digital_LM35_Display7Seg.c,130 :: 		unidade = temp%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_temp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Termometro_Digital_LM35_Display7Seg.c,131 :: 		RC5_bit = 1;
	BSF        RC5_bit+0, 5
;Termometro_Digital_LM35_Display7Seg.c,132 :: 		PORTD = digitos[unidade];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Termometro_Digital_LM35_Display7Seg.c,133 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_display27:
	DECFSZ     R13+0, 1
	GOTO       L_display27
	DECFSZ     R12+0, 1
	GOTO       L_display27
	NOP
;Termometro_Digital_LM35_Display7Seg.c,134 :: 		RC5_bit = 0;
	BCF        RC5_bit+0, 5
;Termometro_Digital_LM35_Display7Seg.c,135 :: 		PORTD = 0;
	CLRF       PORTD+0
;Termometro_Digital_LM35_Display7Seg.c,137 :: 		}
	RETURN
; end of _display
