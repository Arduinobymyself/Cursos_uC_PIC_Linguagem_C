
_main:

;programa_04_ContagemRegressiva.c,57 :: 		void main() {
;programa_04_ContagemRegressiva.c,59 :: 		config_mcu();
	CALL       _config_mcu+0
;programa_04_ContagemRegressiva.c,60 :: 		config_interrupt();
	CALL       _config_interrupt+0
;programa_04_ContagemRegressiva.c,61 :: 		config_timer();
	CALL       _config_timer+0
;programa_04_ContagemRegressiva.c,64 :: 		clearFlag = 1;
	BSF        _clearFlag+0, BitPos(_clearFlag+0)
;programa_04_ContagemRegressiva.c,65 :: 		INTCON.TMR0IE = 0;
	BCF        INTCON+0, 5
;programa_04_ContagemRegressiva.c,66 :: 		num = 10;
	MOVLW      10
	MOVWF      _num+0
;programa_04_ContagemRegressiva.c,68 :: 		while(1){
L_main0:
;programa_04_ContagemRegressiva.c,70 :: 		clear();
	CALL       _clear+0
;programa_04_ContagemRegressiva.c,71 :: 		start();
	CALL       _start+0
;programa_04_ContagemRegressiva.c,72 :: 		pause();
	CALL       _pause+0
;programa_04_ContagemRegressiva.c,74 :: 		if(B0 && flagB0 == 0){ // incrementa +1
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	BTFSC      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main4
L__main43:
;programa_04_ContagemRegressiva.c,75 :: 		flagB0 = 1;
	BSF        _flagB0+0, BitPos(_flagB0+0)
;programa_04_ContagemRegressiva.c,76 :: 		}
L_main4:
;programa_04_ContagemRegressiva.c,77 :: 		if(!B0 && flagB0 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	BTFSS      _flagB0+0, BitPos(_flagB0+0)
	GOTO       L_main7
L__main42:
;programa_04_ContagemRegressiva.c,78 :: 		flagB0 = 0;
	BCF        _flagB0+0, BitPos(_flagB0+0)
;programa_04_ContagemRegressiva.c,79 :: 		if(pauseFlag) num++;
	BTFSS      _pauseFlag+0, BitPos(_pauseFlag+0)
	GOTO       L_main8
	INCF       _num+0, 1
L_main8:
;programa_04_ContagemRegressiva.c,80 :: 		if(num == 99) num = 0;
	MOVF       _num+0, 0
	XORLW      99
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	CLRF       _num+0
L_main9:
;programa_04_ContagemRegressiva.c,81 :: 		}
L_main7:
;programa_04_ContagemRegressiva.c,83 :: 		if(B1 && flagB1 == 0){ // inicia contagem
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	BTFSC      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main12
L__main41:
;programa_04_ContagemRegressiva.c,84 :: 		flagB1 = 1;
	BSF        _flagB1+0, BitPos(_flagB1+0)
;programa_04_ContagemRegressiva.c,85 :: 		}
L_main12:
;programa_04_ContagemRegressiva.c,86 :: 		if(!B1 && flagB1 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	BTFSS      _flagB1+0, BitPos(_flagB1+0)
	GOTO       L_main15
L__main40:
;programa_04_ContagemRegressiva.c,87 :: 		flagB1 = 0;
	BCF        _flagB1+0, BitPos(_flagB1+0)
;programa_04_ContagemRegressiva.c,88 :: 		startFlag = 1;
	BSF        _startFlag+0, BitPos(_startFlag+0)
;programa_04_ContagemRegressiva.c,89 :: 		pauseFlag = 0;
	BCF        _pauseFlag+0, BitPos(_pauseFlag+0)
;programa_04_ContagemRegressiva.c,90 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;programa_04_ContagemRegressiva.c,91 :: 		}
L_main15:
;programa_04_ContagemRegressiva.c,93 :: 		if(B2 && flagB2 == 0){ // pausa e continua
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	BTFSC      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main18
L__main39:
;programa_04_ContagemRegressiva.c,94 :: 		flagB2 = 1;
	BSF        _flagB2+0, BitPos(_flagB2+0)
;programa_04_ContagemRegressiva.c,95 :: 		}
L_main18:
;programa_04_ContagemRegressiva.c,96 :: 		if(!B2 && flagB2 == 1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main21
	BTFSS      _flagB2+0, BitPos(_flagB2+0)
	GOTO       L_main21
L__main38:
;programa_04_ContagemRegressiva.c,97 :: 		flagB2 = 0;
	BCF        _flagB2+0, BitPos(_flagB2+0)
;programa_04_ContagemRegressiva.c,98 :: 		startFlag = !startFlag;
	MOVLW
	XORWF      _startFlag+0, 1
;programa_04_ContagemRegressiva.c,99 :: 		pauseFlag = !pauseFlag;
	MOVLW
	XORWF      _pauseFlag+0, 1
;programa_04_ContagemRegressiva.c,100 :: 		INTCON.TMR0IE = !INTCON.TMR0IE;
	MOVLW      32
	XORWF      INTCON+0, 1
;programa_04_ContagemRegressiva.c,101 :: 		}
L_main21:
;programa_04_ContagemRegressiva.c,103 :: 		}
	GOTO       L_main0
;programa_04_ContagemRegressiva.c,105 :: 		}
	GOTO       $+0
; end of _main

_start:

;programa_04_ContagemRegressiva.c,109 :: 		void start(){
;programa_04_ContagemRegressiva.c,111 :: 		lastNum = num;
	MOVF       _num+0, 0
	MOVWF      _lastNum+0
;programa_04_ContagemRegressiva.c,113 :: 		if(startFlag && !pauseFlag){
	BTFSS      _startFlag+0, BitPos(_startFlag+0)
	GOTO       L_start24
	BTFSC      _pauseFlag+0, BitPos(_pauseFlag+0)
	GOTO       L_start24
L__start44:
;programa_04_ContagemRegressiva.c,114 :: 		if(num == 0) num = 0;
	MOVF       _num+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_start25
	CLRF       _num+0
L_start25:
;programa_04_ContagemRegressiva.c,115 :: 		display_unidade();
	CALL       _display_unidade+0
;programa_04_ContagemRegressiva.c,116 :: 		display_dezena();
	CALL       _display_dezena+0
;programa_04_ContagemRegressiva.c,117 :: 		}
L_start24:
;programa_04_ContagemRegressiva.c,119 :: 		}
	RETURN
; end of _start

_pause:

;programa_04_ContagemRegressiva.c,121 :: 		void pause(){
;programa_04_ContagemRegressiva.c,123 :: 		if(pauseFlag && !startFlag){
	BTFSS      _pauseFlag+0, BitPos(_pauseFlag+0)
	GOTO       L_pause28
	BTFSC      _startFlag+0, BitPos(_startFlag+0)
	GOTO       L_pause28
L__pause45:
;programa_04_ContagemRegressiva.c,124 :: 		num = lastNum;
	MOVF       _lastNum+0, 0
	MOVWF      _num+0
;programa_04_ContagemRegressiva.c,125 :: 		display_unidade();
	CALL       _display_unidade+0
;programa_04_ContagemRegressiva.c,126 :: 		display_dezena();
	CALL       _display_dezena+0
;programa_04_ContagemRegressiva.c,127 :: 		}
L_pause28:
;programa_04_ContagemRegressiva.c,129 :: 		}
	RETURN
; end of _pause

_clear:

;programa_04_ContagemRegressiva.c,131 :: 		void clear(){
;programa_04_ContagemRegressiva.c,133 :: 		if(clearFlag){
	BTFSS      _clearFlag+0, BitPos(_clearFlag+0)
	GOTO       L_clear29
;programa_04_ContagemRegressiva.c,134 :: 		display_unidade();
	CALL       _display_unidade+0
;programa_04_ContagemRegressiva.c,135 :: 		display_dezena();
	CALL       _display_dezena+0
;programa_04_ContagemRegressiva.c,136 :: 		}
L_clear29:
;programa_04_ContagemRegressiva.c,138 :: 		}
	RETURN
; end of _clear

_blink:

;programa_04_ContagemRegressiva.c,140 :: 		void blink(){
;programa_04_ContagemRegressiva.c,142 :: 		while(blinkFlag){
L_blink30:
	BTFSS      _blinkFlag+0, BitPos(_blinkFlag+0)
	GOTO       L_blink31
;programa_04_ContagemRegressiva.c,143 :: 		display_unidade();
	CALL       _display_unidade+0
;programa_04_ContagemRegressiva.c,144 :: 		display_dezena();
	CALL       _display_dezena+0
;programa_04_ContagemRegressiva.c,145 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_blink32:
	DECFSZ     R13+0, 1
	GOTO       L_blink32
	DECFSZ     R12+0, 1
	GOTO       L_blink32
	DECFSZ     R11+0, 1
	GOTO       L_blink32
	NOP
	NOP
;programa_04_ContagemRegressiva.c,146 :: 		}
	GOTO       L_blink30
L_blink31:
;programa_04_ContagemRegressiva.c,148 :: 		}
	RETURN
; end of _blink

_config_mcu:

;programa_04_ContagemRegressiva.c,150 :: 		void config_mcu(){
;programa_04_ContagemRegressiva.c,152 :: 		ADCON1 = 7; // entradas nanalógicas desabilitadas
	MOVLW      7
	MOVWF      ADCON1+0
;programa_04_ContagemRegressiva.c,153 :: 		CMCON = 7;  // comparadores desabilitados
	MOVLW      7
	MOVWF      CMCON+0
;programa_04_ContagemRegressiva.c,155 :: 		TRISD = 0;  // PORT D como saída digital
	CLRF       TRISD+0
;programa_04_ContagemRegressiva.c,156 :: 		PORTD = 0;  // PORT D iniciaem nível baixo
	CLRF       PORTD+0
;programa_04_ContagemRegressiva.c,157 :: 		TRISC = 0;  // PORT C como saída digital
	CLRF       TRISC+0
;programa_04_ContagemRegressiva.c,158 :: 		PORTC = 0;  // PORT C iniciaem nível baixo
	CLRF       PORTC+0
;programa_04_ContagemRegressiva.c,161 :: 		}
	RETURN
; end of _config_mcu

_config_interrupt:

;programa_04_ContagemRegressiva.c,163 :: 		void config_interrupt(){
;programa_04_ContagemRegressiva.c,165 :: 		INTCON.GIE = 1;    // habilita chave geral de interrupções
	BSF        INTCON+0, 7
;programa_04_ContagemRegressiva.c,166 :: 		INTCON.PEIE = 0;   // não necessário
	BCF        INTCON+0, 6
;programa_04_ContagemRegressiva.c,167 :: 		INTCON.TMR0IE = 1; // habilita interrupção por Timer 0
	BSF        INTCON+0, 5
;programa_04_ContagemRegressiva.c,169 :: 		}
	RETURN
; end of _config_interrupt

_config_timer:

;programa_04_ContagemRegressiva.c,171 :: 		void config_timer(){
;programa_04_ContagemRegressiva.c,173 :: 		OPTION_REG = 0b10000111;    // modo temporizador, prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;programa_04_ContagemRegressiva.c,174 :: 		TMR0 = 61;                  // carregamento do valor inicial do registrador
	MOVLW      61
	MOVWF      TMR0+0
;programa_04_ContagemRegressiva.c,175 :: 		INTCON.TMR0IF = 0;          // incializa o flag de estouro
	BCF        INTCON+0, 2
;programa_04_ContagemRegressiva.c,177 :: 		}
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

;programa_04_ContagemRegressiva.c,179 :: 		void interrupt(){
;programa_04_ContagemRegressiva.c,181 :: 		if(INTCON.TMR0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt33
;programa_04_ContagemRegressiva.c,182 :: 		contador++;
	INCF       _contador+0, 1
;programa_04_ContagemRegressiva.c,183 :: 		if(contador == 40){
	MOVF       _contador+0, 0
	XORLW      40
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt34
;programa_04_ContagemRegressiva.c,184 :: 		num--;
	DECF       _num+0, 1
;programa_04_ContagemRegressiva.c,185 :: 		if(num == 0){
	MOVF       _num+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt35
;programa_04_ContagemRegressiva.c,186 :: 		num = 0;
	CLRF       _num+0
;programa_04_ContagemRegressiva.c,187 :: 		blinkFlag = 1;
	BSF        _blinkFlag+0, BitPos(_blinkFlag+0)
;programa_04_ContagemRegressiva.c,188 :: 		INTCON.TMR0IE = 0;
	BCF        INTCON+0, 5
;programa_04_ContagemRegressiva.c,189 :: 		blink();
	CALL       _blink+0
;programa_04_ContagemRegressiva.c,190 :: 		}
L_interrupt35:
;programa_04_ContagemRegressiva.c,191 :: 		contador = 0;
	CLRF       _contador+0
;programa_04_ContagemRegressiva.c,192 :: 		}
L_interrupt34:
;programa_04_ContagemRegressiva.c,193 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;programa_04_ContagemRegressiva.c,194 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;programa_04_ContagemRegressiva.c,195 :: 		}
L_interrupt33:
;programa_04_ContagemRegressiva.c,197 :: 		}
L__interrupt46:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_display_dezena:

;programa_04_ContagemRegressiva.c,199 :: 		void display_dezena(){
;programa_04_ContagemRegressiva.c,201 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;programa_04_ContagemRegressiva.c,202 :: 		dezena = num/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _num+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _dezena+0
;programa_04_ContagemRegressiva.c,203 :: 		PORTD = digitos[dezena];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_04_ContagemRegressiva.c,204 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display_dezena36:
	DECFSZ     R13+0, 1
	GOTO       L_display_dezena36
	DECFSZ     R12+0, 1
	GOTO       L_display_dezena36
	NOP
	NOP
;programa_04_ContagemRegressiva.c,205 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;programa_04_ContagemRegressiva.c,206 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_04_ContagemRegressiva.c,208 :: 		}
	RETURN
; end of _display_dezena

_display_unidade:

;programa_04_ContagemRegressiva.c,209 :: 		void display_unidade(){
;programa_04_ContagemRegressiva.c,211 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;programa_04_ContagemRegressiva.c,212 :: 		unidade = num%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _num+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _unidade+0
;programa_04_ContagemRegressiva.c,213 :: 		PORTD = digitos[unidade];
	MOVF       R0+0, 0
	ADDLW      _digitos+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;programa_04_ContagemRegressiva.c,214 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display_unidade37:
	DECFSZ     R13+0, 1
	GOTO       L_display_unidade37
	DECFSZ     R12+0, 1
	GOTO       L_display_unidade37
	NOP
	NOP
;programa_04_ContagemRegressiva.c,215 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;programa_04_ContagemRegressiva.c,216 :: 		PORTD = 0;
	CLRF       PORTD+0
;programa_04_ContagemRegressiva.c,218 :: 		}
	RETURN
; end of _display_unidade
