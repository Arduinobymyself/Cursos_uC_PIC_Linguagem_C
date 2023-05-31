
/*

  aula045 - Controle Suave de Servo Motores com Timer 0

  Gerar pulso para controle de servo a apartir do estouro do Timer 0
  Período típico para servo motores: 20ms
  MCU: PIC16F876A, clock 16MHz, ciclo de máquina 250ns

  TE = CM*PS*(256-TMR0)
  TE = 250ns*256*(256-0)
  TE = 16,38ms

*/

#define servo1 RC0_bit
#define tempo 50

void servo_slowUp();
void servo_slowDown();

unsigned char duty = 0x00;
int ADC = 0x00;

void interrupt();

void main() {

  CMCON = 0x07;
  OPTION_REG = 0x87; //0b10000111
  GIE_bit = 1;
  PEIE_bit = 1;
  TMR0IE_bit = 1;
  ADON_bit = 1;
  ADCON1 = 0x0E;  //0b00001110; //apenas AN0 com entrada analógica
  TRISA = 0xFF; // 0b00000001;
  TRISC = 0XFE; // 0b00000000;
  PORTC = 0XFE; // 0b00000000;

  duty = 23; // duty-cycle servo centralizado

  while(1){
  servo_slowUp();
  delay_ms(2000);
  servo_slowDown();
  delay_ms(2000);
  }
}



void servo_slowUp(){
  char i;
  for(i=9; i<38;i++){
    duty = i;
    Vdelay_ms(tempo);
  }
}

void servo_slowDown(){
  char i;
  for(i=37; i>8;i--){
    duty = i;
    Vdelay_ms(tempo);
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