
_main:

;aula024.c,30 :: 		void main() {
;aula024.c,32 :: 		OPTION_REG = 0b10000001;  // (81h) - RBPU' desabilita o pullup do port B e PS0 configura o prescaler 1:4
	MOVLW      129
	MOVWF      OPTION_REG+0
;aula024.c,33 :: 		INTCON = 0b11100000;      // GIE - habilita a interrupção global
	MOVLW      224
	MOVWF      INTCON+0
;aula024.c,36 :: 		TMR0 = 6;                 // inicia o Timer 0 em 6 (contará de 6 a 255 ou seja 250 vezes)
	MOVLW      6
	MOVWF      TMR0+0
;aula024.c,38 :: 		TRISB.RB4 = 0;            // configura o RB4 como saída digital
	BCF        TRISB+0, 4
;aula024.c,39 :: 		TRISB.RB5 = 0;
	BCF        TRISB+0, 5
;aula024.c,40 :: 		RB4_bit = 0;              // RB4 inicia em low
	BCF        RB4_bit+0, 4
;aula024.c,41 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, 5
;aula024.c,44 :: 		while(1)
L_main0:
;aula024.c,48 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, 5
;aula024.c,49 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;aula024.c,50 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, 5
;aula024.c,51 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;aula024.c,53 :: 		}
	GOTO       L_main0
;aula024.c,55 :: 		}
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

;aula024.c,58 :: 		void interrupt(){
;aula024.c,61 :: 		if(T0IF_bit){             // houve estouro?
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt4
;aula024.c,62 :: 		counter++;              // incrementa o contador de interrupções
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;aula024.c,63 :: 		TMR0 = 6;               // reinicia o registrador TMR0
	MOVLW      6
	MOVWF      TMR0+0
;aula024.c,65 :: 		if(counter == 500){     // 1us * 4 * 250 = 1ms -> 500ms = 500 * 1ms
	MOVF       _counter+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVLW      244
	XORWF      _counter+0, 0
L__interrupt7:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt5
;aula024.c,66 :: 		RB4_bit = ~RB4_bit;
	MOVLW      16
	XORWF      RB4_bit+0, 1
;aula024.c,67 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;aula024.c,68 :: 		}
L_interrupt5:
;aula024.c,70 :: 		T0IF_bit = 0;           // limpa o flag, preprara próxima interrupção
	BCF        T0IF_bit+0, 2
;aula024.c,71 :: 		}
L_interrupt4:
;aula024.c,73 :: 		}
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
