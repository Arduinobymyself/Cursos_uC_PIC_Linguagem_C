// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 32 - Entrada Digital 2 (Resistores de PullUp)

void main() {
  TRISA = 0b00011111;// RA0 - RA4 entradas
  TRISB = 0b00000000;// RB0 - RB7 saídas
  PORTA = 0b00000000;
  PORTB = 0b00000000;

  while(1){
    // Botão RA0 acende o LED, botão RA1 apaga o LED
    // pressionado = 0
    // não pressionado = 1
    if(!PORTA.RA0 && PORTA.RA1){// se RA0 pressionado e RA1 não pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB0 = 1;// Acende o LED
    }
    if(PORTA.RA0 && !PORTA.RA1){// se RA0 não pressionado e RA1 pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB0 = 0;// apaga o LED
    }
  }
}