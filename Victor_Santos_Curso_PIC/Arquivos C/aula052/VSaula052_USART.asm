
_main:

;VSaula052_USART.c,75 :: 		void main() {
;VSaula052_USART.c,76 :: 		TXSTA = 0b00100000;
	MOVLW      32
	MOVWF      TXSTA+0
;VSaula052_USART.c,77 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;VSaula052_USART.c,79 :: 		SPBRG = 12;
	MOVLW      12
	MOVWF      SPBRG+0
;VSaula052_USART.c,104 :: 		TRISC6_bit = 0; // TX
	BCF        TRISC6_bit+0, 6
;VSaula052_USART.c,105 :: 		TRISC7_bit = 1; // RX
	BSF        TRISC7_bit+0, 7
;VSaula052_USART.c,108 :: 		TXREG = 'P';
	MOVLW      80
	MOVWF      TXREG+0
;VSaula052_USART.c,109 :: 		while(!PIR1.TXIF);
L_main0:
	BTFSC      PIR1+0, 4
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;VSaula052_USART.c,110 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,112 :: 		TXREG = 'I';
	MOVLW      73
	MOVWF      TXREG+0
;VSaula052_USART.c,113 :: 		while(!PIR1.TXIF);
L_main2:
	BTFSC      PIR1+0, 4
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;VSaula052_USART.c,114 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,116 :: 		TXREG = 'C';
	MOVLW      67
	MOVWF      TXREG+0
;VSaula052_USART.c,117 :: 		while(!PIR1.TXIF);
L_main4:
	BTFSC      PIR1+0, 4
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;VSaula052_USART.c,118 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,120 :: 		TXREG = '\r';
	MOVLW      13
	MOVWF      TXREG+0
;VSaula052_USART.c,121 :: 		while(!PIR1.TXIF);
L_main6:
	BTFSC      PIR1+0, 4
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;VSaula052_USART.c,122 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,124 :: 		while(nome[cont] != '\0'){
L_main8:
	MOVF       _cont+0, 0
	ADDLW      _nome+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;VSaula052_USART.c,125 :: 		TXREG = nome[cont];
	MOVF       _cont+0, 0
	ADDLW      _nome+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      TXREG+0
;VSaula052_USART.c,126 :: 		while(!PIR1.TXIF);
L_main10:
	BTFSC      PIR1+0, 4
	GOTO       L_main11
	GOTO       L_main10
L_main11:
;VSaula052_USART.c,127 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,128 :: 		cont++;
	INCF       _cont+0, 1
;VSaula052_USART.c,129 :: 		}
	GOTO       L_main8
L_main9:
;VSaula052_USART.c,132 :: 		while(1){
L_main12:
;VSaula052_USART.c,133 :: 		if(PIR1.RCIF){
	BTFSS      PIR1+0, 5
	GOTO       L_main14
;VSaula052_USART.c,134 :: 		texto = RCREG; // recepção serial
	MOVF       RCREG+0, 0
	MOVWF      _texto+0
;VSaula052_USART.c,135 :: 		TXREG = texto; // transmissão serial
	MOVF       _texto+0, 0
	MOVWF      TXREG+0
;VSaula052_USART.c,136 :: 		while(!PIR1.TXIF);
L_main15:
	BTFSC      PIR1+0, 4
	GOTO       L_main16
	GOTO       L_main15
L_main16:
;VSaula052_USART.c,137 :: 		PIR1.TXIF = 0;
	BCF        PIR1+0, 4
;VSaula052_USART.c,138 :: 		PIR1.RCIF = 0;
	BCF        PIR1+0, 5
;VSaula052_USART.c,139 :: 		}
L_main14:
;VSaula052_USART.c,140 :: 		}
	GOTO       L_main12
;VSaula052_USART.c,142 :: 		}
	GOTO       $+0
; end of _main
