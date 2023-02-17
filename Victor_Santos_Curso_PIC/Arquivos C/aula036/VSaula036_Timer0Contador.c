// Canal Vitor Santos
// aula035 - Timer 0 Contador

void interrupt();

void main() {
  TRISD = 0;
  PORTD = 0;
  TRISA = 0b00001000; // RA4 como entrada

  OPTION_REG.T0CS = 1;
  OPTION_REG.T0SE = 0;
  OPTION_REG.PSA = 0;
  OPTION_REG.PS2 = 0; // PS2:PS1:PS0 = 101 -> prescaler 1:64
  OPTION_REG.PS1 = 0;
  OPTION_REG.PS0 = 0;

  INTCON.GIE = 1;
  INTCON.PEIE = 0;
  INTCON.TMR0IE = 1;
  INTCON.TMR0IF = 0;
  TMR0 = 250;

  while(1){

  }

}

void interrupt(){
  if(INTCON.TMR0IF){
    INTCON.TMR0IF = 0;
    TMR0 = 250;
    RD0_bit = ~RD0_bit;
  }
}