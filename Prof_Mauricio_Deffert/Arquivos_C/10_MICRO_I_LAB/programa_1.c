/************************ INTERRUPÇÃO EXTERNA RBO/INT **************************
- bloco principal fica parado com um delay de 10s
- nível lógico do pino RD7 é invertido a cada 10s
- interrupção externa habilitada através do botão B0 (RB0/INT - pino 33)
- ao acionar a interrupção externa RB0/INT, a rotina de interrupção é executada
  - inverte o nível lógico do LED L0 do PORTD.
*******************************************************************************/

// --- protótipo das funções ---
void interrupt(); // faz o tratamento das interrupções

// --- programa principal ---
void main() {
  ADCON1 = 7;
  CMCON = 7;
  
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  INTCON.INTE = 1;
  INTCON.INTF = 0;
  
  TRISB.RB0 = 1;
  TRISD = 0;
  PORTD = 0;
  
  while(1){
    PORTD.RD7 = ~PORTD.RD7;
    delay_ms(10000);
  }
  
}

// --- desenvolvimento das funções auxiliares ---
void interrupt(){
  if(INTCON.INTF == 1){
    PORTD.RD0 = ~PORTD.RD0;
    INTCON.INTF = 0;
  }
}