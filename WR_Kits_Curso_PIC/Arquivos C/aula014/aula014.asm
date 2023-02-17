
_main:

;aula014.c,30 :: 		void main() {
;aula014.c,32 :: 		unsigned char segmento[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
;aula014.c,34 :: 		cmcon = 0x07; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;aula014.c,35 :: 		trisA = 0x00;
	CLRF       TRISA+0
;aula014.c,36 :: 		trisB = 0x00; // todo o port B configurado como saída digital
	CLRF       TRISB+0
;aula014.c,37 :: 		portA = 0x00;
	CLRF       PORTA+0
;aula014.c,38 :: 		portB = 0x00; // port B inicia em nível baixo
	CLRF       PORTB+0
;aula014.c,40 :: 		while(1)
L_main0:
;aula014.c,42 :: 		counter1++;
	INCF       _counter1+0, 1
;aula014.c,43 :: 		nibbleDown(counter1);
	MOVF       _counter1+0, 0
	MOVWF      FARG_nibbleDown_number+0
	CALL       _nibbleDown+0
;aula014.c,44 :: 		nibbleUp(counter2);
	MOVF       _counter2+0, 0
	MOVWF      FARG_nibbleUp_number+0
	CALL       _nibbleUp+0
;aula014.c,46 :: 		if(counter1 == 10)
	MOVF       _counter1+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;aula014.c,48 :: 		counter2++;
	INCF       _counter2+0, 1
;aula014.c,49 :: 		counter1 = 0;
	CLRF       _counter1+0
;aula014.c,50 :: 		nibbleDown(counter1);
	CLRF       FARG_nibbleDown_number+0
	CALL       _nibbleDown+0
;aula014.c,51 :: 		nibbleUp(counter2);
	MOVF       _counter2+0, 0
	MOVWF      FARG_nibbleUp_number+0
	CALL       _nibbleUp+0
;aula014.c,52 :: 		if(counter2 == 10)
	MOVF       _counter2+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;aula014.c,54 :: 		counter2 = 0;
	CLRF       _counter2+0
;aula014.c,55 :: 		nibbleUp(counter2);
	CLRF       FARG_nibbleUp_number+0
	CALL       _nibbleUp+0
;aula014.c,56 :: 		}
L_main3:
;aula014.c,57 :: 		}
L_main2:
;aula014.c,58 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;aula014.c,59 :: 		}
	GOTO       L_main0
;aula014.c,60 :: 		}
	GOTO       $+0
; end of _main

_nibbleDown:

;aula014.c,63 :: 		void nibbleDown(char number)
;aula014.c,65 :: 		switch(number)
	GOTO       L_nibbleDown5
;aula014.c,67 :: 		case 0:
L_nibbleDown7:
;aula014.c,68 :: 		rb0_bit = 0x00;
	BCF        RB0_bit+0, 0
;aula014.c,69 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,70 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,71 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,72 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,73 :: 		case 1:
L_nibbleDown8:
;aula014.c,74 :: 		rb0_bit = 0x01;
	BSF        RB0_bit+0, 0
;aula014.c,75 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,76 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,77 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,78 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,79 :: 		case 2:
L_nibbleDown9:
;aula014.c,80 :: 		rb0_bit = 0x00;
	BCF        RB0_bit+0, 0
;aula014.c,81 :: 		rb1_bit = 0x01;
	BSF        RB1_bit+0, 1
;aula014.c,82 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,83 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,84 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,85 :: 		case 3:
L_nibbleDown10:
;aula014.c,86 :: 		rb0_bit = 0x01;
	BSF        RB0_bit+0, 0
;aula014.c,87 :: 		rb1_bit = 0x01;
	BSF        RB1_bit+0, 1
;aula014.c,88 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,89 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,90 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,91 :: 		case 4:
L_nibbleDown11:
;aula014.c,92 :: 		rb0_bit = 0x00;
	BCF        RB0_bit+0, 0
;aula014.c,93 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,94 :: 		rb2_bit = 0x01;
	BSF        RB2_bit+0, 2
;aula014.c,95 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,96 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,97 :: 		case 5:
L_nibbleDown12:
;aula014.c,98 :: 		rb0_bit = 0x01;
	BSF        RB0_bit+0, 0
;aula014.c,99 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,100 :: 		rb2_bit = 0x01;
	BSF        RB2_bit+0, 2
;aula014.c,101 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,102 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,103 :: 		case 6:
L_nibbleDown13:
;aula014.c,104 :: 		rb0_bit = 0x00;
	BCF        RB0_bit+0, 0
;aula014.c,105 :: 		rb1_bit = 0x01;
	BSF        RB1_bit+0, 1
;aula014.c,106 :: 		rb2_bit = 0x01;
	BSF        RB2_bit+0, 2
;aula014.c,107 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,108 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,109 :: 		case 7:
L_nibbleDown14:
;aula014.c,110 :: 		rb0_bit = 0x01;
	BSF        RB0_bit+0, 0
;aula014.c,111 :: 		rb1_bit = 0x01;
	BSF        RB1_bit+0, 1
;aula014.c,112 :: 		rb2_bit = 0x01;
	BSF        RB2_bit+0, 2
;aula014.c,113 :: 		rb3_bit = 0x00;
	BCF        RB3_bit+0, 3
;aula014.c,114 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,115 :: 		case 8:
L_nibbleDown15:
;aula014.c,116 :: 		rb0_bit = 0x00;
	BCF        RB0_bit+0, 0
;aula014.c,117 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,118 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,119 :: 		rb3_bit = 0x01;
	BSF        RB3_bit+0, 3
;aula014.c,120 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,121 :: 		case 9:
L_nibbleDown16:
;aula014.c,122 :: 		rb0_bit = 0x01;
	BSF        RB0_bit+0, 0
;aula014.c,123 :: 		rb1_bit = 0x00;
	BCF        RB1_bit+0, 1
;aula014.c,124 :: 		rb2_bit = 0x00;
	BCF        RB2_bit+0, 2
;aula014.c,125 :: 		rb3_bit = 0x01;
	BSF        RB3_bit+0, 3
;aula014.c,126 :: 		break;
	GOTO       L_nibbleDown6
;aula014.c,127 :: 		}
L_nibbleDown5:
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown7
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown8
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown9
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown10
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown11
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown12
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown13
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown14
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown15
	MOVF       FARG_nibbleDown_number+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleDown16
L_nibbleDown6:
;aula014.c,128 :: 		}
	RETURN
; end of _nibbleDown

_nibbleUp:

;aula014.c,130 :: 		void nibbleUp(char number)
;aula014.c,132 :: 		switch(number)
	GOTO       L_nibbleUp17
;aula014.c,134 :: 		case 0:
L_nibbleUp19:
;aula014.c,135 :: 		rb4_bit = 0x00;
	BCF        RB4_bit+0, 4
;aula014.c,136 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,137 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,138 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,139 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,140 :: 		case 1:
L_nibbleUp20:
;aula014.c,141 :: 		rb4_bit = 0x01;
	BSF        RB4_bit+0, 4
;aula014.c,142 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,143 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,144 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,145 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,146 :: 		case 2:
L_nibbleUp21:
;aula014.c,147 :: 		rb4_bit = 0x00;
	BCF        RB4_bit+0, 4
;aula014.c,148 :: 		rb5_bit = 0x01;
	BSF        RB5_bit+0, 5
;aula014.c,149 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,150 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,151 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,152 :: 		case 3:
L_nibbleUp22:
;aula014.c,153 :: 		rb4_bit = 0x01;
	BSF        RB4_bit+0, 4
;aula014.c,154 :: 		rb5_bit = 0x01;
	BSF        RB5_bit+0, 5
;aula014.c,155 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,156 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,157 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,158 :: 		case 4:
L_nibbleUp23:
;aula014.c,159 :: 		rb4_bit = 0x00;
	BCF        RB4_bit+0, 4
;aula014.c,160 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,161 :: 		rb6_bit = 0x01;
	BSF        RB6_bit+0, 6
;aula014.c,162 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,163 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,164 :: 		case 5:
L_nibbleUp24:
;aula014.c,165 :: 		rb4_bit = 0x01;
	BSF        RB4_bit+0, 4
;aula014.c,166 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,167 :: 		rb6_bit = 0x01;
	BSF        RB6_bit+0, 6
;aula014.c,168 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,169 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,170 :: 		case 6:
L_nibbleUp25:
;aula014.c,171 :: 		rb4_bit = 0x00;
	BCF        RB4_bit+0, 4
;aula014.c,172 :: 		rb5_bit = 0x01;
	BSF        RB5_bit+0, 5
;aula014.c,173 :: 		rb6_bit = 0x01;
	BSF        RB6_bit+0, 6
;aula014.c,174 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,175 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,176 :: 		case 7:
L_nibbleUp26:
;aula014.c,177 :: 		rb4_bit = 0x01;
	BSF        RB4_bit+0, 4
;aula014.c,178 :: 		rb5_bit = 0x01;
	BSF        RB5_bit+0, 5
;aula014.c,179 :: 		rb6_bit = 0x01;
	BSF        RB6_bit+0, 6
;aula014.c,180 :: 		rb7_bit = 0x00;
	BCF        RB7_bit+0, 7
;aula014.c,181 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,182 :: 		case 8:
L_nibbleUp27:
;aula014.c,183 :: 		rb4_bit = 0x00;
	BCF        RB4_bit+0, 4
;aula014.c,184 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,185 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,186 :: 		rb7_bit = 0x01;
	BSF        RB7_bit+0, 7
;aula014.c,187 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,188 :: 		case 9:
L_nibbleUp28:
;aula014.c,189 :: 		rb4_bit = 0x01;
	BSF        RB4_bit+0, 4
;aula014.c,190 :: 		rb5_bit = 0x00;
	BCF        RB5_bit+0, 5
;aula014.c,191 :: 		rb6_bit = 0x00;
	BCF        RB6_bit+0, 6
;aula014.c,192 :: 		rb7_bit = 0x01;
	BSF        RB7_bit+0, 7
;aula014.c,193 :: 		break;
	GOTO       L_nibbleUp18
;aula014.c,194 :: 		}
L_nibbleUp17:
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp19
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp20
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp21
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp22
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp23
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp24
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp25
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp26
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp27
	MOVF       FARG_nibbleUp_number+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_nibbleUp28
L_nibbleUp18:
;aula014.c,195 :: 		}
	RETURN
; end of _nibbleUp
