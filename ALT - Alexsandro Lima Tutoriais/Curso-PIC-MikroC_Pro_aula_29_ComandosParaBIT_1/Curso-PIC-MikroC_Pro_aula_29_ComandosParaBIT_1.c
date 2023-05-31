// Comandos para Bit
// TRIS
// 1 - TRISB.RB0 = 1;
// 2 - TRISB1_bit = 1;
// 3 - TRISB.f2 = 1;
//
// PORT
// 1 - PORTB.RB0 = 1;
// 2 - RB0_bit = 1;
// 3 - PORTB.f2 = 1;

void main() {
  TRISB.RB0 = 0;
  TRISB1_bit = 0;
  TRISB.f2 = 0;
  
  while(1){
    PORTB.RB0 = 1;
    RB1_bit = 1;
    PORTB.f2 = 1;
    
    delay_ms(500);
    
    PORTB.RB0 = 0;
    RB1_bit = 0;
    PORTB.f2 = 0;
    
    delay_ms(500);
  }

}