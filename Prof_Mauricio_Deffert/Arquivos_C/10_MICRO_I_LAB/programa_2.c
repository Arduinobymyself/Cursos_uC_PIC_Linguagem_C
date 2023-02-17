/************************ INTERRUPÇÃO EXTERNA RBO/INT **************************
- em um laço de repetição infinito o LED L0 (RD0) pisca a cada 200ms
- interrupção externa habilitada através do botão B0 (RB0/INT - pino 33)
- rotina executada pela interrupção:
  -  ligar e desligar os LEDs L0 até L7 (PORTD) a cada 1 segundo por cinco vezes
*******************************************************************************/

// --- variáveis globais ---
unsigned char i;

// --- protótipo das funções ---
void interrupt(); // faz o tratamento das interrupções

// --- programa principal ---
void main() {
  ADCON1 = 7;
  CMCON = 7;

  INTCON.GIE = 1;
  INTCON.PEIE = 0;
  INTCON.INTE = 1;
  INTCON.INTF = 0;

  TRISB.RB0 = 1;
  TRISD = 0;
  PORTD = 0;

  while(1){
    PORTD.RD0 = ~PORTD.RD0;
    delay_ms(200);
  }

}

// --- desenvolvimento das funções auxiliares ---
void interrupt(){

  if(INTCON.INTF == 1){

    for(i = 0; i < 5; i++){
      PORTD = 255;
      delay_ms(1000);
      PORTD = 0;
      delay_ms(1000);
    }
    
    INTCON.INTF = 0;
    
  }
}