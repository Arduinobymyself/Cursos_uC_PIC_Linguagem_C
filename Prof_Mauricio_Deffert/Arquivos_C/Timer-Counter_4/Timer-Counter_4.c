/*

  MODO CONTADOR DO TIMER 0 (CONTAGEM ATÉ 10 EVENTOS)
  
  Contagem até 10
  Para programarmos o TIMER 0  como contador de eventos, devemos carregar
  o TE da seguinte maneira:
  TMR0 = 256-10 = 246

*/


void main() {
  TRISD = 0;  // define PORT D como saída
  PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
  TRISA.RA4 = 1; // pino contador RA4/T0CKI configurado como entrada
                 // OBS.: este pino é naturalmente dreno aberto, neste caso 
                 // é necessário pull-up ou pull-down externo

  OPTION_REG = 0b10111000;      // modo contador - prescaler desligado PSA = 1 - borda de escida
  TMR0 = 246;                   // carregamento inicial do registrador TMR0
  INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0

  while(1){
    PORTD = TMR0;
    if(INTCON.TMR0IF == 1){     // se houve um estouro
      PORTD.RD0 = ~PORTD.RD0;   // inverte o pino RD0 (LED 0)
      TMR0 = 246;               // reincia o registrador TMR0
      INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
    }
  }
}