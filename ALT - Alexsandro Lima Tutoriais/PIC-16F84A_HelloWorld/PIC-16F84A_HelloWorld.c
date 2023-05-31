// Hello World
// blinks all port B
void main() {
  TRISB = 0b00000000;
  PORTB = 0b00000000;
  
  while(1){
    PORTB = 0b11111111;
    delay_ms(500);
    PORTB = 0b00000000;
    delay_ms(500);
  }
}