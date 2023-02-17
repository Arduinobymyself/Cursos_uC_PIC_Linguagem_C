// Canal Vitor Santos
// aula035 - Timer 0 Temporizador

void interrupt();

void main() {
  TRISD = 0;
  PORTD = 0;
  
  OPTION_REG.T0CS = 0;
  OPTION_REG.T0SE = 0;
  OPTION_REG.PSA = 0;
  OPTION_REG.PS2 = 1; // PS2:PS1:PS0 = 101 -> prescaler 1:64
  OPTION_REG.PS1 = 0;
  OPTION_REG.PS0 = 1;
  
  INTCON.GIE = 1;
  INTCON.PEIE = 0;
  INTCON.TMR0IE = 1;
  INTCON.TMR0IF = 0;
  TMR0 = 0;
  
  while(1){
    RD7_bit = ~RD7_bit; // pulsa a cada 32ms por polling
    delay_ms(32);
  }

}

void interrupt(){
  if(INTCON.TMR0IF){
    INTCON.TMR0IF = 0;
    TMR0 = 0;
    RD0_bit = ~RD0_bit; // pulsa a cada 8,192ms por interrupção do Timer0
    // TE = CM*PS*(256-CI[TMR0]) = 0,5us*64*(256-0) = 8,192ms
  
  }
}