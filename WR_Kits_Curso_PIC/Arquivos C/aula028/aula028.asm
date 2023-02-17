
_main:

;aula028.c,42 :: 		void main() {
;aula028.c,43 :: 		CMCON = 7; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula028.c,45 :: 		OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128
	MOVLW      134
	MOVWF      OPTION_REG+0
;aula028.c,47 :: 		INTCON.GIE = 1;  // habilita a interrupção global
	BSF        INTCON+0, 7
;aula028.c,48 :: 		INTCON.PEIE = 1; // habilita a interrupção por periféricos
	BSF        INTCON+0, 6
;aula028.c,49 :: 		INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0
	BSF        INTCON+0, 5
;aula028.c,51 :: 		TMR0 = 0x6C;     // TE = CM*PS*(256-TMR0) = 1us*128*(256-108) = 18,94ms
	MOVLW      108
	MOVWF      TMR0+0
;aula028.c,54 :: 		TRISA = 0X03; // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula028.c,55 :: 		TRISB = 0XF0; // nibble mais significativo do port B serão entradas
	MOVLW      240
	MOVWF      TRISB+0
;aula028.c,56 :: 		PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
	MOVLW      3
	MOVWF      PORTA+0
;aula028.c,57 :: 		PORTB = 0XFF; // port B inicia en nível lógico baixo
	MOVLW      255
	MOVWF      PORTB+0
;aula028.c,62 :: 		while(1)
L_main0:
;aula028.c,67 :: 		}
	GOTO       L_main0
;aula028.c,69 :: 		}
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

;aula028.c,72 :: 		void interrupt(){
;aula028.c,74 :: 		if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
;aula028.c,75 :: 		INTCON.T0IF = 0;    // limpa a flag de estouro do Timer 0
	BCF        INTCON+0, 2
;aula028.c,76 :: 		TMR0 = 0x6C;        // reinicia o registrador TMR0
	MOVLW      108
	MOVWF      TMR0+0
;aula028.c,79 :: 		if(col_1 && control == 1){ // se é a vez da coluna 1
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_interrupt5
	MOVF       _control+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt5
L__interrupt40:
;aula028.c,80 :: 		control = 2; // passa a vez para a coluna 2
	MOVLW      2
	MOVWF      _control+0
;aula028.c,81 :: 		col_1 = 0;   // aciona apenas a coluna 1
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;aula028.c,82 :: 		col_2 = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;aula028.c,83 :: 		col_3 = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;aula028.c,84 :: 		if(!row_A) pulse(1);
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_interrupt6
	MOVLW      1
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt7
L_interrupt6:
;aula028.c,85 :: 		else if(!row_B) pulse(4);
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_interrupt8
	MOVLW      4
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt9
L_interrupt8:
;aula028.c,86 :: 		else if(!row_C) pulse(7);
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_interrupt10
	MOVLW      7
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt11
L_interrupt10:
;aula028.c,87 :: 		else if(!row_D) pulse(11);
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_interrupt12
	MOVLW      11
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
L_interrupt12:
L_interrupt11:
L_interrupt9:
L_interrupt7:
;aula028.c,88 :: 		}
L_interrupt5:
;aula028.c,89 :: 		if(col_2 && control == 2){ // se é a vez da coluna 2
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_interrupt15
	MOVF       _control+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt15
L__interrupt39:
;aula028.c,90 :: 		control = 3; // passa a vez para a coluna 3
	MOVLW      3
	MOVWF      _control+0
;aula028.c,91 :: 		col_1 = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;aula028.c,92 :: 		col_2 = 0;   // aciona apenas a coluna 2
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;aula028.c,93 :: 		col_3 = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;aula028.c,94 :: 		if(!row_A) pulse(2);
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_interrupt16
	MOVLW      2
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt17
L_interrupt16:
;aula028.c,95 :: 		else if(!row_B) pulse(5);
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_interrupt18
	MOVLW      5
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt19
L_interrupt18:
;aula028.c,96 :: 		else if(!row_C) pulse(8);
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_interrupt20
	MOVLW      8
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt21
L_interrupt20:
;aula028.c,97 :: 		else if(!row_D) pulse(10);
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_interrupt22
	MOVLW      10
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
L_interrupt22:
L_interrupt21:
L_interrupt19:
L_interrupt17:
;aula028.c,98 :: 		}
L_interrupt15:
;aula028.c,99 :: 		if(col_3 && control == 3){ // se é a vez da coluna 3
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_interrupt25
	MOVF       _control+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt25
L__interrupt38:
;aula028.c,100 :: 		control = 1; // passa a vez para a coluna 1
	MOVLW      1
	MOVWF      _control+0
;aula028.c,101 :: 		col_1 = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;aula028.c,102 :: 		col_2 = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;aula028.c,103 :: 		col_3 = 0;   // aciona apenas a coluna 3
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;aula028.c,104 :: 		if(!row_A) pulse(3);
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_interrupt26
	MOVLW      3
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt27
L_interrupt26:
;aula028.c,105 :: 		else if(!row_B) pulse(6);
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_interrupt28
	MOVLW      6
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt29
L_interrupt28:
;aula028.c,106 :: 		else if(!row_C) pulse(9);
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_interrupt30
	MOVLW      9
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
	GOTO       L_interrupt31
L_interrupt30:
;aula028.c,107 :: 		else if(!row_D) pulse(12);
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_interrupt32
	MOVLW      12
	MOVWF      FARG_pulse_number+0
	CALL       _pulse+0
L_interrupt32:
L_interrupt31:
L_interrupt29:
L_interrupt27:
;aula028.c,108 :: 		}
L_interrupt25:
;aula028.c,111 :: 		}
L_interrupt2:
;aula028.c,112 :: 		}
L_end_interrupt:
L__interrupt43:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_pulse:

;aula028.c,114 :: 		void pulse(char number){ // pulsa o LED 1 de acordo com o número pressionado no teclado
;aula028.c,116 :: 		for(i = 0; i < number; i++){
	CLRF       R1+0
L_pulse33:
	MOVF       FARG_pulse_number+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_pulse34
;aula028.c,117 :: 		L1 = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;aula028.c,118 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulse36:
	DECFSZ     R13+0, 1
	GOTO       L_pulse36
	DECFSZ     R12+0, 1
	GOTO       L_pulse36
	DECFSZ     R11+0, 1
	GOTO       L_pulse36
	NOP
;aula028.c,119 :: 		L1 = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;aula028.c,120 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulse37:
	DECFSZ     R13+0, 1
	GOTO       L_pulse37
	DECFSZ     R12+0, 1
	GOTO       L_pulse37
	DECFSZ     R11+0, 1
	GOTO       L_pulse37
	NOP
;aula028.c,116 :: 		for(i = 0; i < number; i++){
	INCF       R1+0, 1
;aula028.c,121 :: 		}
	GOTO       L_pulse33
L_pulse34:
;aula028.c,122 :: 		}
L_end_pulse:
	RETURN
; end of _pulse
