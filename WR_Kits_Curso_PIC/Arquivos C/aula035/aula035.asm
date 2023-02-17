
_main:

;aula035.c,47 :: 		void main() {
;aula035.c,48 :: 		CMCON = 0X07;  // desabilita os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula035.c,50 :: 		TRISB = 0x01;  // RB0 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;aula035.c,51 :: 		PORTB = 0x7E;  // inicia  o porte B com o equivalente a "0" no display
	MOVLW      126
	MOVWF      PORTB+0
;aula035.c,53 :: 		GIE_bit = 1;   // habilita chave geral de interrupções
	BSF        GIE_bit+0, 7
;aula035.c,54 :: 		PEIE_bit = 0;  // desabilita interrupção por periféricos
	BCF        PEIE_bit+0, 6
;aula035.c,55 :: 		INTE_bit = 1;  // habilita interrupção externa RB0/INT
	BSF        INTE_bit+0, 4
;aula035.c,56 :: 		INTEDG_bit = 1;// interrupção por borda de SUBIDA
	BSF        INTEDG_bit+0, 6
;aula035.c,58 :: 		INTF_bit = 0;      // inicializa o flag de interrupção
	BCF        INTF_bit+0, 1
;aula035.c,60 :: 		while(1){
L_main0:
;aula035.c,62 :: 		}
	GOTO       L_main0
;aula035.c,64 :: 		}
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

;aula035.c,67 :: 		void interrupt(){
;aula035.c,68 :: 		if(INTF_bit){
	BTFSS      INTF_bit+0, 1
	GOTO       L_interrupt2
;aula035.c,69 :: 		INTF_bit = 0;
	BCF        INTF_bit+0, 1
;aula035.c,70 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;aula035.c,71 :: 		PORTB = display(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_display_num+0
	MOVF       _contador+1, 0
	MOVWF      FARG_display_num+1
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula035.c,72 :: 		if(contador > 9){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _contador+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt5
	MOVF       _contador+0, 0
	SUBLW      9
L__interrupt5:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt3
;aula035.c,73 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;aula035.c,74 :: 		PORTB = display(contador);
	CLRF       FARG_display_num+0
	CLRF       FARG_display_num+1
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;aula035.c,75 :: 		}
L_interrupt3:
;aula035.c,77 :: 		}
L_interrupt2:
;aula035.c,79 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_display:

;aula035.c,81 :: 		int display(int num){
;aula035.c,85 :: 		int catodo[] = {0x7E, 0x0C, 0xB6, 0x9E, 0xCC, 0xDA, 0xFA, 0x0E, 0xFE, 0xDE};
	MOVLW      126
	MOVWF      display_catodo_L0+0
	MOVLW      0
	MOVWF      display_catodo_L0+1
	MOVLW      12
	MOVWF      display_catodo_L0+2
	MOVLW      0
	MOVWF      display_catodo_L0+3
	MOVLW      182
	MOVWF      display_catodo_L0+4
	MOVLW      0
	MOVWF      display_catodo_L0+5
	MOVLW      158
	MOVWF      display_catodo_L0+6
	MOVLW      0
	MOVWF      display_catodo_L0+7
	MOVLW      204
	MOVWF      display_catodo_L0+8
	MOVLW      0
	MOVWF      display_catodo_L0+9
	MOVLW      218
	MOVWF      display_catodo_L0+10
	MOVLW      0
	MOVWF      display_catodo_L0+11
	MOVLW      250
	MOVWF      display_catodo_L0+12
	MOVLW      0
	MOVWF      display_catodo_L0+13
	MOVLW      14
	MOVWF      display_catodo_L0+14
	MOVLW      0
	MOVWF      display_catodo_L0+15
	MOVLW      254
	MOVWF      display_catodo_L0+16
	MOVLW      0
	MOVWF      display_catodo_L0+17
	MOVLW      222
	MOVWF      display_catodo_L0+18
	MOVLW      0
	MOVWF      display_catodo_L0+19
;aula035.c,86 :: 		aux = catodo[num];
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      display_catodo_L0+0
	MOVWF      FSR
;aula035.c,87 :: 		return aux;
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
;aula035.c,89 :: 		}
	RETURN
; end of _display
