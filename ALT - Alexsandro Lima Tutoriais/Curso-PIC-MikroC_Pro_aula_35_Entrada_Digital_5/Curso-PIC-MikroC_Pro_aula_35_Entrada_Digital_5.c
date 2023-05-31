// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 34 - Entrada Digital 4 Botão Liga/Desliga com biblioteca Button.h


bit estado;


void main() {
  TRISA = 0b00011111;// RA0 -RA4 entradas
  TRISB = 0b00000000;// RB0 - RB7 saídas
  PORTA = 0b00000000;
  PORTB = 0b00000000;



  while(1){
    // Botão RA0 acende o LED, botão RA1 apaga o LED
    // pressionado = 0
    // não pressionado = 1
    if(Button(&PORTA, 0, 50, 0) && (estado == 0)){// se RA0 pressionado e estado = 0
      PORTB.RB7 = ~PORTB.RB7;// inverte estado do LED
      estado = 1;// faz estado = 1
    }
    if(!Button(&PORTA, 0, 50, 0) && (estado == 1)){// se RA0 não pressionado e estado = 1; soltou botão...
      estado = 0;//faz estado = 0
    }
  }
}