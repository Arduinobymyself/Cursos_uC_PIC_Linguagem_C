
_main:

;Timer-Counter_Ex_3.c,46 :: 		void main() {
;Timer-Counter_Ex_3.c,48 :: 		ADCON1 = 7; // configura A/D para todo digital
	MOVLW      7
	MOVWF      ADCON1+0
;Timer-Counter_Ex_3.c,50 :: 		config_ports();          // chama função de configuração de ports
	CALL       _config_ports+0
;Timer-Counter_Ex_3.c,51 :: 		config_interrupt();      // chama função de configuração de interrupções
	CALL       _config_interrupt+0
;Timer-Counter_Ex_3.c,52 :: 		config_timer();          // chama função de configuração de timers
	CALL       _config_timer+0
;Timer-Counter_Ex_3.c,54 :: 		num = 0;
	CLRF       _num+0
	CLRF       _num+1
;Timer-Counter_Ex_3.c,56 :: 		while(1){
L_main0:
;Timer-Counter_Ex_3.c,57 :: 		if(num == 100) num = 0;
	MOVLW      0
	XORWF      _num+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      100
	XORWF      _num+0, 0
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	CLRF       _num+0
	CLRF       _num+1
L_main2:
;Timer-Counter_Ex_3.c,58 :: 		display_dezena();
	CALL       _display_dezena+0
;Timer-Counter_Ex_3.c,59 :: 		display_unidade();
	CALL       _display_unidade+0
;Timer-Counter_Ex_3.c,60 :: 		}
	GOTO       L_main0
;Timer-Counter_Ex_3.c,62 :: 		}
L_end_main:
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

;Timer-Counter_Ex_3.c,65 :: 		void interrupt(){
;Timer-Counter_Ex_3.c,66 :: 		if(INTCON.TMR0IF == 1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt3
;Timer-Counter_Ex_3.c,67 :: 		cont++;
	INCF       _cont+0, 1
;Timer-Counter_Ex_3.c,68 :: 		if(cont == 40){ // 40*25ms = 1s
	MOVF       _cont+0, 0
	XORLW      40
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
;Timer-Counter_Ex_3.c,69 :: 		num++;
	INCF       _num+0, 1
	BTFSC      STATUS+0, 2
	INCF       _num+1, 1
;Timer-Counter_Ex_3.c,70 :: 		cont = 0;
	CLRF       _cont+0
;Timer-Counter_Ex_3.c,71 :: 		}
L_interrupt4:
;Timer-Counter_Ex_3.c,72 :: 		TMR0 = 61;          // recarregamento do registrador TIMER 0
	MOVLW      61
	MOVWF      TMR0+0
;Timer-Counter_Ex_3.c,73 :: 		INTCON.TMR0IF = 0;  // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_Ex_3.c,74 :: 		}
L_interrupt3:
;Timer-Counter_Ex_3.c,75 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_display_dezena:

;Timer-Counter_Ex_3.c,77 :: 		void display_dezena(){
;Timer-Counter_Ex_3.c,78 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;Timer-Counter_Ex_3.c,79 :: 		dezena = num/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _dezena+0
	MOVF       R0+1, 0
	MOVWF      _dezena+1
;Timer-Counter_Ex_3.c,80 :: 		PORTD = pattern[dezena];
	MOVF       R0+0, 0
	ADDLW      _pattern+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Timer-Counter_Ex_3.c,81 :: 		delay_ms(5);
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
;Timer-Counter_Ex_3.c,82 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;Timer-Counter_Ex_3.c,83 :: 		PORTD = 0;
	CLRF       PORTD+0
;Timer-Counter_Ex_3.c,84 :: 		}
L_end_display_dezena:
	RETURN
; end of _display_dezena

_display_unidade:

;Timer-Counter_Ex_3.c,86 :: 		void display_unidade(){
;Timer-Counter_Ex_3.c,87 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;Timer-Counter_Ex_3.c,88 :: 		unidade = num%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _unidade+0
	MOVF       R0+1, 0
	MOVWF      _unidade+1
;Timer-Counter_Ex_3.c,89 :: 		PORTD = pattern[unidade];
	MOVF       R0+0, 0
	ADDLW      _pattern+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Timer-Counter_Ex_3.c,90 :: 		delay_ms(5);
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
;Timer-Counter_Ex_3.c,91 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;Timer-Counter_Ex_3.c,92 :: 		PORTD = 0;
	CLRF       PORTD+0
;Timer-Counter_Ex_3.c,93 :: 		}
L_end_display_unidade:
	RETURN
; end of _display_unidade

_config_timer:

;Timer-Counter_Ex_3.c,95 :: 		void config_timer(){
;Timer-Counter_Ex_3.c,96 :: 		OPTION_REG = 0b10000111;   // liga TIMER 0 - prescaler 1:256
	MOVLW      135
	MOVWF      OPTION_REG+0
;Timer-Counter_Ex_3.c,97 :: 		TMR0 = 61;                 // carregamento incial do registrador TMR0
	MOVLW      61
	MOVWF      TMR0+0
;Timer-Counter_Ex_3.c,98 :: 		INTCON.TMR0IF = 0;         // reincia a flag de estouro do TIMER 0
	BCF        INTCON+0, 2
;Timer-Counter_Ex_3.c,99 :: 		}
L_end_config_timer:
	RETURN
; end of _config_timer

_config_ports:

;Timer-Counter_Ex_3.c,101 :: 		void config_ports(){
;Timer-Counter_Ex_3.c,102 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;Timer-Counter_Ex_3.c,103 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;Timer-Counter_Ex_3.c,104 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;Timer-Counter_Ex_3.c,105 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;Timer-Counter_Ex_3.c,106 :: 		}
L_end_config_ports:
	RETURN
; end of _config_ports

_config_interrupt:

;Timer-Counter_Ex_3.c,108 :: 		void config_interrupt(){
;Timer-Counter_Ex_3.c,109 :: 		INTCON.GIE = 1;       // habilita interupção global
	BSF        INTCON+0, 7
;Timer-Counter_Ex_3.c,110 :: 		INTCON.PEIE = 0;      // desabilita interrupção por periféricos
	BCF        INTCON+0, 6
;Timer-Counter_Ex_3.c,111 :: 		INTCON.TMR0IE = 1;    // habilita interrupção por estouro do TIMER 0
	BSF        INTCON+0, 5
;Timer-Counter_Ex_3.c,112 :: 		}
L_end_config_interrupt:
	RETURN
; end of _config_interrupt
