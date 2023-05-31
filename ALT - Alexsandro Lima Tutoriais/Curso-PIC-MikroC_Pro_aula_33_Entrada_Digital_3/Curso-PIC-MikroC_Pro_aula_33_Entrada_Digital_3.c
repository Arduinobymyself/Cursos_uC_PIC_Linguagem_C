// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 33 - Entrada Digital 3 (Resistores de PullUp Interno)
// válido para família PIC16F628

void main() {
  TRISB = 0b11110000;// RB0 - RB7 saídas
  PORTB = 0b00000000;
  OPTION_REG.f7 = 0;

  while(1){
    // Botão RA0 acende o LED, botão RA1 apaga o LED
    // pressionado = 0
    // não pressionado = 1
    if(!PORTA.RB0 && PORTA.RB1){// se RA0 pressionado e RA1 não pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB7 = 1;// Acende o LED
    }
    if(PORTA.RB0 && !PORTA.RB1){// se RA0 não pressionado e RA1 pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB7 = 0;// apaga o LED
    }
  }
}