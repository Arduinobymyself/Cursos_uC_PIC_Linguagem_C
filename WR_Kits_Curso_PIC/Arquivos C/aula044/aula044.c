
/*
  
  aula044 - Controle de Servo Motores com Timer 0
  
  Gerar pulso para controle de servo a apartir do estouro do Timer 0
  Período típico para servo motores: 20ms
  MCU: PIC16F876A, clock 16MHz, ciclo de máquina 250ns
  
  TE = CM*PS*(256-TMR0)
  TE = 250ns*256*(256-0)
  TE = 16,38ms
  
*/

#define servo1 RC0_bit

unsigned char duty = 0;
int ADC = 0;

void interrupt();

void main() {

  CMCON = 7;
  OPTION_REG = 0x87;
  GIE_bit = 1;
  PEIE_bit = 1;
  TMR0IE_bit = 1;
  ADON_bit = 1;
  ADCON1 = 0x0E;
  TRISA = 0b00000001;
  TRISC = 0b00000000;
  PORTC = 0b00000000;
  
  duty = 16; // duty-cycle 50%
  
  /*
    256 -> 16ms
     x  -> 1ms
     servo trabalha de 1ms a 2ms (todo esq, todo dir) 1,5ms (centro)
     x = 16
     
     256 -> 16ms
      x  -> 2ms
      x = 32
      então o servo vai trabalhar de 16 a 32 somente
     
  */
  
  
  
  
  while(1){
  
    ADC = (Adc_Read(0))/64;
    /*
      ADC trabalha com 10 bits
      2^10 = 1024
      1026 / 16 = 64
      então o ADC deve ser dividido por 64 para dar o mínimo quando
      a leitura for 0 (0/64 = 0) e para dar 16
      somamos 16, (quando a leitura for máxima 1024/64 = 16) somado a 16 = 32
      assim mapeamos a leitura do ADC entre 16 e 32 (faixa de trabalho
      do PWM do nosso servo)
    */
    duty = ADC + 16; // soma 16 ao ADC (mapeamento)
                     // se 0  => 16
                     // se 16 => 32
  
  }

}


void interrupt(){
  // lógica para um servo
  if(TMR0IF_bit){
    TMR0IF_bit = 0;
    if(servo1){
      TMR0 = duty;
      servo1 = 0;
    } else {
      TMR0 = 255 - duty;
      servo1 = 1;
    }
  }
  
  // para mais servos, usar um switch-case com uma variável
  // de controle manipulada no loop infinito por botões como exemplo

}