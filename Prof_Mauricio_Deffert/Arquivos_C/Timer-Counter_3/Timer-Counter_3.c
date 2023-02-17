/*
  CALCULANDO TEMPO DE ESTOURO - UTILIZANDO INTERRUPÇÃO

  CÁLCULO DE TEMPORIZAÇÃO DO TIMER 0 PARA PISCAR UM LED A CADA 1s
  
  Calculando da temporização de 1ms do Timer 0 -> Fosc = 8 MHz e prescale de 1:8

  TE = tempo de estouro
  CM = ciclo de máquina = 1/(Fosc/4)
  PS = prescaler
  TMR0 - valor inicial do Timer 0
  Fosc = frequência do oscilador

  CI = 256 - ((TE*Fosc)/(4*PS))
  CI = 256 - ((1ms*8MHz)/(4*8)) = 6

*/

void interrupt(); // protótipo da função de interrupção

unsigned int contador = 0;

void main() {
  TRISD = 0;  // define PORT D como saída
  PORTD = 0;  // PORT D inicia en nível LOW, LEDs apagados
  
  INTCON.GIE = 1;     // habilita interrupção global
  INTCON.PEIE = 0;    // irrelevante para o TIMER 0
  INTCON.TMR0IE = 1;  // habilita interrupção por TIMER 0

  TMR0 = 6; // carga incial do registrador TMR0

  OPTION_REG = 0b10000010;      // modo temporizador - prescaler 1:8 (...010)
                                // TE = 0,5us*8*(256-6) = 1ms
                                // para conseguir 1s necessitamos 1000*TE

  while(1){
    if(contador == 1000){ // multiplica por 1000 o TE, 1000*1ms=1s
      PORTD.RD0 = ~PORTD.RD0; // inverte o pino RD0 (LED 0)
      contador = 0;
    }
  }
}

void interrupt(){
  contador++;         // para cada interrupção do TIMER 0, incrementa o contador
  TMR0 = 6;           // carga incial do registrador TMR0
  INTCON.TMR0IF = 0;  // limpa a flag de interrupção por TIMER 0 *** NUNCA ESQUECER DISTO!!!***
}