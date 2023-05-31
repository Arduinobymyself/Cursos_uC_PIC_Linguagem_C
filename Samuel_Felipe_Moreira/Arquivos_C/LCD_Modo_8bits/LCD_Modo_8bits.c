
// RE2 = RS -> 0: comando, 1: caractere
// RE1 = EN -> envio de comando
// PORTD -> barramento de dados

#define RS PORTE.RE2
#define EN PORTE.RE1
#define limpaLCD 0x01
#define linha_1 0x80
#define linha_2 0xC0


void config_mcu(){
  ADCON0 = 0; // desaativa o conversor AD
  ADCON1 = 7; // todas as entradas como digital
  TRISD = 0;  // barramento de dados PORTD como saída
  TRISE = 0;  // barramento de controle PORT B como saída
}

void pulse_en(){
 EN = 0;
 delay_ms(1);
 EN = 1;
 delay_ms(1);
 EN = 0;
 delay_ms(1);
}

void inicializa_lcd(){
  delay_ms(40);
  RS = 0;
  
  PORTD = 0x38;       // seleção matraiz 5x7 e modo 8 bits
  pulse_en();         // envia comando
  delay_ms(15);
  
  PORTD = 0x38;       // seleção matraiz 5x7 e modo 8 bits
  pulse_en();         // envia comando
  delay_ms(15);
  
  PORTD = 0x06;       // sentido de deslocamento cursor para a direita
  pulse_en();         // envia comando
  delay_ms(15);
  
  PORTD = 0x0C;       // cursor desativado 0x0C, ativado 0x0E
  pulse_en();         // envia comando
  delay_ms(15);
  
  PORTD = 0x01;       // limpa e vai para home
  pulse_en();         // envia comando
  delay_ms(15);

}

void lcd_texto(char letra){
  RS = 1;
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
RS = 0;
PORTD = comando;
pulse_en();
}

void main() {
  config_mcu();
  inicializa_lcd();
  
  /*
  // modo tradicional
  PORTE.RE2 = 1;         // envio de caracteres
  
  PORTD = 0b01000001;    // letra A em ASCII
  pulse_en();
  
  PORTD = 0x42;          // letra B em ASCII
  pulse_en();
  
  PORTE.RE2 = 0;         // envio de comandos
  
  PORTD = 0xC0;          // posiciona na linha 2 coluna 1
  pulse_en();
  
  PORTE.RE2 = 1;         // envio de caracteres
  
  PORTD = 0x43;          // letra C em ASCII
  pulse_en();
  */
  
  while(1){
    //modo avançado (com as funções)
    lcd_comando(linha_1);
    print("  ABMS Telecom  ");
    lcd_comando(linha_2);
    print(" Seja Bem Vindo!");
    delay_ms(2000);
    lcd_comando(limpaLCD);
    delay_ms(2000);
  }

  
  
}