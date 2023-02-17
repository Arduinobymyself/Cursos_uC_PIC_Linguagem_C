




void interrupt();


void main() {

  CMCON = 7;

  OPTION_REG.INTEDG = 1; // INTEDG:1 = interrupt on rising edge of RB0/INT pin
  INTCON.GIE = 1;        // GIE:1 = anable global interruption
  INTCON.PEIE = 0;       // PEIE:0 = disable peripheral interruption
  INTCON.INTE = 1;       // INTE:1 = enable external interruption
  INTCON.INTF = 0;       // clear external interruption flag
  
  TRISB = 0b00000001;    // RB0 como entrada
  PORTB = 0b00000001;    // RB0 using pull-up resistor
  TRISD = 0;             // PORTD como saída digital
  PORTD = 0;             // PORTD inicia em nível baixo

  while(1){
    RD0_bit = ~RD0_bit;  // inverte LED vermelho a cada 500ms
    delay_ms(500);
  }
}

void interrupt(){
  if(INTF_bit){
    INTF_bit = 0;       // reinicia a flag de interrupção
    RD7_bit = ~RD7_bit; // inverte LED verde a cada pressionamento em B0
  }
}