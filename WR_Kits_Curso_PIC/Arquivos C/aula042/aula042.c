/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descrição do Projeto:

            aula042 - PIC16F876A, CONTADOR DE PULSOS COM TIMER1 E LCD
            Fosc = 16MHz
            CM = Fosc/4 = 250ns
            TE = CM*PS*(65536 - CI[TRM1])
            
            Implementar um contador de pulsos (RC0 borda de subida), utilizando
            o temporizador Timer 1
            Mostrar a contagem em um display LCD

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
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

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
unsigned int pulse = 0;
char texto[7];

// --- programa principal --- //
void main() {
  CMCON = 0b00000111;   // desabilita comparadores internos

  T1CON = 0b00000011;   // T1CKPS1:T1CKPS0<5:4> 0:0 -> prescaler 1:1,
                        // TMR1CS<1> 1 -> clock externo pino RC0,
                        // TMR1ON<0> 1 -> Timer1 On
                        
  TMR1H = 0;            // carga inicial do registrador Timer 1
  TMR1L = 0;


  TRISB= 0;
  PORTB = 0;
  TRISC = 0b00000001;
  PORTC = 0;
  
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  


  while(1){
  
    pulse = (TMR1H << 8) + TMR1L;
    IntToStr(pulse, texto);
    Lcd_Out(1, 1, "    CONTADOR    ");
    Lcd_Out(2, 1, "Pulsos: ");
    Lcd_Out(2, 9, texto);
    if(pulse%10 == 0){
      RC4_bit = ~RC4_bit;
      delay_ms(200);
    }
    
    
  }


}

// --- definição das funções auxiliares --- //