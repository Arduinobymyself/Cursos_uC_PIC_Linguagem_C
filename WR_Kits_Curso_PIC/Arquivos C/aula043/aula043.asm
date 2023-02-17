
_main:

;aula043.c,37 :: 		void main() {
;aula043.c,38 :: 		CMCON = 0X07; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula043.c,40 :: 		T1CON = 0B00110001; // [--- --- TICKPS1 T1CKPS0 T1OSCEN T1SYNC' TMR1CS TMR1ON]
	MOVLW      49
	MOVWF      T1CON+0
;aula043.c,41 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;aula043.c,42 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;aula043.c,44 :: 		CCP1CON = 0b00001011; // [--- --- CCPxX CCPxY CCPxM3 CCPxM2 CCPxM1 CCPxM0]
	MOVLW      11
	MOVWF      CCP1CON+0
;aula043.c,53 :: 		CCPR1L = 255;         // inicializa o registrador CCPR
	MOVLW      255
	MOVWF      CCPR1L+0
;aula043.c,54 :: 		CCPR1H = 255;
	MOVLW      255
	MOVWF      CCPR1H+0
;aula043.c,57 :: 		TRISC = 0;
	CLRF       TRISC+0
;aula043.c,58 :: 		PORTC = 0;
	CLRF       PORTC+0
;aula043.c,60 :: 		while(1)
L_main0:
;aula043.c,62 :: 		if(CCP1IF_bit){
	BTFSS      CCP1IF_bit+0, 2
	GOTO       L_main2
;aula043.c,63 :: 		CCP1IF_bit =0;
	BCF        CCP1IF_bit+0, 2
;aula043.c,64 :: 		RC0_bit = ~RC0_bit;
	MOVLW      1
	XORWF      RC0_bit+0, 1
;aula043.c,65 :: 		}
L_main2:
;aula043.c,67 :: 		}
	GOTO       L_main0
;aula043.c,69 :: 		}
	GOTO       $+0
; end of _main
