#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/aula02.c"


void main() {
 TRISB = 0b00000000;
 PORTB = 0b00000000;
 while(1){
 PORTB++;
 delay_ms(200);
 }
}
