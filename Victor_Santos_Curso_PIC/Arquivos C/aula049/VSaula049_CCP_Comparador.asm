
_main:

;VSaula049_CCP_Comparador.c,44 :: 		void main() {
;VSaula049_CCP_Comparador.c,46 :: 		TRISC = 0b00000000; // RC1/CCP2 como saída
	CLRF       TRISC+0
;VSaula049_CCP_Comparador.c,47 :: 		PORTC = 0b00000000; // inicia em nível baixo
	CLRF       PORTC+0
;VSaula049_CCP_Comparador.c,49 :: 		T1CON = 0b00010001; // tempo de incremento do Timer 1 de 1us
	MOVLW      17
	MOVWF      T1CON+0
;VSaula049_CCP_Comparador.c,52 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;VSaula049_CCP_Comparador.c,53 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;VSaula049_CCP_Comparador.c,56 :: 		CCP2M3_bit = 1;
	BSF        CCP2M3_bit+0, 3
;VSaula049_CCP_Comparador.c,57 :: 		CCP2M2_bit = 0;
	BCF        CCP2M2_bit+0, 2
;VSaula049_CCP_Comparador.c,58 :: 		CCP2M1_bit = 0;
	BCF        CCP2M1_bit+0, 1
;VSaula049_CCP_Comparador.c,59 :: 		CCP2M0_bit = 0;
	BCF        CCP2M0_bit+0, 0
;VSaula049_CCP_Comparador.c,63 :: 		INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
	MOVLW      192
	MOVWF      INTCON+0
;VSaula049_CCP_Comparador.c,65 :: 		TMR1IE_bit = 0; // não precisa habilitar a interrupção do Timer 1
	BCF        TMR1IE_bit+0, 0
;VSaula049_CCP_Comparador.c,66 :: 		CCP2IE_bit = 1; // habilita interrupção por CCP2
	BSF        CCP2IE_bit+0, 0
;VSaula049_CCP_Comparador.c,68 :: 		CCPR2H = 0x02;  // inicia o CCPR2 com valor 700
	MOVLW      2
	MOVWF      CCPR2H+0
;VSaula049_CCP_Comparador.c,69 :: 		CCPR2L = 0xBC;
	MOVLW      188
	MOVWF      CCPR2L+0
;VSaula049_CCP_Comparador.c,72 :: 		while(1){
L_main0:
;VSaula049_CCP_Comparador.c,76 :: 		}
	GOTO       L_main0
;VSaula049_CCP_Comparador.c,78 :: 		}
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

;VSaula049_CCP_Comparador.c,81 :: 		void interrupt(){
;VSaula049_CCP_Comparador.c,83 :: 		if(CCP2IF_bit){
	BTFSS      CCP2IF_bit+0, 0
	GOTO       L_interrupt2
;VSaula049_CCP_Comparador.c,84 :: 		if(flag.b0){
	BTFSS      _flag+0, 0
	GOTO       L_interrupt3
;VSaula049_CCP_Comparador.c,85 :: 		flag.b0 = 0;
	BCF        _flag+0, 0
;VSaula049_CCP_Comparador.c,86 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;VSaula049_CCP_Comparador.c,87 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;VSaula049_CCP_Comparador.c,88 :: 		CCP2M0_bit = 1; // configura módulo CCP como compare para resetar o pino CCP
	BSF        CCP2M0_bit+0, 0
;VSaula049_CCP_Comparador.c,89 :: 		} else {
	GOTO       L_interrupt4
L_interrupt3:
;VSaula049_CCP_Comparador.c,90 :: 		flag.b0 = 1;
	BSF        _flag+0, 0
;VSaula049_CCP_Comparador.c,91 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;VSaula049_CCP_Comparador.c,92 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;VSaula049_CCP_Comparador.c,93 :: 		CCP2M0_bit = 0; // configura módulo CCP como caompare para setar o pino CCP
	BCF        CCP2M0_bit+0, 0
;VSaula049_CCP_Comparador.c,94 :: 		}
L_interrupt4:
;VSaula049_CCP_Comparador.c,95 :: 		CCP2IF_bit = 0;
	BCF        CCP2IF_bit+0, 0
;VSaula049_CCP_Comparador.c,96 :: 		}
L_interrupt2:
;VSaula049_CCP_Comparador.c,98 :: 		}
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
