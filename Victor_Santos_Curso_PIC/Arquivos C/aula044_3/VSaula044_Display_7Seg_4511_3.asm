
_display_4511_init:

;display_4x_4511.h,27 :: 		void display_4511_init(){
;display_4x_4511.h,29 :: 		display_4511_A_direction = 0;
	BCF        display_4511_A_direction+0, BitPos(display_4511_A_direction+0)
;display_4x_4511.h,30 :: 		display_4511_B_direction = 0;
	BCF        display_4511_B_direction+0, BitPos(display_4511_B_direction+0)
;display_4x_4511.h,31 :: 		display_4511_C_direction = 0;
	BCF        display_4511_C_direction+0, BitPos(display_4511_C_direction+0)
;display_4x_4511.h,32 :: 		display_4511_D_direction = 0;
	BCF        display_4511_D_direction+0, BitPos(display_4511_D_direction+0)
;display_4x_4511.h,34 :: 		display_4511_disp1_direction = 0;
	BCF        display_4511_disp1_direction+0, BitPos(display_4511_disp1_direction+0)
;display_4x_4511.h,35 :: 		display_4511_disp2_direction = 0;
	BCF        display_4511_disp2_direction+0, BitPos(display_4511_disp2_direction+0)
;display_4x_4511.h,36 :: 		display_4511_disp3_direction = 0;
	BCF        display_4511_disp3_direction+0, BitPos(display_4511_disp3_direction+0)
;display_4x_4511.h,37 :: 		display_4511_disp4_direction = 0;
	BCF        display_4511_disp4_direction+0, BitPos(display_4511_disp4_direction+0)
;display_4x_4511.h,41 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,42 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,43 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,44 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,46 :: 		display_4511_disp1 = 0;
	BCF        display_4511_disp1+0, BitPos(display_4511_disp1+0)
;display_4x_4511.h,47 :: 		display_4511_disp2 = 0;
	BCF        display_4511_disp2+0, BitPos(display_4511_disp2+0)
;display_4x_4511.h,48 :: 		display_4511_disp3 = 0;
	BCF        display_4511_disp3+0, BitPos(display_4511_disp3+0)
;display_4x_4511.h,49 :: 		display_4511_disp4 = 0;
	BCF        display_4511_disp4+0, BitPos(display_4511_disp4+0)
;display_4x_4511.h,50 :: 		}
	RETURN
; end of _display_4511_init

_display_4511_out:

;display_4x_4511.h,53 :: 		void display_4511_out(unsigned char digito){
;display_4x_4511.h,54 :: 		switch(digito){
	GOTO       L_display_4511_out0
;display_4x_4511.h,55 :: 		case 0:
L_display_4511_out2:
;display_4x_4511.h,56 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,57 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,58 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,59 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,60 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,61 :: 		case 1:
L_display_4511_out3:
;display_4x_4511.h,62 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,63 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,64 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,65 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,66 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,67 :: 		case 2:
L_display_4511_out4:
;display_4x_4511.h,68 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,69 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,70 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,71 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,72 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,73 :: 		case 3:
L_display_4511_out5:
;display_4x_4511.h,74 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,75 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,76 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,77 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,78 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,79 :: 		case 4:
L_display_4511_out6:
;display_4x_4511.h,80 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,81 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,82 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,83 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,84 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,85 :: 		case 5:
L_display_4511_out7:
;display_4x_4511.h,86 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,87 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,88 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,89 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,90 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,91 :: 		case 6:
L_display_4511_out8:
;display_4x_4511.h,92 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,93 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,94 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,95 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,96 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,97 :: 		case 7:
L_display_4511_out9:
;display_4x_4511.h,98 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,99 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,100 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,101 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,102 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,103 :: 		case 8:
L_display_4511_out10:
;display_4x_4511.h,104 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,105 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,106 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,107 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,108 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,109 :: 		case 9:
L_display_4511_out11:
;display_4x_4511.h,110 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4x_4511.h,111 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4x_4511.h,112 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4x_4511.h,113 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4x_4511.h,114 :: 		break;
	GOTO       L_display_4511_out1
;display_4x_4511.h,116 :: 		}
L_display_4511_out0:
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out2
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out3
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out4
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out5
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out6
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out7
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out8
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out9
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out10
	MOVF       FARG_display_4511_out_digito+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out11
L_display_4511_out1:
;display_4x_4511.h,117 :: 		}
	RETURN
; end of _display_4511_out

_display_4511_sweep:

;display_4x_4511.h,119 :: 		void display_4511_sweep(unsigned int numero){
;display_4x_4511.h,122 :: 		if(numero > 9999) numero = 9999;
	MOVF       FARG_display_4511_sweep_numero+1, 0
	SUBLW      39
	BTFSS      STATUS+0, 2
	GOTO       L__display_4511_sweep24
	MOVF       FARG_display_4511_sweep_numero+0, 0
	SUBLW      15
L__display_4511_sweep24:
	BTFSC      STATUS+0, 0
	GOTO       L_display_4511_sweep12
	MOVLW      15
	MOVWF      FARG_display_4511_sweep_numero+0
	MOVLW      39
	MOVWF      FARG_display_4511_sweep_numero+1
L_display_4511_sweep12:
;display_4x_4511.h,125 :: 		display_4511_disp1 = 0;
	BCF        display_4511_disp1+0, BitPos(display_4511_disp1+0)
;display_4x_4511.h,126 :: 		display_4511_disp2 = 0;
	BCF        display_4511_disp2+0, BitPos(display_4511_disp2+0)
;display_4x_4511.h,127 :: 		display_4511_disp3 = 0;
	BCF        display_4511_disp3+0, BitPos(display_4511_disp3+0)
;display_4x_4511.h,128 :: 		display_4511_disp4 = 0;
	BCF        display_4511_disp4+0, BitPos(display_4511_disp4+0)
;display_4x_4511.h,129 :: 		delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_display_4511_sweep13:
	DECFSZ     R13+0, 1
	GOTO       L_display_4511_sweep13
	NOP
;display_4x_4511.h,131 :: 		switch(position){
	GOTO       L_display_4511_sweep14
;display_4x_4511.h,132 :: 		case 1:
L_display_4511_sweep16:
;display_4x_4511.h,133 :: 		display_4511_out((numero/1000));     // escreve no barramento
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_display_4511_sweep_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_4511_sweep_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_display_4511_out_digito+0
	CALL       _display_4511_out+0
;display_4x_4511.h,134 :: 		display_4511_disp1 = 1;              // liga o display
	BSF        display_4511_disp1+0, BitPos(display_4511_disp1+0)
;display_4x_4511.h,135 :: 		position = 2;                        // habilita o próximo display
	MOVLW      2
	MOVWF      display_4511_sweep_position_L0+0
;display_4x_4511.h,136 :: 		break;
	GOTO       L_display_4511_sweep15
;display_4x_4511.h,138 :: 		case 2:
L_display_4511_sweep17:
;display_4x_4511.h,139 :: 		display_4511_out(((numero/100)%10)); // escreve no barramento
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_4511_sweep_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_4511_sweep_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_display_4511_out_digito+0
	CALL       _display_4511_out+0
;display_4x_4511.h,140 :: 		display_4511_disp2 = 1;              // liga o display
	BSF        display_4511_disp2+0, BitPos(display_4511_disp2+0)
;display_4x_4511.h,141 :: 		position = 3;                        // habilita o próximo display
	MOVLW      3
	MOVWF      display_4511_sweep_position_L0+0
;display_4x_4511.h,142 :: 		break;
	GOTO       L_display_4511_sweep15
;display_4x_4511.h,144 :: 		case 3:
L_display_4511_sweep18:
;display_4x_4511.h,145 :: 		display_4511_out(((numero/10)%10));  // escreve no barramento
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_4511_sweep_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_4511_sweep_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_display_4511_out_digito+0
	CALL       _display_4511_out+0
;display_4x_4511.h,146 :: 		display_4511_disp3 = 1;              // liga o display
	BSF        display_4511_disp3+0, BitPos(display_4511_disp3+0)
;display_4x_4511.h,147 :: 		position = 4;                        // habilita o próximo display
	MOVLW      4
	MOVWF      display_4511_sweep_position_L0+0
;display_4x_4511.h,148 :: 		break;
	GOTO       L_display_4511_sweep15
;display_4x_4511.h,150 :: 		case 4:
L_display_4511_sweep19:
;display_4x_4511.h,151 :: 		display_4511_out(((numero/1)%10));   // escreve no barramento
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_4511_sweep_numero+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_4511_sweep_numero+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_display_4511_out_digito+0
	CALL       _display_4511_out+0
;display_4x_4511.h,152 :: 		display_4511_disp4 = 1;              // liga o display
	BSF        display_4511_disp4+0, BitPos(display_4511_disp4+0)
;display_4x_4511.h,153 :: 		position = 1;                        // habilita o próximo display
	MOVLW      1
	MOVWF      display_4511_sweep_position_L0+0
;display_4x_4511.h,154 :: 		break;
	GOTO       L_display_4511_sweep15
;display_4x_4511.h,156 :: 		}
L_display_4511_sweep14:
	MOVF       display_4511_sweep_position_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_sweep16
	MOVF       display_4511_sweep_position_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_sweep17
	MOVF       display_4511_sweep_position_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_sweep18
	MOVF       display_4511_sweep_position_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_sweep19
L_display_4511_sweep15:
;display_4x_4511.h,158 :: 		}
	RETURN
; end of _display_4511_sweep

_main:

;VSaula044_Display_7Seg_4511_3.c,46 :: 		void main() {
;VSaula044_Display_7Seg_4511_3.c,47 :: 		initTimer0();
	CALL       _initTimer0+0
;VSaula044_Display_7Seg_4511_3.c,48 :: 		display_4511_init();
	CALL       _display_4511_init+0
;VSaula044_Display_7Seg_4511_3.c,50 :: 		while(1){
L_main20:
;VSaula044_Display_7Seg_4511_3.c,51 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;VSaula044_Display_7Seg_4511_3.c,52 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;VSaula044_Display_7Seg_4511_3.c,53 :: 		}
	GOTO       L_main20
;VSaula044_Display_7Seg_4511_3.c,55 :: 		}
	GOTO       $+0
; end of _main

_initTimer0:

;VSaula044_Display_7Seg_4511_3.c,57 :: 		void initTimer0(){
;VSaula044_Display_7Seg_4511_3.c,58 :: 		OPTION_REG	 = 0x83;
	MOVLW      131
	MOVWF      OPTION_REG+0
;VSaula044_Display_7Seg_4511_3.c,59 :: 		TMR0		 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;VSaula044_Display_7Seg_4511_3.c,60 :: 		INTCON	 = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;VSaula044_Display_7Seg_4511_3.c,61 :: 		}
	RETURN
; end of _initTimer0

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;VSaula044_Display_7Seg_4511_3.c,63 :: 		void interrupt(){
;VSaula044_Display_7Seg_4511_3.c,64 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt23
;VSaula044_Display_7Seg_4511_3.c,65 :: 		TMR0IF_bit	 = 0;
	BCF        TMR0IF_bit+0, 2
;VSaula044_Display_7Seg_4511_3.c,66 :: 		TMR0         = 6;
	MOVLW      6
	MOVWF      TMR0+0
;VSaula044_Display_7Seg_4511_3.c,67 :: 		display_4511_sweep(contador);
	MOVF       _contador+0, 0
	MOVWF      FARG_display_4511_sweep_numero+0
	MOVF       _contador+1, 0
	MOVWF      FARG_display_4511_sweep_numero+1
	CALL       _display_4511_sweep+0
;VSaula044_Display_7Seg_4511_3.c,68 :: 		}
L_interrupt23:
;VSaula044_Display_7Seg_4511_3.c,69 :: 		}
L__interrupt25:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
