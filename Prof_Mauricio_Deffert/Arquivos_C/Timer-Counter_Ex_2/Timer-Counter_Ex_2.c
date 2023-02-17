/*

  MODO CONTADOR DO TIMER 0 (CONTAGEM ATÉ 10 EVENTOS)

  Contagem até 10
  Para programarmos o TIMER 0  como contador de eventos, devemos carregar
  o TE da seguinte maneira:
  TMR0 = 256-10 = 246

*/

void interrupt();


void main() {
  ADCON1 = 7; // pinos A/D como digitais
  TRISD = 0;  // define PORT D como saída
  PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
  TRISB.RB0 = 1; // RB0 como entrada digital
  PORTB.RB0 = 1; // RB0 com pull-up
  TRISA.RA4 = 1; // pino contador RA4/T0CKI configurado como entrada
                 // OBS.: este pino é naturalmente dreno aberto, neste caso
                 // é necessário pull-up ou pull-down externo
  PORTA.RA4 = 1;
  
  INTCON.GIE = 1;     // habilita interrupção global
  INTCON.PEIE = 0;    // desabilita interrupção por periféricos
  INTCON.TMR0IE = 1;  // habilita interrupção por TIMER 0


  OPTION_REG = 0b10111000;      // modo contador - prescaler desligado PSA = 1 - borda de escida
  TMR0 = 246;                   // carregamento inicial do registrador TMR0
  INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0

  while(1){
    if(PORTB.RB0 == 0){
      TMR0 = 246;               // reincia o registrador TMR0
      INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
      PORTD.RD0 = 0;            // desliga LED 0 (RD0)
    }
  }
}

void interrupt(){
  if(INTCON.TMR0IF == 1){
    PORTD.RD0 = 1;      // liga LED 0 (RD0)
    INTCON.TMR0IF = 0;  // reinicia o flag de estouro do TIMER 0
  }
}