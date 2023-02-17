
// aula050 - M�dulo CCP - Compare Capture PWM

// CCP1 e CCP2
// pinos 17 e 16 respectivamente
// Compare e Capture registradores de 16 bits
// CCPR1H e CCPR1L
// utilizam o Timer 1, TMR1H e TMR1L

// modo Capture:
// captura a informa��o do pino CCP e armazena nos registradores
// a cada borda de descida ou subida
// a cada 4� borda de subida ou a cada 16� boda de descida

// modo compare:
// o pino CCP pode ser: resetado setada ou permanecer inalterado


// PWM registrador de 8 bits utiliza o Timer 2
// resolu��o de 10 bits
// gerado no pino CCP

// registrador de configura��o do CCP
// CCP1CON [--- --- CCPxX CCPxY CCPxM3 CCPxM2 CCPxM1 CCPxM0]
// 0000 - CCP desabilitado
// 0100 - captura a cada borda de descida
// 0101 - captura a cada borda de subida
// 0110 - captura a cada 4� borda de subida
// 0111 - captura a cada 16� borda de descida
// 1000 - compara��o, seta sa�da
// 1001 - compara��o, reseta a sa�da
// 1010 - compara��o, gera interrup��o sem afetar pino CCP
// 1011 - caompara��o, trigger de evento especial
// 11xx - PWM


unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;


void main() {

  TRISC = 0b00000000; // RC1/CCP2 como sa�da
  PORTC = 0b00000000; // inicia em n�vel baixo
  
  // configura��o do Timer 2
  T2CON = 0b00000100; // prescaler 1:1
                      // Tpwm = [PR2+1]*4*Tosc*PS
                      // Tpwm = [255+1]*4*4/8MHz*1
                      // Tpwm = 128us
                      // Fpwm = 1/Tpwm = 7,8125KHz
                      
                      // Duty-cycle = [CCPR1L:CCP1CON<5:4>]*Tosc*PS
                      // CCPR1L:CCP1COM<5:4> = 50d + 00 = 0b00110010 + 00 = 0b0011001000 = 200d
                      // Duty-cycle = 200*1/8MHz*1 = 25us
  // https://www.micro-examples.com/public/microex-navig/doc/097-pwm-calculator.html
                      
  PR2 = 255;

  // configura m�dulo CCP como PWM
  CCP2M3_bit = 1;
  CCP2M2_bit = 1;
  CCP2M1_bit = 1;
  CCP2M0_bit = 1;
  
  CCP2X_bit = 0;
  CCP2Y_bit = 0;
  CCPR2L = 50;



  while(1){



  }

}