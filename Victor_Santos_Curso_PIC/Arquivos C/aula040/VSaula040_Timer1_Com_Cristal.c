// Canal Vitor Santos
// aula039 - Timer 1 Com Cristal

void interrupt();

void main() {

  TRISC = 0b00000010;

  TRISD = 0;
  PORTD = 0;


  // Crystal em RC0 / RC1 32768kHz (65536/2)
  // inicio da contagem indica pelos registradores TMR1H TMR1L

  T1CON = 0b00001011; // [--- --- T1CKPS1 T1CKPS0 T1OSCEN T1SYNC| TMR1CS TMR1ON]
  TMR1H = 0x80;  // iniciando a contagem em 32768, conta 2 eventos até estouro
  TMR1L = 0x00;


  INTCON = 0b11000000; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]

  PIE1 = 0b00000001; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR1IE TMR1IE]
  PIR1 = 0b00000000; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR1IF TMR1IF]


  while(1){

  }

}

void interrupt(){

  if(PIR1.TMR1IF){
    PIR1.TMR1IF = 0;
    TMR1H = 0x80;
    TMR1L = 0x00;
    RD7_bit = ~RD7_bit;
  }

}