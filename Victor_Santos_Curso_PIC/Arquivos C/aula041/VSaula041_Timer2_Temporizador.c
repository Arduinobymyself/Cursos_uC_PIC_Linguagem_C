// Canal Vitor Santos
// aula039 - Timer 1 Com Cristal
/*
  TIMER 2
  TE = CM*PS*PST*(255-TMR2)
  CM = 1/FOS/4 = 4/8MHz = 0,5us
  PRESCALER PS = 16
  POSTSCALER PST = 16
  TEmax = 32,768ms
*/

void interrupt();

void main() {

  TRISD = 0;
  PORTD = 0;


  // Crystal em RC0 / RC1 32768kHz (65536/2)
  // inicio da contagem indica pelos registradores TMR1H TMR1L


  T2CON = 0b01100110; // [--- TOUTPS3 TOUTPS2 TOUTPS1 TOUTPS0 TMR2ON T2CKPS1 T2CKPS0]
  PR2 = 240;

  INTCON = 0b11000000; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]

  PIE1 = 0b00000010; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR2IE TMR1IE]
  PIR1 = 0b00000000; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR2IF TMR1IF]


  while(1){

  }

}

void interrupt(){

  if(PIR1.TMR2IF){
    PIR1.TMR2IF = 0;
    RD7_bit = ~RD7_bit;
  }

}