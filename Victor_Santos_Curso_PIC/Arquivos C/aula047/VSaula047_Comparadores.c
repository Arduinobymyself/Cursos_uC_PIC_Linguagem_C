
// aula047 - Comparadores

// RA0 CP1(-)
// RA3 CP1(+)
// RD0 LED sinaliza o CP1(out)
// RA1 CP2(-)
// RA2 CP2(+)
// RD7 LED sinaliza o CP2(out)


 void interrupt();


void main() {

  TRISD = 0;
  PORTD = 0;

  TRISA = 0b00001111; // RA0 até RA3 como entrada

  CMCON = 0b00000010; // [C2OUT C1OUT C2INV C1INV CIS CM2 CM1 CM0]
                      // CM2:CM0 <010> modo normal
                      // CM2:CM0 <011> saída CP1 vai para RA4 e saída CP2 vai para RA5
  // RA4 é dreno aberto, necessita de resistor de pull-up, caso for necessário usá-lo
  
  // usando interrupção
  INTCON = 0b11000000; // [GIE PEIE TMR0IE INTE RBIE TMR0IF INTF RBIF]
  PIE2 = 0b01000000;   // [--- CMIE --- --- BCLIE LVDIE TMR3IE CCP2IE]
  PIR2 = 0b00000000;   // [--- CMIF --- --- BCLIF LVDIF TMR3IF CCP2IF]
  
  /*
  // modo de trabalho usando referência interna  CM2:CM0 <110>
  CVRCON = 0b11101111; // [CVREN CVROE CVRR --- CVR3 CVR2 CVR1 CVR0]
                       // CVR3:CVR0 muda o valor da tensão de referência
  CIS_bit = 0;  // entrada inversora CP1 1 é o RA0 e do CP2 é o RA1
  */

  while(1){
    /*
    // teste sem o uso da interrupçãointerrupção
    if(C1OUT_bit){
      RD0_bit = 1;
    } else {
      RD0_bit = 0;
    }
    
    if(C2OUT_bit){
      RD7_bit = 1;
    } else {
      RD7_bit = 0;
    }
    */
  }

}


 void interrupt(){
   
   if(CMIF_bit){
      
      if(C1OUT_bit){
        RD0_bit = 1;
      } else {
        RD0_bit = 0;
      }

      if(C2OUT_bit){
        RD7_bit = 1;
      } else {
        RD7_bit = 0;
      }
      
   }
   CMIF_bit = 0;
   
 }