

void main() {
     TRISB = 0b00000000; // todo o port B como sa�da
     PORTB = 0b00000000; // todo o port B em n�vel l�gico 0
     while(1){
         PORTB++;
         delay_ms(200);
     }
}
