
//**************************** PISCA LED ****************************
// Programa para inverter o nível lógico do LED (D1) ligado ao pino RD1
// a cada 1000ms (f=0,5Hz)
// PIC 16F877A, cristal de 8MHz, compilador MikroC Pro for PIC
//*******************************************************************


// --- Função principal --- //
void main() {

  ADCON1 = 7;           // configura pinos de I/O como digital

  TRISD = 0;            // configura port D como saída
  PORTD = 0;            // port D inicia em nível LOW (todos os LEDs desligados)

  while(1){
    PORTD.RD1 = 1;      // liga LED 1
    delay_ms(1000);     // aguarda 1s
    PORTD.RD1 = 0;      // desliga LED 1
    delay_ms(1000);     // aguarda 1s
  }

}