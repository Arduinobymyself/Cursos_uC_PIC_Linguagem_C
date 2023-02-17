
// RE2 = RS -> 0: comando, 1: caractere
// RE1 = EN -> envio de comando
// PORTD -> barramento de dados

#define RS PORTE.RE2
#define EN PORTE.RE1
#define limpaLCD 0x01
#define linha_1 0x80
#define linha_2 0xC0

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
  RS = 1;

   /*
  // modo tradicional
  PORTE.RE2 = 1;         // envio de caracteres

  // letra F em ASCII 0x46
  PORTD = 0b01000000;          // MSB
  pulse_en();
  PORTD = 0b01100000;          // LSB
  pulse_en();
  */
  
  
  
  // um único caractere
  //letra = 'F';  // 0b 0100 0110
  //lcd_texto(letra);


  while(1){

    //modo avançado (com as funções)
    lcd_comando(linha_1);
    print("  ABMS Telecom  ");
    
    lcd_comando(linha_2);
    print(" Seja Bem Vindo!");
    
    delay_ms(2000);
    
    lcd_comando(limpaLCD);
   
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
 EN = 0;
 delay_ms(1);
 EN = 1;
 delay_ms(1);
 EN = 0;
 delay_ms(1);
}

void output(char dado){
  PORTD = dado;
  pulse_en();
}

void inicializa_lcd(){
  delay_ms(40);
  RS = 0; // modo enviar comandos

  // seleciona modo 4 bits    0x03 e 0x02
  output(0b00110000);
  pulse_en();
  pulse_en();
  delay_ms(1);
  output(0b00100000);
  pulse_en();
  pulse_en();
  delay_ms(1);

  // seleção matraiz 5x7 e modo 4 bits 0x28
  output(0b00100000);
  output(0b10000000);
  delay_ms(15);

  // sentido de deslocamento cursor para a direita  0x06
  output(0b00000000);
  output(0b01100000);
  delay_ms(15);

  // cursor desativado 0x0C, ativado 0x0E
  output(0b00000000);
  output(0b11100000);
  delay_ms(15);

  // limpa e vai para home 0x01
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
  RS = 1;
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
  RS = 0;
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