


int control = 0xff; // variável de controle

void main() {

  trisb = 0x00; // port b como saída
  portb = 0xff; // port b inicia em 1 leds apagados (current sinking)
  
  // acende os LEDs um por um, apaga e recomeça
  while(1){
    portb = control; // desliga todos os leds
    delay_ms(300);
    control = control << 1; // desloca para esquerda em um bit (insere um zero)
    if(portb == 0x00){
      control = 0xff;
    }
  }

}