
_main:

;Controle_Luminosidade_PWM.c,43 :: 		void main() {
;Controle_Luminosidade_PWM.c,45 :: 		TRISD = 0b00000000;        // configura PORT D  como saída
	CLRF       TRISD+0
;Controle_Luminosidade_PWM.c,46 :: 		PORTD = 0b00000000;        // inicia em nível baixo
	CLRF       PORTD+0
;Controle_Luminosidade_PWM.c,47 :: 		TRISB = 0b00000011;        // RB0 e RB1 como entrada (botões)
	MOVLW      3
	MOVWF      TRISB+0
;Controle_Luminosidade_PWM.c,48 :: 		PORTB = 0b00000011;        // RB0 e RB1 são botões com pull-up
	MOVLW      3
	MOVWF      PORTB+0
;Controle_Luminosidade_PWM.c,49 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;Controle_Luminosidade_PWM.c,50 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;Controle_Luminosidade_PWM.c,52 :: 		TRISA0_bit = 1;            // AN0(RA0) configurado como entrada
	BSF        TRISA0_bit+0, 0
;Controle_Luminosidade_PWM.c,53 :: 		ADC_Init();                // inicializa o ADC com configurações padrão (clock interno RC)
	CALL       _ADC_Init+0
;Controle_Luminosidade_PWM.c,54 :: 		PWM1_Init(500);            // inicializa o módulo PWM em 500Hz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Controle_Luminosidade_PWM.c,55 :: 		PWM1_Start();              // inicia o PWM
	CALL       _PWM1_Start+0
;Controle_Luminosidade_PWM.c,58 :: 		minima = 99;
	MOVLW      99
	MOVWF      _minima+0
;Controle_Luminosidade_PWM.c,59 :: 		maxima = 0;
	CLRF       _maxima+0
;Controle_Luminosidade_PWM.c,61 :: 		while(1){
L_main0:
;Controle_Luminosidade_PWM.c,63 :: 		leituraAD = ADC_Read(0);   // lê o canal analógico 1; converte tensão para valor digital
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leituraAD+0
	MOVF       R0+1, 0
	MOVWF      _leituraAD+1
;Controle_Luminosidade_PWM.c,66 :: 		luminosidade = leituraAD*0.0978; // 1023 -> 100% ; converte valor digital intensidade luminosa
	CALL       _Word2Double+0
	MOVLW      94
	MOVWF      R4+0
	MOVLW      75
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Byte+0
	MOVF       R0+0, 0
	MOVWF      _luminosidade+0
;Controle_Luminosidade_PWM.c,67 :: 		PWM1_Set_Duty(leituraAD/4);      // seta o duty-cycle de acordo com a intensidade luminosa
	MOVF       _leituraAD+0, 0
	MOVWF      R0+0
	MOVF       _leituraAD+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Controle_Luminosidade_PWM.c,71 :: 		if(luminosidade > 99) luminosidade = 99;
	MOVF       _luminosidade+0, 0
	SUBLW      99
	BTFSC      STATUS+0, 0
	GOTO       L_main2
	MOVLW      99
	MOVWF      _luminosidade+0
L_main2:
;Controle_Luminosidade_PWM.c,72 :: 		if(luminosidade < 0) luminosidade = 0;
	MOVLW      0
	SUBWF      _luminosidade+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	CLRF       _luminosidade+0
L_main3:
;Controle_Luminosidade_PWM.c,75 :: 		if(luminosidade > maxima) maxima = luminosidade;
	MOVF       _luminosidade+0, 0
	SUBWF      _maxima+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVF       _luminosidade+0, 0
	MOVWF      _maxima+0
L_main4:
;Controle_Luminosidade_PWM.c,76 :: 		if(luminosidade < minima) minima = luminosidade;
	MOVF       _minima+0, 0
	SUBWF      _luminosidade+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVF       _luminosidade+0, 0
	MOVWF      _minima+0
L_main5:
;Controle_Luminosidade_PWM.c,78 :: 		display(luminosidade);  // chama a função que mostra a luminosidade no display
	MOVF       _luminosidade+0, 0
	MOVWF      FARG_display_lux+0
	CALL       _display+0
;Controle_Luminosidade_PWM.c,81 :: 		if(Button(&PORTB, 0, 10, 0)){
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
;Controle_Luminosidade_PWM.c,82 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Luminosidade_PWM.c,83 :: 		}
L_main6:
;Controle_Luminosidade_PWM.c,84 :: 		if(Button(&PORTB, 0, 10, 1) && flagB0){
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
;Controle_Luminosidade_PWM.c,85 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Luminosidade_PWM.c,86 :: 		while(1){
L_main10:
;Controle_Luminosidade_PWM.c,87 :: 		display(maxima);
	MOVF       _maxima+0, 0
	MOVWF      FARG_display_lux+0
	CALL       _display+0
;Controle_Luminosidade_PWM.c,88 :: 		if(Button(&PORTB, 0, 10, 0)){
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
;Controle_Luminosidade_PWM.c,89 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Luminosidade_PWM.c,90 :: 		}
L_main12:
;Controle_Luminosidade_PWM.c,91 :: 		if(Button(&PORTB, 0, 10, 1) && flagB0){
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
;Controle_Luminosidade_PWM.c,92 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;Controle_Luminosidade_PWM.c,93 :: 		break;
	GOTO       L_main11
;Controle_Luminosidade_PWM.c,94 :: 		}
L_main15:
;Controle_Luminosidade_PWM.c,96 :: 		}
	GOTO       L_main10
L_main11:
;Controle_Luminosidade_PWM.c,97 :: 		}
L_main9:
;Controle_Luminosidade_PWM.c,100 :: 		if(Button(&PORTB, 1, 10, 0)){
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
;Controle_Luminosidade_PWM.c,101 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Luminosidade_PWM.c,102 :: 		}
L_main16:
;Controle_Luminosidade_PWM.c,103 :: 		if(Button(&PORTB, 1, 10, 1) && flagB1){
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
;Controle_Luminosidade_PWM.c,104 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Luminosidade_PWM.c,105 :: 		while(1){
L_main20:
;Controle_Luminosidade_PWM.c,106 :: 		display(minima);
	MOVF       _minima+0, 0
	MOVWF      FARG_display_lux+0
	CALL       _display+0
;Controle_Luminosidade_PWM.c,107 :: 		if(Button(&PORTB, 1, 10, 0)){
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
;Controle_Luminosidade_PWM.c,108 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Luminosidade_PWM.c,109 :: 		}
L_main22:
;Controle_Luminosidade_PWM.c,110 :: 		if(Button(&PORTB, 1, 10, 1) && flagB1){
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
;Controle_Luminosidade_PWM.c,111 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;Controle_Luminosidade_PWM.c,112 :: 		break;
	GOTO       L_main21
;Controle_Luminosidade_PWM.c,113 :: 		}
L_main25:
;Controle_Luminosidade_PWM.c,115 :: 		}
	GOTO       L_main20
L_main21:
;Controle_Luminosidade_PWM.c,116 :: 		}
L_main19:
;Controle_Luminosidade_PWM.c,118 :: 		}
	GOTO       L_main0
;Controle_Luminosidade_PWM.c,120 :: 		}
	GOTO       $+0
; end of _main

_display:

;Controle_Luminosidade_PWM.c,124 :: 		void display(unsigned char lux){
;Controle_Luminosidade_PWM.c,128 :: 		dezena = lux/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_lux+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
;Controle_Luminosidade_PWM.c,129 :: 		RC6_bit = 1;
	BSF        RC6_bit+0, 6
;Controle_Luminosidade_PWM.c,130 :: 		PORTD = digitos[dezena];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Controle_Luminosidade_PWM.c,131 :: 		delay_ms(2);
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
;Controle_Luminosidade_PWM.c,132 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, 6
;Controle_Luminosidade_PWM.c,133 :: 		PORTD = 0;
	CLRF       PORTD+0
;Controle_Luminosidade_PWM.c,135 :: 		unidade = lux%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_lux+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Controle_Luminosidade_PWM.c,136 :: 		RC7_bit = 1;
	BSF        RC7_bit+0, 7
;Controle_Luminosidade_PWM.c,137 :: 		PORTD = digitos[unidade];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Controle_Luminosidade_PWM.c,138 :: 		delay_ms(2);
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
;Controle_Luminosidade_PWM.c,139 :: 		RC7_bit = 0;
	BCF        RC7_bit+0, 7
;Controle_Luminosidade_PWM.c,140 :: 		PORTD = 0;
	CLRF       PORTD+0
;Controle_Luminosidade_PWM.c,142 :: 		}
	RETURN
; end of _display
