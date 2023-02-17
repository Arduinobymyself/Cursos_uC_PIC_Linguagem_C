#define TRUE 1
#define B0 PORTB.RB0

unsigned char statusB0 = 0;

void main() {
  ADCON1 = 0X07;         // todos os pinos como entrada e saída digital
  TRISB = 0b00000001;    // RB0 como entrada digital
  TRISD = 0X00;
  PORTD = 0X00;
  
  while(TRUE){
    if(B0 && statusB0 == 0){
      delay_ms(40);
      statusB0 = 1;
      PORTD = ~PORTD;
    }
    if(!B0 && statusB0 == 1){
      delay_ms(40);
      statusB0 = 0;
    }
  }

}