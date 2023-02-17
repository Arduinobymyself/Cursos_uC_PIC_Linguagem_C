
_battery0:

;VSaula019.c,50 :: 		void battery0(char pos_row, char pos_char) {
;VSaula019.c,52 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,53 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryEmpty[i]);
	CLRF       battery0_i_L0+0
L_battery00:
	MOVF       battery0_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_battery01
	MOVF       battery0_i_L0+0, 0
	ADDLW      _batteryEmpty+0
	MOVWF      R0+0
	MOVLW      hi_addr(_batteryEmpty+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       battery0_i_L0+0, 1
	GOTO       L_battery00
L_battery01:
;VSaula019.c,54 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,55 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_battery0_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_battery0_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,56 :: 		}
L_end_battery0:
	RETURN
; end of _battery0

_battery1:

;VSaula019.c,60 :: 		void battery1(char pos_row, char pos_char) {
;VSaula019.c,62 :: 		Lcd_Cmd(72);
	MOVLW      72
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,63 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryMedium[i]);
	CLRF       battery1_i_L0+0
L_battery13:
	MOVF       battery1_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_battery14
	MOVF       battery1_i_L0+0, 0
	ADDLW      _batteryMedium+0
	MOVWF      R0+0
	MOVLW      hi_addr(_batteryMedium+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       battery1_i_L0+0, 1
	GOTO       L_battery13
L_battery14:
;VSaula019.c,64 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,65 :: 		Lcd_Chr(pos_row, pos_char, 1);
	MOVF       FARG_battery1_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_battery1_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,66 :: 		}
L_end_battery1:
	RETURN
; end of _battery1

_battery2:

;VSaula019.c,69 :: 		void battery2(char pos_row, char pos_char) {
;VSaula019.c,71 :: 		Lcd_Cmd(80);
	MOVLW      80
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,72 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryFull[i]);
	CLRF       battery2_i_L0+0
L_battery26:
	MOVF       battery2_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_battery27
	MOVF       battery2_i_L0+0, 0
	ADDLW      _batteryFull+0
	MOVWF      R0+0
	MOVLW      hi_addr(_batteryFull+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       battery2_i_L0+0, 1
	GOTO       L_battery26
L_battery27:
;VSaula019.c,73 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,74 :: 		Lcd_Chr(pos_row, pos_char, 2);
	MOVF       FARG_battery2_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_battery2_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,75 :: 		}
L_end_battery2:
	RETURN
; end of _battery2

_emoticon1:

;VSaula019.c,79 :: 		void emoticon1(char pos_row, char pos_char) {
;VSaula019.c,81 :: 		Lcd_Cmd(88);
	MOVLW      88
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,82 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(smille[i]);
	CLRF       emoticon1_i_L0+0
L_emoticon19:
	MOVF       emoticon1_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_emoticon110
	MOVF       emoticon1_i_L0+0, 0
	ADDLW      _smille+0
	MOVWF      R0+0
	MOVLW      hi_addr(_smille+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       emoticon1_i_L0+0, 1
	GOTO       L_emoticon19
L_emoticon110:
;VSaula019.c,83 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,84 :: 		Lcd_Chr(pos_row, pos_char, 3);
	MOVF       FARG_emoticon1_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_emoticon1_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,85 :: 		}
L_end_emoticon1:
	RETURN
; end of _emoticon1

_heart1:

;VSaula019.c,89 :: 		void heart1(char pos_row, char pos_char) {
;VSaula019.c,91 :: 		Lcd_Cmd(96);
	MOVLW      96
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,92 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(heart[i]);
	CLRF       heart1_i_L0+0
L_heart112:
	MOVF       heart1_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_heart113
	MOVF       heart1_i_L0+0, 0
	ADDLW      _heart+0
	MOVWF      R0+0
	MOVLW      hi_addr(_heart+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       heart1_i_L0+0, 1
	GOTO       L_heart112
L_heart113:
;VSaula019.c,93 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,94 :: 		Lcd_Chr(pos_row, pos_char, 4);
	MOVF       FARG_heart1_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_heart1_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,95 :: 		}
L_end_heart1:
	RETURN
; end of _heart1

_speaker1:

;VSaula019.c,99 :: 		void speaker1(char pos_row, char pos_char) {
;VSaula019.c,101 :: 		Lcd_Cmd(104);
	MOVLW      104
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,102 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(speaker[i]);
	CLRF       speaker1_i_L0+0
L_speaker115:
	MOVF       speaker1_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_speaker116
	MOVF       speaker1_i_L0+0, 0
	ADDLW      _speaker+0
	MOVWF      R0+0
	MOVLW      hi_addr(_speaker+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       speaker1_i_L0+0, 1
	GOTO       L_speaker115
L_speaker116:
;VSaula019.c,103 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,104 :: 		Lcd_Chr(pos_row, pos_char, 5);
	MOVF       FARG_speaker1_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_speaker1_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,105 :: 		}
L_end_speaker1:
	RETURN
; end of _speaker1

_emoticon2:

;VSaula019.c,109 :: 		void emoticon2(char pos_row, char pos_char) {
;VSaula019.c,111 :: 		Lcd_Cmd(112);
	MOVLW      112
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,112 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(smille2[i]);
	CLRF       emoticon2_i_L0+0
L_emoticon218:
	MOVF       emoticon2_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_emoticon219
	MOVF       emoticon2_i_L0+0, 0
	ADDLW      _smille2+0
	MOVWF      R0+0
	MOVLW      hi_addr(_smille2+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       emoticon2_i_L0+0, 1
	GOTO       L_emoticon218
L_emoticon219:
;VSaula019.c,113 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,114 :: 		Lcd_Chr(pos_row, pos_char, 6);
	MOVF       FARG_emoticon2_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_emoticon2_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,115 :: 		}
L_end_emoticon2:
	RETURN
; end of _emoticon2

_cadeado1:

;VSaula019.c,119 :: 		void cadeado1(char pos_row, char pos_char) {
;VSaula019.c,121 :: 		Lcd_Cmd(120);
	MOVLW      120
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,122 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(cadeado[i]);
	CLRF       cadeado1_i_L0+0
L_cadeado121:
	MOVF       cadeado1_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_cadeado122
	MOVF       cadeado1_i_L0+0, 0
	ADDLW      _cadeado+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cadeado+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       cadeado1_i_L0+0, 1
	GOTO       L_cadeado121
L_cadeado122:
;VSaula019.c,123 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,124 :: 		Lcd_Chr(pos_row, pos_char, 7);
	MOVF       FARG_cadeado1_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_cadeado1_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;VSaula019.c,125 :: 		}
L_end_cadeado1:
	RETURN
; end of _cadeado1

_main:

;VSaula019.c,133 :: 		void main() {
;VSaula019.c,134 :: 		CMCON = 0x07;  // desliga os comparadores internos
	MOVLW      7
	MOVWF      CMCON+0
;VSaula019.c,135 :: 		TRISD = 0x00;  // port D configurado como saída digital
	CLRF       TRISD+0
;VSaula019.c,136 :: 		PORTD = 0x00;  // port D inicia em nível baixo
	CLRF       PORTD+0
;VSaula019.c,137 :: 		TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1
	MOVLW      3
	MOVWF      TRISB+0
;VSaula019.c,139 :: 		Lcd_Init();                 // inicializa o LCD
	CALL       _Lcd_Init+0
;VSaula019.c,140 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,141 :: 		Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;VSaula019.c,143 :: 		Lcd_Out(1, 1, texto1); // texto1 = "ABMS Telecom"
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;VSaula019.c,145 :: 		while(1){
L_main24:
;VSaula019.c,146 :: 		battery0(2, 3);
	MOVLW      2
	MOVWF      FARG_battery0_pos_row+0
	MOVLW      3
	MOVWF      FARG_battery0_pos_char+0
	CALL       _battery0+0
;VSaula019.c,147 :: 		battery1(2, 5);
	MOVLW      2
	MOVWF      FARG_battery1_pos_row+0
	MOVLW      5
	MOVWF      FARG_battery1_pos_char+0
	CALL       _battery1+0
;VSaula019.c,148 :: 		battery2(2, 7);
	MOVLW      2
	MOVWF      FARG_battery2_pos_row+0
	MOVLW      7
	MOVWF      FARG_battery2_pos_char+0
	CALL       _battery2+0
;VSaula019.c,149 :: 		emoticon1(2, 9);
	MOVLW      2
	MOVWF      FARG_emoticon1_pos_row+0
	MOVLW      9
	MOVWF      FARG_emoticon1_pos_char+0
	CALL       _emoticon1+0
;VSaula019.c,150 :: 		heart1(2, 11);
	MOVLW      2
	MOVWF      FARG_heart1_pos_row+0
	MOVLW      11
	MOVWF      FARG_heart1_pos_char+0
	CALL       _heart1+0
;VSaula019.c,151 :: 		emoticon2(2, 13);
	MOVLW      2
	MOVWF      FARG_emoticon2_pos_row+0
	MOVLW      13
	MOVWF      FARG_emoticon2_pos_char+0
	CALL       _emoticon2+0
;VSaula019.c,152 :: 		cadeado1(2, 15);
	MOVLW      2
	MOVWF      FARG_cadeado1_pos_row+0
	MOVLW      15
	MOVWF      FARG_cadeado1_pos_char+0
	CALL       _cadeado1+0
;VSaula019.c,153 :: 		}
	GOTO       L_main24
;VSaula019.c,155 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
