
_display_4511_init:

;display_4511.h,18 :: 		void display_4511_init(){
;display_4511.h,20 :: 		display_4511_A_direction = 0;
	BCF        display_4511_A_direction+0, BitPos(display_4511_A_direction+0)
;display_4511.h,21 :: 		display_4511_B_direction = 0;
	BCF        display_4511_B_direction+0, BitPos(display_4511_B_direction+0)
;display_4511.h,22 :: 		display_4511_C_direction = 0;
	BCF        display_4511_C_direction+0, BitPos(display_4511_C_direction+0)
;display_4511.h,23 :: 		display_4511_D_direction = 0;
	BCF        display_4511_D_direction+0, BitPos(display_4511_D_direction+0)
;display_4511.h,26 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,27 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,28 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,29 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,30 :: 		}
	RETURN
; end of _display_4511_init

_display_4511_out:

;display_4511.h,33 :: 		void display_4511_out(unsigned char num){
;display_4511.h,34 :: 		switch(num){
	GOTO       L_display_4511_out0
;display_4511.h,35 :: 		case 0:
L_display_4511_out2:
;display_4511.h,36 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,37 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,38 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,39 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,40 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,41 :: 		case 1:
L_display_4511_out3:
;display_4511.h,42 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,43 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,44 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,45 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,46 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,47 :: 		case 2:
L_display_4511_out4:
;display_4511.h,48 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,49 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,50 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,51 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,52 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,53 :: 		case 3:
L_display_4511_out5:
;display_4511.h,54 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,55 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,56 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,57 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,58 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,59 :: 		case 4:
L_display_4511_out6:
;display_4511.h,60 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,61 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,62 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,63 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,64 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,65 :: 		case 5:
L_display_4511_out7:
;display_4511.h,66 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,67 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,68 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,69 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,70 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,71 :: 		case 6:
L_display_4511_out8:
;display_4511.h,72 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,73 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,74 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,75 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,76 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,77 :: 		case 7:
L_display_4511_out9:
;display_4511.h,78 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,79 :: 		display_4511_B = 1;
	BSF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,80 :: 		display_4511_C = 1;
	BSF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,81 :: 		display_4511_D = 0;
	BCF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,82 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,83 :: 		case 8:
L_display_4511_out10:
;display_4511.h,84 :: 		display_4511_A = 0;
	BCF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,85 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,86 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,87 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,88 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,89 :: 		case 9:
L_display_4511_out11:
;display_4511.h,90 :: 		display_4511_A = 1;
	BSF        display_4511_A+0, BitPos(display_4511_A+0)
;display_4511.h,91 :: 		display_4511_B = 0;
	BCF        display_4511_B+0, BitPos(display_4511_B+0)
;display_4511.h,92 :: 		display_4511_C = 0;
	BCF        display_4511_C+0, BitPos(display_4511_C+0)
;display_4511.h,93 :: 		display_4511_D = 1;
	BSF        display_4511_D+0, BitPos(display_4511_D+0)
;display_4511.h,94 :: 		break;
	GOTO       L_display_4511_out1
;display_4511.h,96 :: 		}
L_display_4511_out0:
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out2
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out3
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out4
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out5
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out6
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out7
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out8
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out9
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out10
	MOVF       FARG_display_4511_out_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_display_4511_out11
L_display_4511_out1:
;display_4511.h,97 :: 		}
	RETURN
; end of _display_4511_out

_main:

;VSaula044_Display_7Seg_4511_2.c,33 :: 		void main() {
;VSaula044_Display_7Seg_4511_2.c,34 :: 		display_4511_init();
	CALL       _display_4511_init+0
;VSaula044_Display_7Seg_4511_2.c,36 :: 		while(1){
L_main12:
;VSaula044_Display_7Seg_4511_2.c,37 :: 		for(i=0; i < 9; i++){
	CLRF       _i+0
L_main14:
	MOVLW      9
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;VSaula044_Display_7Seg_4511_2.c,38 :: 		display_4511_out(i);
	MOVF       _i+0, 0
	MOVWF      FARG_display_4511_out_num+0
	CALL       _display_4511_out+0
;VSaula044_Display_7Seg_4511_2.c,39 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;VSaula044_Display_7Seg_4511_2.c,37 :: 		for(i=0; i < 9; i++){
	INCF       _i+0, 1
;VSaula044_Display_7Seg_4511_2.c,40 :: 		}
	GOTO       L_main14
L_main15:
;VSaula044_Display_7Seg_4511_2.c,41 :: 		}
	GOTO       L_main12
;VSaula044_Display_7Seg_4511_2.c,43 :: 		}
	GOTO       $+0
; end of _main
