

void main() {
     TRISB = 0b00000000; // todo o port B como saída
     PORTB = 0b00000000; // todo o port B em nível lógico 0
     while(1){
         PORTB++;
         delay_ms(200);
     }
}
