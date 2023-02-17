#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_4bits.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_4bits.c"
 void config_mcu();
 void pulse_en();
 void output(char dado);
 void inicializa_lcd();
 void lcd_nibble(char dado);
 void lcd_texto(char letra);
 void print(char texto[16]);
 void lcd_comando(char comando);
 char IntToChar(int numero);



void main() {

 config_mcu();
 inicializa_lcd();
  PORTE.RE2  = 1;
#line 48 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_4bits.c"
 while(1){


 lcd_comando( 0x80 );
 print("  ABMS Telecom  ");

 lcd_comando( 0xC0 );
 print(" Seja Bem Vindo!");

 delay_ms(2000);

 lcd_comando( 0x01 );

 delay_ms(2000);

 print(IntToChar(123));

 delay_ms(2000);


 }






}




void config_mcu(){
 ADCON1 = 7;
 TRISD = 0;
 TRISE = 0;
}

void pulse_en(){
  PORTE.RE1  = 0;
 delay_ms(1);
  PORTE.RE1  = 1;
 delay_ms(1);
  PORTE.RE1  = 0;
 delay_ms(1);
}

void output(char dado){
 PORTD = dado;
 pulse_en();
}

void inicializa_lcd(){
 delay_ms(40);
  PORTE.RE2  = 0;


 output(0b00110000);
 pulse_en();
 pulse_en();
 delay_ms(1);
 output(0b00100000);
 pulse_en();
 pulse_en();
 delay_ms(1);


 output(0b00100000);
 output(0b10000000);
 delay_ms(15);


 output(0b00000000);
 output(0b01100000);
 delay_ms(15);


 output(0b00000000);
 output(0b11100000);
 delay_ms(15);


 output(0b00000000);
 output(0b00010000);
 delay_ms(15);

}

void lcd_nibble(char dado){
 PORTD.RD4 = dado.f0;
 PORTD.RD5 = dado.f1;
 PORTD.RD6 = dado.f2;
 PORTD.RD7 = dado.f3;
 pulse_en();
}

void lcd_texto(char letra){
  PORTE.RE2  = 1;
 delay_ms(2);
 lcd_nibble(letra>>4);
 lcd_nibble(letra&0x0F);
 delay_ms(2);
}

void print(char texto[16]){
 char i;
 for(i = 0; i < 15; i++){
 lcd_texto(texto[i]);
 }
}

void lcd_comando(char comando){
  PORTE.RE2  = 0;
 delay_ms(2);
 lcd_nibble(comando>>4);
 lcd_nibble(comando&0x0F);
 delay_ms(2);
}

char IntToChar(int numero){
 int resto, valor;
 char resultado[4];

 resultado[4] = 0;

 valor = numero/100;
 resultado[3] = valor+'0';

 valor = numero/10;
 resto = valor%10;
 resultado[2] = valor+'0';

 valor = numero/1;
 resto = valor%10;
 resultado[1] = valor+'0';

 return resultado;

}
