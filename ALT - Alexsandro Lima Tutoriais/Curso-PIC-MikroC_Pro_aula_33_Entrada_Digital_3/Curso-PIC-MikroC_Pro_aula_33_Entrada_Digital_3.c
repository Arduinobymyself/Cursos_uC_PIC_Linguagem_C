// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 33 - Entrada Digital 3 (Resistores de PullUp Interno)
// v�lido para fam�lia PIC16F628

void main() {
  TRISB = 0b11110000;// RB0 - RB7 sa�das
  PORTB = 0b00000000;
  OPTION_REG.f7 = 0;

  while(1){
    // Bot�o RA0 acende o LED, bot�o RA1 apaga o LED
    // pressionado = 0
    // n�o pressionado = 1
    if(!PORTA.RB0 && PORTA.RB1){// se RA0 pressionado e RA1 n�o pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB7 = 1;// Acende o LED
    }
    if(PORTA.RB0 && !PORTA.RB1){// se RA0 n�o pressionado e RA1 pressionado
      delay_ms(50);// espera tempo para debouncing
      PORTB.RB7 = 0;// apaga o LED
    }
  }
}