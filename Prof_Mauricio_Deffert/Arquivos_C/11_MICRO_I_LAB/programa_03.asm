
_main:

;programa_03.c,39 :: 		void main() {
;programa_03.c,41 :: 		config_mcu();
	CALL       _config_mcu+0
;programa_03.c,42 :: 		config_interrupt();
	CALL       _config_interrupt+0
;programa_03.c,43 :: 		config_timer();
	CALL       _config_timer+0
;programa_03.c,45 :: 		while(1){
L_main0:
;programa_03.c,47 :: 		if(num == 100) num = 0;
	MOVLW      0
	XORWF      _num+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      100
	XORWF      _num+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	CLRF       _num+0
	CLRF       _num+1
L_main2:
;programa_03.c,48 :: 		display_unidade();
	CALL       _display_unidade+0
;programa_03.c,49 :: 		display_dezena();
	CALL       _display_dezena+0
;programa_03.c,51 :: 		}
	GOTO       L_main0
;programa_03.c,53 :: 		}
	GOTO       $+0
; end of _main

_config_mcu:

;programa_03.c,57 :: 		void config_mcu(){
;programa_03.c,59 :: 		ADCON1 = 7; // entradas nanalógicas desabilitadas
	MOVLW      7
	MOVWF      ADCON1+0
;programa_03.c,60 :: 		CMCON = 7;  // comparadores desabilitados
	MOVLW      7
	MOVWF      CMCON+0
;programa_03.c,62 :: 		TRISD = 0;  // PORT D como saída digital
	CLRF       TRISD+0
;programa_03.c,63 :: 		PORTD = 0;  // PORT D iniciaem nível baixo
	CLRF       PORTD+0
;programa_03.c,64 :: 		TRISC = 0;  // PORT C como saída digital
	CLRF       TRISC+0
;programa_03.c,65 :: 		PORTC = 0;  // PORT C iniciaem nível baixo
	CLRF       PORTC+0
;programa_03.c,67 :: 		}
	RETURN
; end of _config_mcu

_config_interrupt:

;programa_03.c,69 :: 		void config_interrupt(){
;programa_03.c,71 :: 		INTCON.GIE = 1;    // habilita chave geral de interrupções
	BSF        INTCON+0, 7
;programa_03.c,72 :: 		INTCON.PEIE = 0;   // não necessário
	BCF        INTCON+0, 6
;programa_03.c,73 :: 		INTCON.TMR0IE = 1; // habilita interrupção por Timer 0
	BSF        INTCON+0, 5
;programa_03.c,75 :: 		}
	RETURN
; end of _config_interrupt

_config_timer:

;programa_03.c,77 :: 		void config_timer(){
;programa_03.c,79 :: 		OPTION_REG = 0b10000111;    // modo temporizador, prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;programa_03.c,80 :: 		TMR0 = 61;                  // carregamento do valor inicial do registrador
	MOVLW      61
	MOVWF      TMR0+0
;programa_03.c,81 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;programa_03.c,83 :: 		}
	RETURN
; end of _config_timer

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;programa_03.c,85 :: 		void interrupt(){
;programa_03.c,87 :: 		if(INTCON.TMR0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt3
;programa_03.c,88 :: 		contador++;
	INCF       _contador+0, 1
;programa_03.c,89 :: 		if(contador == 40){
	MOVF       _contador+0, 0
	XORLW      40
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
;programa_03.c,90 :: 		num++;
	INCF       _num+0, 1
	BTFSC      STATUS+0, 2
	INCF       _num+1, 1
;programa_03.c,91 :: 		contador = 0;
	CLRF       _contador+0
;programa_03.c,92 :: 		}
L_interrupt4:
;programa_03.c,93 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;programa_03.c,94 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;programa_03.c,95 :: 		}
L_interrupt3:
;programa_03.c,97 :: 		}
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_display_dezena:

;programa_03.c,99 :: 		void display_dezena(){
;programa_03.c,101 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;programa_03.c,102 :: 		dezena = num/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _dezena+0
	MOVF       R0+1, 0
	MOVWF      _dezena+1
;programa_03.c,103 :: 		PORTD = digitos[dezena];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_03.c,104 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display_dezena5:
	DECFSZ     R13+0, 1
	GOTO       L_display_dezena5
	DECFSZ     R12+0, 1
	GOTO       L_display_dezena5
	NOP
	NOP
;programa_03.c,105 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;programa_03.c,106 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_03.c,108 :: 		}
	RETURN
; end of _display_dezena

_display_unidade:

;programa_03.c,109 :: 		void display_unidade(){
;programa_03.c,111 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;programa_03.c,112 :: 		unidade = num%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _unidade+0
	MOVF       R0+1, 0
	MOVWF      _unidade+1
;programa_03.c,113 :: 		PORTD = digitos[unidade];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_03.c,114 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display_unidade6:
	DECFSZ     R13+0, 1
	GOTO       L_display_unidade6
	DECFSZ     R12+0, 1
	GOTO       L_display_unidade6
	NOP
	NOP
;programa_03.c,115 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;programa_03.c,116 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_03.c,118 :: 		}
	RETURN
; end of _display_unidade
