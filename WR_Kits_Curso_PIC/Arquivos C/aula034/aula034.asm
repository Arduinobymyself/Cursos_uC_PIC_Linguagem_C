
_main:

;aula034.c,45 :: 		void main() {
;aula034.c,46 :: 		CMCON = 0X07;  // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula034.c,48 :: 		TRISA = 0x00;  // port A como saída digital
	CLRF       TRISA+0
;aula034.c,49 :: 		PORTA = 0x00;  // port A inicia em nível baixo
	CLRF       PORTA+0
;aula034.c,50 :: 		TRISB = 0x01;  // RB0 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;aula034.c,51 :: 		PORTB = 0x01;  // RB0 com pullup
	MOVLW      1
	MOVWF      PORTB+0
;aula034.c,53 :: 		GIE_bit = 1;   // habilita chave geral de interrupções
	BSF        GIE_bit+0, 7
;aula034.c,54 :: 		PEIE_bit = 0;  // desabilita interrupção por periféricos
	BCF        PEIE_bit+0, 6
;aula034.c,55 :: 		INTE_bit = 1;  // habilita interrupção externa RB0/INT
	BSF        INTE_bit+0, 4
;aula034.c,56 :: 		INTEDG_bit = 0;// interrupção por borda de descida
	BCF        INTEDG_bit+0, 6
;aula034.c,58 :: 		INTF_bit = 0;      // inicializa o flag de interrupção
	BCF        INTF_bit+0, 1
;aula034.c,60 :: 		while(1){
L_main0:
;aula034.c,61 :: 		LED2 = ~LED2;
	MOVLW      2
	XORWF      RA1_bit+0, 1
;aula034.c,62 :: 		delay_ms(3000);
	MOVLW      61
	MOVWF      R11+0
	MOVLW      225
	MOVWF      R12+0
	MOVLW      63
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
;aula034.c,63 :: 		}
	GOTO       L_main0
;aula034.c,65 :: 		}
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

;aula034.c,68 :: 		void interrupt(){
;aula034.c,69 :: 		if(INTF_bit){
	BTFSS      INTF_bit+0, 1
	GOTO       L_interrupt3
;aula034.c,70 :: 		INTF_bit = 0;
	BCF        INTF_bit+0, 1
;aula034.c,71 :: 		LED1 = ~LED1;
	MOVLW      1
	XORWF      RA0_bit+0, 1
;aula034.c,72 :: 		}
L_interrupt3:
;aula034.c,74 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
