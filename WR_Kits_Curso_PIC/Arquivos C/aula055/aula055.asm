
_main:

;aula055.c,64 :: 		void main() {
;aula055.c,65 :: 		CMCON = 0X07;                // desabilita compardores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula055.c,66 :: 		OPTION_REG = 0x80;           // pull-up desabilitados, TIMER 0 incrementa com ciclo de máquina, pre-escaler 1:2
	MOVLW      128
	MOVWF      OPTION_REG+0
;aula055.c,67 :: 		T1CON = 0X01;                // habilita contagem do Timer 1, com prescaler
	MOVLW      1
	MOVWF      T1CON+0
;aula055.c,68 :: 		CCP1CON = 0X07;              // configura captura a cada 16 bordas de subida
	MOVLW      7
	MOVWF      CCP1CON+0
;aula055.c,69 :: 		CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;aula055.c,70 :: 		GIE_bit = 0x01;              // habilita interrupção global
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;aula055.c,71 :: 		PEIE_bit = 0x01;             // habilita interrupção por periféricos
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;aula055.c,72 :: 		T0IE_bit = 0x01;             // habilita interrupção por TIMER 0
	BSF        T0IE_bit+0, BitPos(T0IE_bit+0)
;aula055.c,73 :: 		TMR0 = 0x06;                 // incicializa o registrador TMR0 em 6 (conta até 250)
	MOVLW      6
	MOVWF      TMR0+0
;aula055.c,74 :: 		TRISA = 0XFF;                // configura o PORT A como entrada
	MOVLW      255
	MOVWF      TRISA+0
;aula055.c,75 :: 		TRISB = 0XF9;                // configura RB1 e RB2 como entrada 0b11111001
	MOVLW      249
	MOVWF      TRISB+0
;aula055.c,76 :: 		PORTA = 0XFF;                // inicializa o PORT A
	MOVLW      255
	MOVWF      PORTA+0
;aula055.c,77 :: 		PORTB = 0X00;                // inicializa o PORT B
	CLRF       PORTB+0
;aula055.c,80 :: 		while(1)
L_main0:
;aula055.c,82 :: 		time2 = abs(time2 - time1);              // calcula o tempo de 16 períodos
	MOVF       _time1+0, 0
	SUBWF      _time2+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _time1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _time2+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0+0, 0
	MOVWF      _time2+0
	MOVF       R0+1, 0
	MOVWF      _time2+1
;aula055.c,83 :: 		time2 = (time2) >> 4;                    // divide o valor por 16 (2^4) para obter o tempo de um período
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R2+0, 0
L__main13:
	BTFSC      STATUS+0, 2
	GOTO       L__main14
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	ADDLW      255
	GOTO       L__main13
L__main14:
	MOVF       R4+0, 0
	MOVWF      _time2+0
	MOVF       R4+1, 0
	MOVWF      _time2+1
;aula055.c,84 :: 		freq = 1/ (time2 * 1E-6);                // converte período para frequência em Hz
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      189
	MOVWF      R4+0
	MOVLW      55
	MOVWF      R4+1
	MOVLW      6
	MOVWF      R4+2
	MOVLW      107
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _double2longword+0
	MOVF       R0+0, 0
	MOVWF      _freq+0
	MOVF       R0+1, 0
	MOVWF      _freq+1
	MOVF       R0+2, 0
	MOVWF      _freq+2
	MOVF       R0+3, 0
	MOVWF      _freq+3
;aula055.c,86 :: 		if(freq > 950 && freq < 1050){           // frequencia entre 950 e 1050Hz ?
	MOVF       R0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVF       R0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVF       R0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVF       R0+0, 0
	SUBLW      182
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      0
	SUBWF      _freq+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      0
	SUBWF      _freq+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      4
	SUBWF      _freq+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      26
	SUBWF      _freq+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main11:
;aula055.c,88 :: 		s_out = 0x01;                          // liga LED indicador, passagem liberada entre TX e RX
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;aula055.c,89 :: 		} else{
	GOTO       L_main5
L_main4:
;aula055.c,91 :: 		s_out = 0x00;                          // desliga LED indicador, passagem obstruída entre TX e RX
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;aula055.c,92 :: 		}
L_main5:
;aula055.c,95 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;aula055.c,96 :: 		}
	GOTO       L_main0
;aula055.c,98 :: 		}
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

;aula055.c,101 :: 		void interrupt(){
;aula055.c,103 :: 		if(T0IF_bit){                             // houve estouro do TIMER 0?
	BTFSS      T0IF_bit+0, BitPos(T0IF_bit+0)
	GOTO       L_interrupt7
;aula055.c,105 :: 		T0IF_bit = 0x00;                        // limpa flag
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;aula055.c,106 :: 		TMR0 = 0x06;                            // reinicia o conteudo do TMR0
	MOVLW      6
	MOVWF      TMR0+0
;aula055.c,107 :: 		LED_IR = ~LED_IR;                       // inverte estado do LED_IR (gerando pulsos quadrados na saída)
	MOVLW
	XORWF      RB1_bit+0, 1
;aula055.c,108 :: 		}
L_interrupt7:
;aula055.c,110 :: 		if(CCP1IF_bit){                           // houve interupção no módulo de captura?
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_interrupt8
;aula055.c,112 :: 		CCP1IF_bit = 0x00;                      // limpa flag para nova captura
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;aula055.c,113 :: 		if(!flag0.B0){                          // flag B0 limpa?
	BTFSC      _flag0+0, 0
	GOTO       L_interrupt9
;aula055.c,115 :: 		time1 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 1
	MOVF       CCPR1H+0, 0
	MOVWF      _time1+1
	CLRF       _time1+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time1+1, 1
;aula055.c,116 :: 		flag0.B0 = 0x01;
	BSF        _flag0+0, 0
;aula055.c,117 :: 		} else {
	GOTO       L_interrupt10
L_interrupt9:
;aula055.c,119 :: 		time2 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 2
	MOVF       CCPR1H+0, 0
	MOVWF      _time2+1
	CLRF       _time2+0
	MOVF       CCPR1L+0, 0
	ADDWF      _time2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time2+1, 1
;aula055.c,120 :: 		flag0.B0 = 0x00;
	BCF        _flag0+0, 0
;aula055.c,121 :: 		flag0.B1 = 0x01;
	BSF        _flag0+0, 1
;aula055.c,122 :: 		}
L_interrupt10:
;aula055.c,123 :: 		}
L_interrupt8:
;aula055.c,124 :: 		}
L_end_interrupt:
L__interrupt18:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
