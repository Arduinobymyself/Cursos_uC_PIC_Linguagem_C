
_main:
;VSaula005.c,28 :: 		void main() {
;VSaula005.c,29 :: 		cmcon = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula005.c,30 :: 		trisD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula005.c,31 :: 		trisB = 0x03;  // port B RB1 e RB2 configurado com entrada digital
	MOVLW      3
	MOVWF      TRISB+0
;VSaula005.c,33 :: 		portD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula005.c,35 :: 		while(1){
L_main0:
;VSaula005.c,36 :: 		if(rb0_bit == 1) rd6_bit = 1;
	BTFSS      RB0_bit+0, 0
	GOTO       L_main2
	BSF        RD6_bit+0, 6
	GOTO       L_main3
L_main2:
;VSaula005.c,37 :: 		else rd6_bit = 0;
	BCF        RD6_bit+0, 6
L_main3:
;VSaula005.c,39 :: 		if(rb1_bit == 0) rd7_bit =1;
	BTFSC      RB1_bit+0, 1
	GOTO       L_main4
	BSF        RD7_bit+0, 7
	GOTO       L_main5
L_main4:
;VSaula005.c,40 :: 		else rd7_bit = 0;
	BCF        RD7_bit+0, 7
L_main5:
;VSaula005.c,42 :: 		}
	GOTO       L_main0
;VSaula005.c,43 :: 		}
	GOTO       $+0
; end of _main
