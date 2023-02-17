/************************ INTERRUP��O EXTERNA RBO/INT **************************
- bloco principal fica parado com um delay de 10s
- n�vel l�gico do pino RD7 � invertido a cada 10s
- interrup��o externa habilitada atrav�s do bot�o B0 (RB0/INT - pino 33)
- ao acionar a interrup��o externa RB0/INT, a rotina de interrup��o � executada
  - inverte o n�vel l�gico do LED L0 do PORTD.
*******************************************************************************/

// --- prot�tipo das fun��es ---
void interrupt(); // faz o tratamento das interrup��es

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

// --- desenvolvimento das fun��es auxiliares ---
void interrupt(){
  if(INTCON.INTF == 1){
    PORTD.RD0 = ~PORTD.RD0;
    INTCON.INTF = 0;
  }
}