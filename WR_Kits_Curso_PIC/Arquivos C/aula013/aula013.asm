
_main:

;aula013.c,28 :: 		void main() {
;aula013.c,29 :: 		unsigned char catodo, cont = 0x00;
	CLRF       main_cont_L0+0
	MOVLW      63
	MOVWF      main_segmento_L0+0
	MOVLW      6
	MOVWF      main_segmento_L0+1
	MOVLW      91
	MOVWF      main_segmento_L0+2
	MOVLW      79
	MOVWF      main_segmento_L0+3
	MOVLW      102
	MOVWF      main_segmento_L0+4
	MOVLW      109
	MOVWF      main_segmento_L0+5
	MOVLW      125
	MOVWF      main_segmento_L0+6
	MOVLW      7
	MOVWF      main_segmento_L0+7
	MOVLW      127
	MOVWF      main_segmento_L0+8
	MOVLW      111
	MOVWF      main_segmento_L0+9
;aula013.c,32 :: 		cmcon = 0x07; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula013.c,33 :: 		trisB = 0x00; // todo o port B configurado como saída digital
	CLRF       TRISB+0
;aula013.c,34 :: 		portB = 0x00; // port B inicia em nível baixo
	CLRF       PORTB+0
;aula013.c,36 :: 		while(1){
L_main0:
;aula013.c,37 :: 		catodo = segmento[cont];  // número a ser enviado para o port B
	MOVF       main_cont_L0+0, 0
	ADDLW      main_segmento_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;aula013.c,38 :: 		portB = catodo;           // envia o pattern para o port B
;aula013.c,39 :: 		cont++;                   // incrementa o contador
	INCF       main_cont_L0+0, 1
;aula013.c,40 :: 		if(cont == 10) cont = 0;  // reinicia a contagem
	MOVF       main_cont_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	CLRF       main_cont_L0+0
L_main2:
;aula013.c,41 :: 		delay_ms(1000);           // delay para atualização
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;aula013.c,42 :: 		}
	GOTO       L_main0
;aula013.c,43 :: 		}
	GOTO       $+0
; end of _main
