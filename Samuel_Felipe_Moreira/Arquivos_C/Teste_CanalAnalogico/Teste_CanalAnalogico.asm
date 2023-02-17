
_main:

;Teste_CanalAnalogico.c,33 :: 		void main() {
;Teste_CanalAnalogico.c,35 :: 		TRISB = 0;             //define portb como saida
	CLRF       TRISB+0
;Teste_CanalAnalogico.c,36 :: 		TRISD = 0;             //define portd como saida
	CLRF       TRISD+0
;Teste_CanalAnalogico.c,37 :: 		ADCON1 = 0x06;         //torna todos os pinos AD como i/o de uso geral 0b0000011x
	MOVLW      6
	MOVWF      ADCON1+0
;Teste_CanalAnalogico.c,38 :: 		Lcd_Init();            //inicializa lcd
	CALL       _Lcd_Init+0
;Teste_CanalAnalogico.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);   //apaga lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teste_CanalAnalogico.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);      //desliga cursor do lcd
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teste_CanalAnalogico.c,41 :: 		Lcd_Out(1, 1, "Canal AN0: ");  //escreve mansagem na linha 1, coluna 1 do lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Teste_CanalAnalogico+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teste_CanalAnalogico.c,42 :: 		delay_ms (10);                 //delay de 10ms
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
;Teste_CanalAnalogico.c,43 :: 		Lcd_Out(2, 1, "Canal AN1: "); //escreve mensagem na linha 2, coluna 1 do lcd
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Teste_CanalAnalogico+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teste_CanalAnalogico.c,44 :: 		delay_ms (10);                //delay 10 milisegundos
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
;Teste_CanalAnalogico.c,45 :: 		ADCON1 = 0b00000100;          //habilita canal A/D 0 e A/D 1 do PIC
	MOVLW      4
	MOVWF      ADCON1+0
;Teste_CanalAnalogico.c,46 :: 		TRISA = 0b00001111;           //define pinos como entrada
	MOVLW      15
	MOVWF      TRISA+0
;Teste_CanalAnalogico.c,48 :: 		do {
L_main2:
;Teste_CanalAnalogico.c,49 :: 		temp_res1 = Adc_Read(0);    //le canal ad0 do PIC e salva valor na variável temp_res
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res1+0
	MOVF       R0+1, 0
	MOVWF      _temp_res1+1
;Teste_CanalAnalogico.c,50 :: 		temp_res2 = Adc_Read(1);    //lê canal ad1 do PIC e salva valor na variável temp_res2
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res2+0
	MOVF       R0+1, 0
	MOVWF      _temp_res2+1
;Teste_CanalAnalogico.c,51 :: 		delay_us(10);               //delay de 10 microsegundos
	MOVLW      6
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	NOP
;Teste_CanalAnalogico.c,52 :: 		WordToStr(temp_res1, texto);//converte valor da conversão do ad0 para string
	MOVF       _temp_res1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _temp_res1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Teste_CanalAnalogico.c,53 :: 		Lcd_Out(1, 11, texto);      //escreve no lcd o valor da conversão do ad0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teste_CanalAnalogico.c,54 :: 		delay_us(10);               //delay de 10 us
	MOVLW      6
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	NOP
;Teste_CanalAnalogico.c,55 :: 		WordToStr(temp_res2, texto); //converte valor da conversão do ad1 para string
	MOVF       _temp_res2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _temp_res2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Teste_CanalAnalogico.c,56 :: 		Lcd_Out(2, 11, texto);       //escreve no lcd o valor da conversão do ad1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teste_CanalAnalogico.c,57 :: 		} while (1);
	GOTO       L_main2
;Teste_CanalAnalogico.c,59 :: 		}
	GOTO       $+0
; end of _main
