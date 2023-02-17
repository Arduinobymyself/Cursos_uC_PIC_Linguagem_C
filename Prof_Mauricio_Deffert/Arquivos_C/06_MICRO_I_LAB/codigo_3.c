// programa 03 - Observar Bouncing da Chave
// Aciona e desaciona a Tecla B0 (RB0) -> L0 (RD0) liga
// Aciona e desaciona a Tecla B0 (RB0) -> L0 (RD0) desliga

/*
  Ao apertar a tecla pode se observar uma contagem em binário
  essa contagem é o número de vezes que foi detectado acionamento
  da tecla (apesar de ter apertao uma só vez, existe o bouncing
  e o uC detecta mais de um acionamento)
*/

#define TRUE 1

void main() {

  ADCON1 = 7;           // desabilita comparadores internos
  TRISD = 0;            // port D omo saída
  PORTD = 0;            // port D inicia em LOW
  TRISB.RB0 = 1;        // port B RB0 como entrada
  PORTB.RB0 = 1;        // port B RB0 com pull-up

  while(TRUE){

    if(PORTB.RB0 == 0){
      PORTD++; // incrementa o port D
      delay_ms(10); // debouncing - testar os vários valores
    }

  }

}