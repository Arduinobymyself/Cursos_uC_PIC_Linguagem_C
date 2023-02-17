
// TESTE BÁSICO DE INTERRUPÇÃO

void interrupt(){
  if(INTCON.INTF == 1){
    PORTD.RD2 = ~PORTD.RD2;
    INTCON.INTF = 0;  // limpa o flag INTF possibilitando novas interrupçãoes
                      // NUNCA ESQUECER DISSO !!! POSSIBILIDADE DE LOOP INFINITO
  }
}

void main() {
  ADCON1 = 7;
  CMCON = 7;
  
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  INTCON.INTE = 1;
  INTCON.INTF = 0;
  
  TRISB.RB0 = 1;
  TRISD = 0;
  PORTD = 0;
  
  while(1){
    PORTD.RD0 = ~PORTD.RD0;
    delay_ms(300);
  }
}