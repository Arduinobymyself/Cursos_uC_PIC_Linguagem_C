
// aula048 - Módulo CCP - Compare Capture PWM

// CCP1 e CCP2
// pinos 17 e 16 respectivamente
// Compare e Capture registradores de 16 bits
// CCPR1H e CCPR1L
// utilizam o Timer 1, TMR1H e TMR1L

// modo Capture:
// captura a informação do pino CCP e armazena nos registradores
// a cada borda de descida ou subida
// a cada 4ª borda de subida ou a cada 16ª boda de descida

// modo compare:
// o pino CCP pode ser: resetado setada ou permanecer inalterado


// PWM registrador de 8 bits utiliza o Timer 2
// resolução de 10 bits
// gerado no pino CCP

// registrador de configuração do CCP
// CCP1CON [--- --- CCPxX CCPxY CCPxM3 CCPxM2 CCPxM1 CCPxM0]
// 0000 - CCP desabilitado
// 0100 - captura a cada borda de descida
// 0101 - captura a cada borda de subida
// 0110 - captura a cada 4ª borda de subida
// 0111 - captura a cada 16ª borda de descida
// 1000 - comparação, seta saída
// 1001 - comparação, reseta a saída
// 1010 - comparação, gera interrupção sem afetar pino CCP
// 1011 - caomparação, trigger de evento especial
// 11xx - PWM


// RA0 CP1(-)
// RA3 CP1(+)
// RD0 LED sinaliza o CP1(out)
// RA1 CP2(-)
// RA2 CP2(+)
// RD7 LED sinaliza o CP2(out)





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

unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;

void interrupt();


void main() {

  TRISC = 0b00000100; // RC2/CCP1 como entrada
  
  T1CON = 0b00010000; // tempo de incremento do Timer 1 de 1us
                      // cristal 8 MHz, prescaler 1:2 valor máximo do tempo = 65ms
                      
  TMR1H = 0;
  TMR1L = 0;
  
  // configura módulo CCP como capture borda de subida
  CCP1M3_bit =0;
  CCP1M2_bit =1;
  CCP1M1_bit =0;
  CCP1M0_bit =1;
  

  // habilita interrupção
  INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
  TMR1IE_bit = 0; // não precisa habilitar a interrupção do Timer 1
  CCP1IE_bit = 1; // habilita interrupção por CCP1

  // inicialização do LCD
  LCD_Init();
  LCD_Cmd(_LCD_CLEAR);
  LCD_Cmd(_LCD_CURSOR_OFF);
  LCD_Out(1, 14, "us");
  LCD_Out(2, 14, "Hz");
  
  while(1){
  
    if(flag.b1){
      LongToStr((tempo), texto);
      Lcd_Out(1, 1, texto);
      freq = 1000000/(2*tempo);
      LongToStr(freq, texto);
      LCD_Out(2, 1, texto);
      flag.b1 = 0;
    }
    
  }

}


 void interrupt(){
 
   if(CCP1IF_bit){
     if(flag.b0){
       TMR1H = 0;
       TMR1L = 0;
       TMR1ON_bit = 1;
       CCP1M0_bit = 0; // configura módulo CCP para captura por borda de descida
       flag.b0 = 0;
     } else {
       TMR1ON_bit = 0;
       tempo = (TMR1H<<8)+TMR1L;
       CCP1M0_bit = 1; // configura módulo CCP para captura por borda de subida
       flag.b0 = 0;
       flag.b1 = 1;
     }
     CCP1IF_bit = 0;
   }

 }