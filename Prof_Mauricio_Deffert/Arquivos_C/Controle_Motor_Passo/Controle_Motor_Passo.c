/************************** CONTORLE MOTOR DE PASSO ****************************
Descrição: Desenvolver um sistema embarcado para controle de um motor de passo.

Características de controle:
- velocidade
- sentido de giro

Função dos botões:
B0 - aumenta a velocidade de giro
B1 - diminui a velocidade de giro
B2 - inverte o sentido de giro (horário ou anti-horário)

Indicadores:
LEDs - a1(RC0), a2(RC1), b2(RC2), b1(RC3) (bobinas acionadas)
LEDs - horário(RA0) e anti-horário(RA1)
DSP1 - indicação de velocidade (conforme tabela)
indicação = velocidade
1         = Vdelay_ms(400)
2         = Vdelay_ms(300)
3         = Vdelay_ms(200)
4         = Vdelay_ms(100)




*******************************************************************************/
unsigned int tempo = 400;

void main() {

  // sentido horário
  PORTC = 0b00000001; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00000010; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00000100; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00001000; // A1=1 (RC0)
  Vdelay_ms(tempo);

}