int control = 0b00000001;

void main() {

  trisb = 0x00; // port b como saída
  portb = 0xff; // port b inicia em nível alto

  // efeito deslocamento
  while(1){
    portb = control; // liga todos os leds
    delay_ms(200);
    control = control << 1; // desloca para esquerda
    if(control == 0b10000000){
      while(control != 0b00000001){
        portb = control;
        control = control >> 1; // Ddesloca para direita
        delay_ms(200);
      }

    }
  }

}