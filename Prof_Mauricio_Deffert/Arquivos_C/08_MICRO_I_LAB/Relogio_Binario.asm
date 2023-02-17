
_main:

;Relogio_Binario.c,37 :: 		void main() {
;Relogio_Binario.c,39 :: 		config_mcu();
	CALL       _config_mcu+0
;Relogio_Binario.c,41 :: 		horas = 12;
	MOVLW      12
	MOVWF      _horas+0
;Relogio_Binario.c,42 :: 		minutos = 59;
	MOVLW      59
	MOVWF      _minutos+0
;Relogio_Binario.c,43 :: 		segundos = 50;
	MOVLW      50
	MOVWF      _segundos+0
;Relogio_Binario.c,44 :: 		ajuste = 3;
	MOVLW      3
	MOVWF      _ajuste+0
;Relogio_Binario.c,46 :: 		PORTD = segundos;
	MOVLW      50
	MOVWF      PORTD+0
;Relogio_Binario.c,47 :: 		PORTC = minutos;
	MOVLW      59
	MOVWF      PORTC+0
;Relogio_Binario.c,48 :: 		PORTA = horas;
	MOVLW      12
	MOVWF      PORTA+0
;Relogio_Binario.c,50 :: 		PORTE.RE2 = 0;
	BCF        PORTE+0, 2
;Relogio_Binario.c,51 :: 		PORTE.RE1 = 1;
	BSF        PORTE+0, 1
;Relogio_Binario.c,53 :: 		while(TRUE){
L_main0:
;Relogio_Binario.c,55 :: 		segundos++;
	INCF       _segundos+0, 1
;Relogio_Binario.c,57 :: 		if(segundos > 59){
	MOVF       _segundos+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;Relogio_Binario.c,58 :: 		segundos = 0;
	CLRF       _segundos+0
;Relogio_Binario.c,59 :: 		minutos++;
	INCF       _minutos+0, 1
;Relogio_Binario.c,60 :: 		}
L_main2:
;Relogio_Binario.c,61 :: 		if(minutos > 59){
	MOVF       _minutos+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Relogio_Binario.c,62 :: 		segundos = 0;
	CLRF       _segundos+0
;Relogio_Binario.c,63 :: 		minutos = 0;
	CLRF       _minutos+0
;Relogio_Binario.c,64 :: 		horas++;
	INCF       _horas+0, 1
;Relogio_Binario.c,65 :: 		}
L_main3:
;Relogio_Binario.c,66 :: 		if(horas > 12){
	MOVF       _horas+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Relogio_Binario.c,67 :: 		PORTE.RE2 = ~PORTE.RE2;
	MOVLW      4
	XORWF      PORTE+0, 1
;Relogio_Binario.c,68 :: 		PORTE.RE1 = ~PORTE.RE1;
	MOVLW      2
	XORWF      PORTE+0, 1
;Relogio_Binario.c,69 :: 		segundos = 0;
	CLRF       _segundos+0
;Relogio_Binario.c,70 :: 		minutos = 0;
	CLRF       _minutos+0
;Relogio_Binario.c,71 :: 		horas = 1;
	MOVLW      1
	MOVWF      _horas+0
;Relogio_Binario.c,72 :: 		}
L_main4:
;Relogio_Binario.c,74 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,76 :: 		if(B0){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;Relogio_Binario.c,77 :: 		ajuste = 0;
	CLRF       _ajuste+0
;Relogio_Binario.c,78 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Relogio_Binario.c,79 :: 		}
L_main5:
;Relogio_Binario.c,80 :: 		if(B1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;Relogio_Binario.c,81 :: 		ajuste = 1;
	MOVLW      1
	MOVWF      _ajuste+0
;Relogio_Binario.c,82 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Relogio_Binario.c,83 :: 		}
L_main6:
;Relogio_Binario.c,84 :: 		if(B2){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;Relogio_Binario.c,85 :: 		ajuste = 2;
	MOVLW      2
	MOVWF      _ajuste+0
;Relogio_Binario.c,86 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Relogio_Binario.c,87 :: 		}
L_main7:
;Relogio_Binario.c,88 :: 		if(B3){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;Relogio_Binario.c,89 :: 		ajuste = 3;
	MOVLW      3
	MOVWF      _ajuste+0
;Relogio_Binario.c,90 :: 		PORTD.RD6 = 0;
	BCF        PORTD+0, 6
;Relogio_Binario.c,91 :: 		}
L_main8:
;Relogio_Binario.c,93 :: 		while(ajuste == 0){ // ajuste minutos
L_main9:
	MOVF       _ajuste+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;Relogio_Binario.c,94 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Relogio_Binario.c,95 :: 		if(B2){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;Relogio_Binario.c,96 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
;Relogio_Binario.c,97 :: 		minutos++;
	INCF       _minutos+0, 1
;Relogio_Binario.c,98 :: 		if(minutos > 59){
	MOVF       _minutos+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;Relogio_Binario.c,99 :: 		minutos = 0;
	CLRF       _minutos+0
;Relogio_Binario.c,100 :: 		horas++;
	INCF       _horas+0, 1
;Relogio_Binario.c,101 :: 		if(horas > 12){
	MOVF       _horas+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;Relogio_Binario.c,102 :: 		PORTE.RE2 = ~PORTE.RE2;
	MOVLW      4
	XORWF      PORTE+0, 1
;Relogio_Binario.c,103 :: 		PORTE.RE1 = ~PORTE.RE1;
	MOVLW      2
	XORWF      PORTE+0, 1
;Relogio_Binario.c,104 :: 		horas = 1;
	MOVLW      1
	MOVWF      _horas+0
;Relogio_Binario.c,105 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,106 :: 		}
L_main14:
;Relogio_Binario.c,107 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,108 :: 		}
L_main13:
;Relogio_Binario.c,109 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,110 :: 		}
L_main11:
;Relogio_Binario.c,111 :: 		if(B3) ajuste = 3;
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVLW      3
	MOVWF      _ajuste+0
L_main15:
;Relogio_Binario.c,112 :: 		}
	GOTO       L_main9
L_main10:
;Relogio_Binario.c,113 :: 		while(ajuste == 1){ // ajuste horas
L_main16:
	MOVF       _ajuste+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Relogio_Binario.c,114 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Relogio_Binario.c,115 :: 		if(B2){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
;Relogio_Binario.c,116 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
;Relogio_Binario.c,117 :: 		horas++;
	INCF       _horas+0, 1
;Relogio_Binario.c,118 :: 		if(horas > 12){
	MOVF       _horas+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;Relogio_Binario.c,119 :: 		PORTE.RE2 = ~PORTE.RE2;
	MOVLW      4
	XORWF      PORTE+0, 1
;Relogio_Binario.c,120 :: 		PORTE.RE1 = ~PORTE.RE1;
	MOVLW      2
	XORWF      PORTE+0, 1
;Relogio_Binario.c,121 :: 		horas = 1;
	MOVLW      1
	MOVWF      _horas+0
;Relogio_Binario.c,122 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,123 :: 		}
L_main20:
;Relogio_Binario.c,124 :: 		atualiza();
	CALL       _atualiza+0
;Relogio_Binario.c,125 :: 		}
L_main18:
;Relogio_Binario.c,126 :: 		if(B3){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      50
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;Relogio_Binario.c,127 :: 		ajuste = 3;
	MOVLW      3
	MOVWF      _ajuste+0
;Relogio_Binario.c,128 :: 		PORTD.RD6 = 0;
	BCF        PORTD+0, 6
;Relogio_Binario.c,129 :: 		}
L_main21:
;Relogio_Binario.c,130 :: 		}
	GOTO       L_main16
L_main17:
;Relogio_Binario.c,132 :: 		PORTE.RE0 = 1;
	BSF        PORTE+0, 0
;Relogio_Binario.c,133 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;Relogio_Binario.c,134 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;Relogio_Binario.c,135 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;Relogio_Binario.c,137 :: 		}
	GOTO       L_main0
;Relogio_Binario.c,139 :: 		}
	GOTO       $+0
; end of _main

_atualiza:

;Relogio_Binario.c,141 :: 		void atualiza(){
;Relogio_Binario.c,142 :: 		PORTA = horas;
	MOVF       _horas+0, 0
	MOVWF      PORTA+0
;Relogio_Binario.c,143 :: 		PORTC = minutos;
	MOVF       _minutos+0, 0
	MOVWF      PORTC+0
;Relogio_Binario.c,144 :: 		PORTD = segundos;
	MOVF       _segundos+0, 0
	MOVWF      PORTD+0
;Relogio_Binario.c,145 :: 		}
	RETURN
; end of _atualiza

_config_mcu:

;Relogio_Binario.c,147 :: 		void config_mcu(){
;Relogio_Binario.c,148 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Relogio_Binario.c,149 :: 		TRISA = 0;
	CLRF       TRISA+0
;Relogio_Binario.c,150 :: 		PORTA = 0;
	CLRF       PORTA+0
;Relogio_Binario.c,151 :: 		TRISB = 255;
	MOVLW      255
	MOVWF      TRISB+0
;Relogio_Binario.c,153 :: 		TRISC = 0;
	CLRF       TRISC+0
;Relogio_Binario.c,154 :: 		PORTC = 0;
	CLRF       PORTC+0
;Relogio_Binario.c,155 :: 		TRISD = 0;
	CLRF       TRISD+0
;Relogio_Binario.c,156 :: 		PORTD = 0;
	CLRF       PORTD+0
;Relogio_Binario.c,157 :: 		TRISE = 0;
	CLRF       TRISE+0
;Relogio_Binario.c,158 :: 		PORTE = 0;
	CLRF       PORTE+0
;Relogio_Binario.c,159 :: 		}
	RETURN
; end of _config_mcu
