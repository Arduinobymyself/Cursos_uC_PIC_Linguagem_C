// Canal Vitor Santos
// aula038 - Temporizadores Timer 0 e Timer 1

void interrupt();

void main() {
  TRISD = 0;
  PORTD = 0;

  // Timer 0, RD0, 15ms
  // TE = CM*PS*(256-CI[TMR0])
  // CI[TMR0] = 256-(TE/(CM*PS))
  // PS = 128
  // CI[TMR0] = 256-(15ms/(0,5us*128) = 22
  OPTION_REG = 0b10000110; // [RBPU| INTEDG T0CS T0SE PSA PS2 PS1 PS0]
  TMR0 = 22;
  
  // Timer 1, RD7, 25ms
  // TE = CM*PS*(65536-CI[TMR0])
  // CI[TMR0] = 65536-(TE/(CM*PS))
  // PS = 1
  // CI[TMR0] = 65536-(15ms/(0,5us*1) = 15536 = 0x3CAF
  T1CON = 0b00000101; // [--- --- T1CKPS1 T1CKPS0 T1OSCEN T1SYNC| TMR1CS TMR1ON]
  TMR1H = 0x3C;
  TMR1L = 0xAF;
  
  
  INTCON = 0b11100100; //[GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
  TMR0IF_bit = 0;

  PIE1 = 0b00000001; // [PSIE ADIE RCIE TXIE SSPIE CCPIE TMR1IE TMR1IE]
  PIR1 = 0b00000001; // [PSIF ADIF RCIF TXIF SSPIF CCPIF TMR1IF TMR1IF]


  while(1){

  }

}

void interrupt(){
  if(PIR1.TMR1IF){
    PIR1.TMR1IF = 0;
    TMR1H = 0x3C;
    TMR1L = 0xAF;
    RD7_bit = ~RD7_bit;
  }
  if(INTCON.TMR0IF){
    INTCON.TMR0IF = 0;
    TMR0 = 22;
    RD0_bit =~RD0_bit;
  }
}