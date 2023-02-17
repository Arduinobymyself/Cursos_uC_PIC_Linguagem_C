/************************ INTERRUP��O EXTERNA RBO/INT **************************
- em um la�o de repeti��o infinito o LED L0 (RD0) pisca a cada 200ms
- interrup��o externa habilitada atrav�s do bot�o B0 (RB0/INT - pino 33)
- rotina executada pela interrup��o:
  -  ligar e desligar os LEDs L0 at� L7 (PORTD) a cada 1 segundo por cinco vezes
*******************************************************************************/

// --- vari�veis globais ---
unsigned char i;

// --- prot�tipo das fun��es ---
void interrupt(); // faz o tratamento das interrup��es

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

// --- desenvolvimento das fun��es auxiliares ---
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