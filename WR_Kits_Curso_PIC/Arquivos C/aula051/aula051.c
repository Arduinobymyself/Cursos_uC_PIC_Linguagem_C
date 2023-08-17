// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

  Aula050: Utilizando sensor de ultrassom HC-SR04 com PIC e LCD

  Clock: 4MHz
  Ciclo de Máquina: 1us
  Sistema Embarcado PARADOXUS 9

  Sensor HC-SR04:
  VCC    1
  TRIG   2       RB2
  ECHO   3       RB3/CCP
  GND    4

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

#define L1            RA3_bit
#define L2            RA2_bit
#define S1            RA1_bit
#define S2            RA0_bit
#define Trig          RB2_bit


// --- protótipo das funçãoes --- //


// --- variáveis globais --- //
char txt[12];
char flag0 = 0x00;
unsigned int time1, time2;
unsigned long Frequencia;
char* text1 = "Frequencimetro";
char* text2 = "Hz";


// --- programa principal --- //
void main() {
  CMCON = 0X07;                // desabilita compardores internos
  
  T1CON = 0X01;                // habilita contagem do Timer 1, com prescaler
  CCP1CON = 0X07;              // configura captura a cada 16 bordas de subida
  CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
  GIE_bit = 0x01;              // habilita interrupção global
  PEIE_bit = 0x01;             // habilita interrupção por periféricos
  
  TRISA = 0XFF;                // configura o PORT A como entrada
  TRISB = 0X0C;                // configura RB2 e RB3 como entrada 0b00001100
  PORTA = 0XFF;                // inicializa o PORT A
  PORTB = 0X00;                // inicializa o PORT B

  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, text1);
  Lcd_Out(2, 14, text2);
  delay_ms(100);

  while(1)
  {
    time2 = abs(time2 - time1);              // calcula o tempo de 16 períodos
    time2 = (time2) >> 4;                    // divide o valor por 16 (2^4) para obter o tempo de um período
    Frequencia = 1/ (time2 * 1E-6);          // converte período para frequência em Hz
    LongToStr(Frequencia, txt);
    Lcd_Out(2, 1, txt);
    flag0.B1 - 0x00;                         // limpa flag
    delay_ms(100);
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(CCP1IF_bit){
    CCP1IF_bit = 0x00;                      // limpa flag para nova captura
    if(!flag0.B0){
      time1 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 1
      flag0.B0 = 0x01;
    } else {
      time2 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 2
      flag0.B0 = 0x00;
      flag0.B1 = 0x01;
    }
  }
}
