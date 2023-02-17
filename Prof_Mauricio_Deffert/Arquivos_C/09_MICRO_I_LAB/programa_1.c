/*
  Testes usando a função Vdelay_ms()
*/
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

void main() {
  unsigned int tempo = 100;
  ADCON1 = 7;
  TRISB = 0xFF;
  TRISD = 0x00;
  PORTD = 0x00;
  
  while(1){
  
    if(!B0) tempo += 100;
    if(!B1) tempo -= 100;
    if(tempo < 100) tempo = 100;
    if(tempo > 2000) tempo = 2000;
    PORTD.RD0 = ~PORTD.RD0;
    Vdelay_ms(tempo);
  }

}