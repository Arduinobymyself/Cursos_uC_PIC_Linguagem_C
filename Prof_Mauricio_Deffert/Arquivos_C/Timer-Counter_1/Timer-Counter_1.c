/*
  
  CÁLCULO DE TEMPORIZAÇÃO DO TIMER 0
  Calculando da temporização máxima do Timer 0 -> Fosc = 8 MHz
  Não foi usado a função de interrupção, apenas foi testado o flag
  de interupção do TIMER 0 no loop infinito
  
  TE = tempo de estouro
  CM = ciclo de máquina = 1/(Fosc/4)
  PS = prescaler
  TMR0 - valor inicial do Timer 0
  
  TE = CM * PS * (256 - TMR0)
  TE = 0,5us * 256 * (256 - 0)
  TE = 32,768ms
  
*/


void main() {
  TRISD = 0;  // define PORT D como saída
  PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados

  OPTION_REG = 0b10000111;      // modo temporizador - prescaler 1:256
  TMR0 = 0;                     // carregamento inicial do registrador TMR0
  INTCON.TMR0IF = 0;            // reincia a flag de estouro do TIMER 0
  
  while(1){
    if(INTCON.TMR0IF == 1){     // se houve um estouro
      PORTD.RD0 = ~PORTD.RD0;   // inverte o pino RD0 (LED 0)
      TMR0 = 0;                 // reincia o registrador TMR0
      INTCON.TMR0IF = 0;        // reincia a flag de estouro do TIMER 0
    }
  }
}