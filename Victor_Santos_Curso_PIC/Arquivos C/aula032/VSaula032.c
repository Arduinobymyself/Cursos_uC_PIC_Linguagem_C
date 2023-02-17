 // Canal Vitor Santos
 // aulas 032 e 033
 // LM35 + LCD
 // modos de operção: leitura temp+ somente e leitura temp+/-

// Lcd pinout settings
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

unsigned int valorAD0 = 0;
unsigned int valorAD5 = 0;
unsigned int valorAD6 = 0;
signed int valorDif = 0;
char texto[6];

void Lcd_Print(char linha, char coluna, signed int valor);

const char character[] = {0,14,10,14,0,0,0,0};

void graus(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}




void main() {

  ADCON0 = 0b10100001;
  ADCON1 = 0b11000000;
  TRISA = 0b000000001;
  TRISE = 0b000000011;


  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_RETURN_HOME);
  Lcd_Cmd(_LCD_CLEAR);

  Lcd_Out(1, 1, "  ABMS Telecom  ");
  Lcd_Out(2, 1, " Seja Bem Vindo!");
  delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);
  
  Lcd_Out(1, 1, "LM35-1" );
  Lcd_Out(2, 1, "LM35-2" );


  while(1){
    

    
    valorAD0 = ADC_Get_Sample(0);
    valorAD5 = ADC_Get_Sample(5);
    valorAD6 = ADC_Get_Sample(6);

    valorAD0 = valorAD0*4.8876;   // 5000mv/1023 = 4.8876...
    Lcd_Print(1, 8, valorAD0);


    valorDif = valorAD5 - valorAD6;
    valorDif = valorDif*4.8876;   // 5000mv/1023 = 4.8876...
    Lcd_Print(2, 8, valorDif);

    delay_ms(100);
  }

}

void Lcd_Print(char linha, char coluna, signed int valor){
  if(valor < 0){
    Lcd_Chr(linha, coluna, '-');
    valor = valor * (-1);
  } else {
    Lcd_Chr(linha, coluna, ' ');
  }
  texto[0] = (valor/1000)%10+48;
  texto[1] = (valor/100)%10+48;
  texto[2] = (valor/10)%10+48;
  texto[3] = (valor/1)%10+48;

  Lcd_Chr(linha, coluna+1, texto[0]);
  Lcd_Chr(linha, coluna+2, texto[1]);
  Lcd_Chr(linha, coluna+3, texto[2]);
  graus(linha, coluna+4);
  Lcd_Chr_CP('C');
}