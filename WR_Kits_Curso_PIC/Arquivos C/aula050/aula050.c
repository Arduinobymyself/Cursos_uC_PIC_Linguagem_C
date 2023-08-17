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
void trigger();

// --- variáveis globais --- //
char txt[7];
unsigned char Tempo_H, Tempo_L;
unsigned int Periodo, Distancia;

// --- programa principal --- //
void main() {
  CMCON = 0X07;                // desabilita compardores internos
  TRISA = 0XFF;                // configura o PORT A como entrada
  TRISB = 0X08;                // configura RB3 como entrada 0b00001000
  PORTA = 0XFF;                // inicializa o PORT A
  PORTB = 0X00;                // inicializa o PORT B
  INTCON = 0XC0;               // habilita interrupção global e por periféricos
  TMR1IE_bit = 0X00;           // desabilita interrupçãoes por TMR1
  CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
  CCP1CON = 0X05;              // configura captura por borda de subida

  T1CKPS1_bit = 0X00;          // prescaler TMR1 1:1
  T1CKPS0_bit = 0X00;          //
  TMR1CS_bit = 0X00;           // clock: Fosc/4
  TMR1ON_bit = 0X00;           // para contagem do TIMER 1

  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "Distancia:");
  Lcd_Out(2, 14, "cm");
  delay_ms(100);

  while(1)
  {
    trigger();
    delay_ms(100);                             // taxa de atualização
    Periodo = (Tempo_H << 8) + Tempo_L;        // calcula período em us
    Distancia = Periodo / 58;                  // converte o período para cm
    IntToStr(Distancia, txt);
    Lcd_Out(2, 8, txt);
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(CCP1IF_bit && CCP1CON.B0){
    CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
    CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
    CCP1CON = 0x04;                     // configura captura por borda de descida
    CCP1IE_bit = 0x01;                  // abilita interrupção do periférioco CCP
    TMR1H = 0x00;                       // zera registrador TMR1
    TMR1L = 0x00;
    TMR1ON_bit = 0x01;                  // habilita contagem de tempo
  } else if(CCP1IF_bit){
    CCP1IF_bit = 0x00;                  // limpa a flag para nova captura
    TMR1ON_bit = 0x00;                  // habilita contagem de tempo
    CCP1IE_bit = 0x00;                  // desabilita interrupção do periférioco CCP
    CCP1CON = 0x05;                     // configura captura por borda de subida
    CCP1IE_bit = 0x01;                  // habilita interrupção por periférico CCP
    Tempo_H = CCPR1H;                     // valor do tempo em us é armazenado
    Tempo_L = CCPR1L;

  }
}

void trigger(){
  Trig = 0x01;                          // RB2 em nível alto
  delay_us(10);                         // pulso de 10us
  Trig = 0x00;                          // RB2 em nível baixo
}