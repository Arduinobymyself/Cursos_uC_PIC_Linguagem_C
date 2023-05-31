// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Mai 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
  
  Aula 048: PIC 16F628A Modo Captura
  Clock 4Mhz Ciclo de Máquina: 1us

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings
sbit LCD_RS at RB1_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //
char flag0 = 0x00;
unsigned int time1, time2;
char txt[16];
char* text = "Modo de Captura";

// --- programa principal --- //
void main() {
  CMCON = 0X07; // desabilita comparadores
  
  T1CON = 0x01; // habilita contagem do Timer1, com prescaler 1:1 (incrementa a cada 1us)
  CCP1CON = 0x05; // modo de captura a cada borda de subida
  
  CCP1IE_bit = 1; // habilita interrupção por módulo CCP
  GIE_bit = 1; // habilita interrupção global
  PEIE_bit = 1; // habilita interrupção por periféricos

  
  TRISA = 0XFF; // PORT A como entrada
  PORTA = 0XFF; // inicializa o PORT A
  TRISB = 0x09; // RB0 e RB3(CCP1) como entrada digital (0b00001001)
  PORTB = 0x09; // inicializa o PORT B
  
  LCD_Init(); // inicializa o LCD
  LCD_Cmd(_LCD_CURSOR_OFF);
  LCD_Cmd(_LCD_CLEAR);
  LCD_Out(1,1, text);
  

  

  while(1)
  {
    time2 = time2 - time1; // calcula a largura do pulso
    IntToStr(time2, txt); // converte inteiro para string
    LCD_Out(2,1, txt);    // mostra no LCD
    flag0.B1 = 0; // valida lfag para nova captura
    
  }

}

// --- definição das funções auxiliares --- //

void interrupt(){
    if(CCP1IF_bit){ // houve interrupção via CCP1
      if(!flag0.B0){ //
        time1 = (CCPR1H << 8) + CCPR1L; // captura o tempo inicial
        // fazer o shift-left de 8 bits é o mesmo que multiplicar por 256 (2^8)
        // somando a parte baixa, temos o valor total dos dois registradores
        flag0.B0 = 1; // invalida essa condição
      } else {
        time2 =  (CCPR1H << 8) + CCPR1L; // captura o tempo posterior enquanto esteve em high
        flag0.B0 = 0;  // revalida a condição
        flag0.B1 = 1;  // usado no loop infinito
      }
      CCP1IE_bit = 0; // desliga interrupção por CCP
      CCP1CON.B0 = ~CCP1CON.B0; // troca entre borda de subida e descida
      CCP1IE_bit = 1; // religa interrupção por CCP

      CCP1IF_bit = 0;  // limpa flag para nova captura
    }
}