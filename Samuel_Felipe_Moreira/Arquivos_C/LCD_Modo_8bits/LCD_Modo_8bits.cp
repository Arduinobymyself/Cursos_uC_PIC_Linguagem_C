#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_8bits.c"
#line 13 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_8bits.c"
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

void inicializa_lcd(){
 delay_ms(40);
  PORTE.RE2  = 0;

 PORTD = 0x38;
 pulse_en();
 delay_ms(15);

 PORTD = 0x38;
 pulse_en();
 delay_ms(15);

 PORTD = 0x06;
 pulse_en();
 delay_ms(15);

 PORTD = 0x0C;
 pulse_en();
 delay_ms(15);

 PORTD = 0x01;
 pulse_en();
 delay_ms(15);

}

void lcd_texto(char letra){
  PORTE.RE2  = 1;
 PORTD = letra;
 pulse_en();
}

void print(char texto[16]){
 char i;
 for(i = 0; i < 15; i++){
 lcd_texto(texto[i]);
 }
}

void lcd_comando(int comando){
 PORTE.RE2  = 0;
PORTD = comando;
pulse_en();
}

void main() {
 config_mcu();
 inicializa_lcd();
#line 98 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/LCD_Modo_8bits.c"
 while(1){

 lcd_comando( 0x80 );
 print("  ABMS Telecom  ");
 lcd_comando( 0xC0 );
 print(" Seja Bem Vindo!");
 delay_ms(2000);
 lcd_comando( 0x01 );
 delay_ms(2000);
 }



}
