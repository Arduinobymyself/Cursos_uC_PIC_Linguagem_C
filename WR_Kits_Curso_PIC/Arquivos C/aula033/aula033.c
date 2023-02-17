// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
            PIC16F877A
            Fosc = 16MHz
            prescaler 1:256
            TE = CM*256*PS*(256-TMR0)
            aula033 - Gerador PWM Programável
*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// LCD module connections
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

// configurações do teclado
#define col_1 RB1_bit
#define col_2 RB2_bit
#define col_3 RB3_bit
#define row_A RB4_bit
#define row_B RB5_bit
#define row_C RB6_bit
#define row_D RB7_bit

// macro (concatena string com valor da dezena e da unidade do duty cycle
#define disp Lcd_Out(2, 1, "Valor Duty: "); \
             Lcd_Chr_CP(dezena+48); \
             Lcd_Chr_CP(unidade+48);


// --- protótipo das funçãoes --- //
void chrWrite(char number);
unsigned char StrToValue(char dez, char uni);

// --- variáveis globais --- //
char control = 1;
char *text = "PWM Config";
char value = 0;
char aux = 1;
char store = 0;
char dezena = 0;
char unidade = 0;

// --- rotina de interrupção --- //
void interrupt(){
  if(TMR0IF_bit){
    TMR0IF_bit = 0;
    TMR0 = 0;
    if(col_1 && control == 0x01){
      control = 0x02;
      col_1 = 0x00;
      col_2 = 0x01;
      col_3 = 0x01;
      if(!row_A)      chrWrite(1);
      else if(!row_B) chrWrite(4);
      else if(!row_C) chrWrite(7);
      else if(!row_D) value = 50; // força o duty para 50% tecla (*)
    }
    if(col_2 && control == 0x02){
      control = 0x03;
      col_1 = 0x01;
      col_2 = 0x00;
      col_3 = 0x01;
      if(!row_A)      chrWrite(2);
      else if(!row_B) chrWrite(5);
      else if(!row_C) chrWrite(8);
      else if(!row_D) chrWrite(0);
    }
    if(col_3 && control == 0x03){
      control = 0x01;
      col_1 = 0x01;
      col_2 = 0x01;
      col_3 = 0x00;
      if(!row_A)      chrWrite(3);
      else if(!row_B) chrWrite(6);
      else if(!row_C) chrWrite(9);
      else if(!row_D) aux = 0x00; // atualiza duty tecla (#)
    }
  }
}



// --- programa principal --- //
void main() {
  CMCON = 0X07;
  ADCON1 = 0x07;

  OPTION_REG = 0b10000111; // Timer 0 com ciclo de instrução, prescaler 1:256
  GIE_bit = 1;
  PEIE_bit = 1;
  TMR0IE_bit = 1;
  
  TMR0 = 0;
  
  TRISB = 0xF0; // nibble MSB do PORT B como entrada
  PORTB = 0xFF; // nibble MSB inicia em nível BAIXO
  TRISC = 0b11111011; // Saída RC2 PWM
  TRISD = 0b00000011; // Saídas para o LCD
  
  TRISA = 0X03;
  PORTA = 0X03;

  
  PWM1_Init(2000);
  
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 4, text);
  
  PWM1_Start();
  

  while(1){
    disp; // chama macro
    if(!aux){
      value = StrToValue(dezena, unidade);
      aux = 1;
      store = 0;
    }
    PWM1_Set_Duty((value*255)/100);
    delay_ms(100);
  }

}

// --- definição das funções auxiliares --- //
void chrWrite(char number){// atualiza valores de dezena e unidade
  if(store == 0){
    dezena = number;
    store = 1;
  } else {
    unidade = number;
  }
}

unsigned char StrToValue(char dez, char uni){// converte dezena e unidade em valor unico
  unsigned char result;
  result = (10*dez)+uni; // transforma 2 números individuais em um único número
  return result;
}