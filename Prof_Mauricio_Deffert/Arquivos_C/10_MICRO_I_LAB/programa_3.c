/************************ INTERRUPÇÃO EXTERNA RBO/INT **************************
- efeitos luminosos
*******************************************************************************/

// --- variáveis globais ---

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
    PORTD = 0b11000000;
    delay_ms(100);
    PORTD = 0b00000011;
    delay_ms(100);
  }

}

// --- desenvolvimento das funções auxiliares ---
void interrupt(){

  if(INTCON.INTF == 1){

    PORTD = 0b10000001;
    delay_ms(200);
    PORTD = 0b01000010;
    delay_ms(200);
    PORTD = 0b00100100;
    delay_ms(200);
    PORTD = 0b00011000;
    delay_ms(200);
    PORTD = 0b00100100;
    delay_ms(200);
    PORTD = 0b01000010;
    delay_ms(200);
    PORTD = 0b10000001;
    delay_ms(200);

    INTCON.INTF = 0;

  }
}