
_main:

;Efeitos.c,28 :: 		void main() {
;Efeitos.c,30 :: 		int i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	MOVLW      255
	MOVWF      main_control_L0+0
	MOVLW      0
	MOVWF      main_control_L0+1
;Efeitos.c,33 :: 		CMCON = 0x07;  // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;Efeitos.c,34 :: 		ADCON0 = 0x00; // conversor AD desabilitado
	CLRF       ADCON0+0
;Efeitos.c,35 :: 		ADCON1 = 0x07; // todos os canais como digital
	MOVLW      7
	MOVWF      ADCON1+0
;Efeitos.c,36 :: 		TRISC = 0x00;  // configura todo o PORT C  como saída
	CLRF       TRISC+0
;Efeitos.c,37 :: 		PORTC = 0X00;  // inicializa o PORT C
	CLRF       PORTC+0
;Efeitos.c,38 :: 		TRISD = 0x00;  // configura todo o PORT D como saída
	CLRF       TRISD+0
;Efeitos.c,39 :: 		PORTD = 0x00;  // inicializa o PORT D
	CLRF       PORTD+0
;Efeitos.c,40 :: 		TRISB = 0x07;  // configura RB0 a RB2 como entrada digital
	MOVLW      7
	MOVWF      TRISB+0
;Efeitos.c,41 :: 		PORTB = 0X00;  // Iinicializa o PORT B
	CLRF       PORTB+0
;Efeitos.c,44 :: 		while(1)
L_main0:
;Efeitos.c,46 :: 		if(PORTB.RB0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;Efeitos.c,47 :: 		efeito = 1;
	MOVLW      1
	MOVWF      _efeito+0
	MOVLW      0
	MOVWF      _efeito+1
;Efeitos.c,48 :: 		bip();
	CALL       _bip+0
;Efeitos.c,49 :: 		}
L_main2:
;Efeitos.c,51 :: 		if(PORTB.RB1 == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;Efeitos.c,52 :: 		efeito = 2;
	MOVLW      2
	MOVWF      _efeito+0
	MOVLW      0
	MOVWF      _efeito+1
;Efeitos.c,53 :: 		bip();
	CALL       _bip+0
;Efeitos.c,54 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Efeitos.c,55 :: 		bip();
	CALL       _bip+0
;Efeitos.c,56 :: 		}
L_main3:
;Efeitos.c,58 :: 		if(PORTB.RB2 == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main5
;Efeitos.c,59 :: 		switch(efeito){
	GOTO       L_main6
;Efeitos.c,60 :: 		case 1:
L_main8:
;Efeitos.c,61 :: 		PORTD = control;
	MOVF       main_control_L0+0, 0
	MOVWF      PORTD+0
;Efeitos.c,62 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Efeitos.c,63 :: 		for(i = 0; i < 8; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main10:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      8
	SUBWF      main_i_L0+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;Efeitos.c,64 :: 		control = control << 1;
	MOVF       main_control_L0+0, 0
	MOVWF      R0+0
	MOVF       main_control_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      main_control_L0+0
	MOVF       R0+1, 0
	MOVWF      main_control_L0+1
;Efeitos.c,65 :: 		PORTD = control;
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Efeitos.c,66 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Efeitos.c,63 :: 		for(i = 0; i < 8; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Efeitos.c,67 :: 		}
	GOTO       L_main10
L_main11:
;Efeitos.c,68 :: 		control = 255;
	MOVLW      255
	MOVWF      main_control_L0+0
	CLRF       main_control_L0+1
;Efeitos.c,69 :: 		efeito = 0;
	CLRF       _efeito+0
	CLRF       _efeito+1
;Efeitos.c,70 :: 		break;
	GOTO       L_main7
;Efeitos.c,71 :: 		case 2:
L_main14:
;Efeitos.c,72 :: 		PORTD = control;
	MOVF       main_control_L0+0, 0
	MOVWF      PORTD+0
;Efeitos.c,73 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;Efeitos.c,74 :: 		for(i = 0; i < 8; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main16:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      8
	SUBWF      main_i_L0+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;Efeitos.c,75 :: 		control = control >> 1;
	MOVF       main_control_L0+0, 0
	MOVWF      R0+0
	MOVF       main_control_L0+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      main_control_L0+0
	MOVF       R0+1, 0
	MOVWF      main_control_L0+1
;Efeitos.c,76 :: 		PORTD = control;
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Efeitos.c,77 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;Efeitos.c,74 :: 		for(i = 0; i < 8; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Efeitos.c,78 :: 		}
	GOTO       L_main16
L_main17:
;Efeitos.c,79 :: 		control = 255;
	MOVLW      255
	MOVWF      main_control_L0+0
	CLRF       main_control_L0+1
;Efeitos.c,80 :: 		efeito = 0;
	CLRF       _efeito+0
	CLRF       _efeito+1
;Efeitos.c,81 :: 		break;
	GOTO       L_main7
;Efeitos.c,82 :: 		case 0:
L_main20:
;Efeitos.c,83 :: 		efeito = 0;
	CLRF       _efeito+0
	CLRF       _efeito+1
;Efeitos.c,84 :: 		erro();
	CALL       _erro+0
;Efeitos.c,85 :: 		break;
	GOTO       L_main7
;Efeitos.c,86 :: 		}
L_main6:
	MOVLW      0
	XORWF      _efeito+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      1
	XORWF      _efeito+0, 0
L__main29:
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVLW      0
	XORWF      _efeito+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      2
	XORWF      _efeito+0, 0
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _efeito+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      0
	XORWF      _efeito+0, 0
L__main31:
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L_main7:
;Efeitos.c,87 :: 		}
L_main5:
;Efeitos.c,91 :: 		}
	GOTO       L_main0
;Efeitos.c,93 :: 		}
	GOTO       $+0
; end of _main

_bip:

;Efeitos.c,97 :: 		void bip(){
;Efeitos.c,98 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;Efeitos.c,99 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_bip21:
	DECFSZ     R13+0, 1
	GOTO       L_bip21
	DECFSZ     R12+0, 1
	GOTO       L_bip21
	DECFSZ     R11+0, 1
	GOTO       L_bip21
	NOP
	NOP
;Efeitos.c,100 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;Efeitos.c,101 :: 		}
	RETURN
; end of _bip

_erro:

;Efeitos.c,102 :: 		void erro(){
;Efeitos.c,104 :: 		for(i = 0; i < 5; i++){
	CLRF       R1+0
	CLRF       R1+1
L_erro22:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__erro32
	MOVLW      5
	SUBWF      R1+0, 0
L__erro32:
	BTFSC      STATUS+0, 0
	GOTO       L_erro23
;Efeitos.c,105 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;Efeitos.c,106 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_erro25:
	DECFSZ     R13+0, 1
	GOTO       L_erro25
	DECFSZ     R12+0, 1
	GOTO       L_erro25
	DECFSZ     R11+0, 1
	GOTO       L_erro25
	NOP
	NOP
;Efeitos.c,107 :: 		PORTC.RC1 =0;
	BCF        PORTC+0, 1
;Efeitos.c,108 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_erro26:
	DECFSZ     R13+0, 1
	GOTO       L_erro26
	DECFSZ     R12+0, 1
	GOTO       L_erro26
	DECFSZ     R11+0, 1
	GOTO       L_erro26
	NOP
	NOP
;Efeitos.c,104 :: 		for(i = 0; i < 5; i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Efeitos.c,109 :: 		}
	GOTO       L_erro22
L_erro23:
;Efeitos.c,110 :: 		}
	RETURN
; end of _erro
