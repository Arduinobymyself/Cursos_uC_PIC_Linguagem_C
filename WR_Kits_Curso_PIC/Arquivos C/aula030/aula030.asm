
_main:

;aula030.c,33 :: 		void main() {
;aula030.c,34 :: 		CMCON = 7; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula030.c,36 :: 		OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128
	MOVLW      134
	MOVWF      OPTION_REG+0
;aula030.c,38 :: 		INTCON.GIE = 1;  // habilita a interrupção global
	BSF        INTCON+0, 7
;aula030.c,39 :: 		INTCON.PEIE = 1; // habilita a interrupção por periféricos
	BSF        INTCON+0, 6
;aula030.c,40 :: 		INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0
	BSF        INTCON+0, 5
;aula030.c,42 :: 		TMR0 = 0x6C;
	MOVLW      108
	MOVWF      TMR0+0
;aula030.c,45 :: 		T2CON = 0b00000110;    // 0, postscaler 1:1, timer 2 on, prescaler 1:16
	MOVLW      6
	MOVWF      T2CON+0
;aula030.c,46 :: 		PR2 =  255;            // inicializa o registrador de controle do Timer 2
	MOVLW      255
	MOVWF      PR2+0
;aula030.c,47 :: 		CCPR1L = 0X00;         // LED inici[ara apagado
	CLRF       CCPR1L+0
;aula030.c,48 :: 		CCP1CON = 0b00001100;  // modo PWM habilitado (LSB 11xx)
	MOVLW      12
	MOVWF      CCP1CON+0
;aula030.c,54 :: 		TRISA = 0X03; // RA0 e RA1 são entradas digitais
	MOVLW      3
	MOVWF      TRISA+0
;aula030.c,55 :: 		TRISB = 0x00; // todo o port B será saída
	CLRF       TRISB+0
;aula030.c,56 :: 		PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
	MOVLW      3
	MOVWF      PORTA+0
;aula030.c,57 :: 		PORTB = 0X00; // port B inicia em LOW
	CLRF       PORTB+0
;aula030.c,61 :: 		while(1)
L_main0:
;aula030.c,66 :: 		}
	GOTO       L_main0
;aula030.c,68 :: 		}
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

;aula030.c,71 :: 		void interrupt(){
;aula030.c,73 :: 		if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
;aula030.c,74 :: 		INTCON.T0IF = 0; // limpa a flag de estouro do Timer 0
	BCF        INTCON+0, 2
;aula030.c,75 :: 		TMR0 = 0x6C; // reinicia o registrador TMR0
	MOVLW      108
	MOVWF      TMR0+0
;aula030.c,78 :: 		if(!S1){
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_interrupt3
;aula030.c,79 :: 		CCPR1L++; // incrementa PWM
	INCF       CCPR1L+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;aula030.c,80 :: 		}
	GOTO       L_interrupt4
L_interrupt3:
;aula030.c,81 :: 		else if(!S2){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_interrupt5
;aula030.c,82 :: 		CCPR1L--; // decrementa PWM
	DECF       CCPR1L+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;aula030.c,83 :: 		}
L_interrupt5:
L_interrupt4:
;aula030.c,85 :: 		}
L_interrupt2:
;aula030.c,86 :: 		}
L_end_interrupt:
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
