


int control = 0xff; // vari�vel de controle

void main() {

  trisb = 0x00; // port b como sa�da
  portb = 0xff; // port b inicia em 1 leds apagados (current sinking)
  
  // acende os LEDs um por um, apaga e recome�a
  while(1){
    portb = control; // desliga todos os leds
    delay_ms(300);
    control = control << 1; // desloca para esquerda em um bit (insere um zero)
    if(portb == 0x00){
      control = 0xff;
    }
  }

}