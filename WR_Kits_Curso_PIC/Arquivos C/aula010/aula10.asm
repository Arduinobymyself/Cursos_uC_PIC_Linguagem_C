
_main:

;aula10.c,17 :: 		void main() {
;aula10.c,18 :: 		cmcon = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;aula10.c,19 :: 		trisA = 0x03;  // RA0 e RA1 como entrada digital, RA2 e RA3 como saída digital
	MOVLW      3
	MOVWF      TRISA+0
;aula10.c,20 :: 		trisB = 0x00;  // portB como saída digital
	CLRF       TRISB+0
;aula10.c,21 :: 		portA = 0x03;  // RA0 e RA1 iniciam em nível alto (pullup interno)
	MOVLW      3
	MOVWF      PORTA+0
;aula10.c,22 :: 		portB = 0x00;  // port B inicia em nível baixo
	CLRF       PORTB+0
;aula10.c,24 :: 		while(1){
L_main0:
;aula10.c,26 :: 		if(S1 == 0x00 && S2 == 0x01) servo1_horario();
	BTFSC      RA1_bit+0, 1
	GOTO       L_main4
	BTFSS      RA0_bit+0, 0
	GOTO       L_main4
L__main19:
	CALL       _servo1_horario+0
L_main4:
;aula10.c,29 :: 		if(S1 == 0x01 && S2 == 0x00) servo1_antihorario();
	BTFSS      RA1_bit+0, 1
	GOTO       L_main7
	BTFSC      RA0_bit+0, 0
	GOTO       L_main7
L__main18:
	CALL       _servo1_antihorario+0
L_main7:
;aula10.c,32 :: 		if(S1 == 0x01 && S2 == 0x01) servo1_centro();
	BTFSS      RA1_bit+0, 1
	GOTO       L_main10
	BTFSS      RA0_bit+0, 0
	GOTO       L_main10
L__main17:
	CALL       _servo1_centro+0
L_main10:
;aula10.c,33 :: 		}
	GOTO       L_main0
;aula10.c,34 :: 		}
	GOTO       $+0
; end of _main

_servo1_centro:

;aula10.c,37 :: 		void servo1_centro(){
;aula10.c,38 :: 		servo1 = 0x00;
	BCF        RB0_bit+0, 0
;aula10.c,39 :: 		delay_us(18500);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servo1_centro11:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_centro11
	DECFSZ     R12+0, 1
	GOTO       L_servo1_centro11
;aula10.c,40 :: 		servo1 = 0x01;
	BSF        RB0_bit+0, 0
;aula10.c,41 :: 		delay_us(1500); // pulso de 1,5ms - move centro
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_servo1_centro12:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_centro12
	DECFSZ     R12+0, 1
	GOTO       L_servo1_centro12
	NOP
	NOP
;aula10.c,42 :: 		}
	RETURN
; end of _servo1_centro

_servo1_antihorario:

;aula10.c,44 :: 		void servo1_antihorario(){
;aula10.c,45 :: 		servo1 = 0x00;
	BCF        RB0_bit+0, 0
;aula10.c,46 :: 		delay_us(19000);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      171
	MOVWF      R13+0
L_servo1_antihorario13:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_antihorario13
	DECFSZ     R12+0, 1
	GOTO       L_servo1_antihorario13
	NOP
	NOP
;aula10.c,47 :: 		servo1 = 0x01;
	BSF        RB0_bit+0, 0
;aula10.c,48 :: 		delay_us(1000); // pulso de 1,0ms - move sentido anti-horário
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_servo1_antihorario14:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_antihorario14
	DECFSZ     R12+0, 1
	GOTO       L_servo1_antihorario14
;aula10.c,49 :: 		}
	RETURN
; end of _servo1_antihorario

_servo1_horario:

;aula10.c,51 :: 		void servo1_horario(){
;aula10.c,52 :: 		servo1 = 0x00;
	BCF        RB0_bit+0, 0
;aula10.c,53 :: 		delay_us(18000);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      95
	MOVWF      R13+0
L_servo1_horario15:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_horario15
	DECFSZ     R12+0, 1
	GOTO       L_servo1_horario15
;aula10.c,54 :: 		servo1 = 0x01;
	BSF        RB0_bit+0, 0
;aula10.c,55 :: 		delay_us(2000); // pulso de 2,0ms - move sentido horário
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_servo1_horario16:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_horario16
	DECFSZ     R12+0, 1
	GOTO       L_servo1_horario16
	NOP
	NOP
;aula10.c,56 :: 		}
	RETURN
; end of _servo1_horario
