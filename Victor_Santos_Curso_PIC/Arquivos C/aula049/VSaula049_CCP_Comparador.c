
// aula049 - M�dulo CCP - Compare Capture PWM

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

void interrupt();


void main() {

  TRISC = 0b00000000; // RC1/CCP2 como sa�da
  PORTC = 0b00000000; // inicia em n�vel baixo

  T1CON = 0b00010001; // tempo de incremento do Timer 1 de 1us
                      // cristal 8 MHz, prescaler 1:2 valor m�ximo do tempo = 65ms

  TMR1H = 0;
  TMR1L = 0;

  // configura m�dulo CCP como capture borda de subida
  CCP2M3_bit = 1;
  CCP2M2_bit = 0;
  CCP2M1_bit = 0;
  CCP2M0_bit = 0;


  // habilita interrup��o
  INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
                       // habilita interrup��o global e por perif�ricos
  TMR1IE_bit = 0; // n�o precisa habilitar a interrup��o do Timer 1
  CCP2IE_bit = 1; // habilita interrup��o por CCP2
  
  CCPR2H = 0x02;  // inicia o CCPR2 com valor 700
  CCPR2L = 0xBC;


  while(1){



  }

}


 void interrupt(){

   if(CCP2IF_bit){
     if(flag.b0){
       flag.b0 = 0;
       TMR1H = 0;
       TMR1L = 0;
       CCP2M0_bit = 1; // configura m�dulo CCP como compare para resetar o pino CCP
     } else {
       flag.b0 = 1;
       TMR1H = 0;
       TMR1L = 0;
       CCP2M0_bit = 0; // configura m�dulo CCP como caompare para setar o pino CCP
     }
     CCP2IF_bit = 0;
   }

 }