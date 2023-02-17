
// aula051 - Módulo CCP - Compare Capture PWM

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


unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;


void main() {

  TRISC = 0b00000000; // RC1/CCP2 como saída
  PORTC = 0b00000000; // inicia em nível baixo
  
  PWM2_Init(2000);
  PWM2_Set_Duty(127);
  PWM2_Start();
  delay_ms(3000);
  PWM2_Set_Duty(0);
  delay_ms(5);
  PWM2_Stop();
  





  while(1){



  }

}