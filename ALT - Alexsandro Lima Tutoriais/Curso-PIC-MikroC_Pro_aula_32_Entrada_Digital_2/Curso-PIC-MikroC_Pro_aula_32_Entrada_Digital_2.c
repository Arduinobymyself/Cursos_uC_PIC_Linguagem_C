// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 32 - Entrada Digital 2 (Resistores de PullUp)

void main() {
  TRISA = 0b00011111;// RA0 - RA4 entradas
  TRISB = 0b00000000;// RB0 - RB7 sa�das
  PORTA = 0b00000000;
  PORTB = 0b00000000;

  while(1){
    // Bot�o RA0 acende o LED, bot�o RA1 apaga o LED
    // pressionado = 0
    // n�o pressionado = 1
    if(!PORTA.RA0 && PORTA.RA1){// se RA0 pressionado e RA1 n�o pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB0 = 1;// Acende o LED
    }
    if(PORTA.RA0 && !PORTA.RA1){// se RA0 n�o pressionado e RA1 pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB0 = 0;// apaga o LED
    }
  }
}