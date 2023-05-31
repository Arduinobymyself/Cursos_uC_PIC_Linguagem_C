

int duty = 750;

void main() {

  ADCON0 = 0x00;
  ADCON1 = 0X07;
  TRISC.RC2 = 0;
  PORTC.RC2 = 0;
  
  while(1){
    PORTC.RC2 = 1;
    Vdelay_ms(duty);
    PORTC.RC2 = 0;
    Vdelay_ms(1000 - duty);
  }

}