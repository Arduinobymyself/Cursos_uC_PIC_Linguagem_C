/************************** CONTORLE MOTOR DE PASSO ****************************
Descri��o: Desenvolver um sistema embarcado para controle de um motor de passo.

Caracter�sticas de controle:
- velocidade
- sentido de giro

Fun��o dos bot�es:
B0 - aumenta a velocidade de giro
B1 - diminui a velocidade de giro
B2 - inverte o sentido de giro (hor�rio ou anti-hor�rio)

Indicadores:
LEDs - a1(RC0), a2(RC1), b2(RC2), b1(RC3) (bobinas acionadas)
LEDs - hor�rio(RA0) e anti-hor�rio(RA1)
DSP1 - indica��o de velocidade (conforme tabela)
indica��o = velocidade
1         = Vdelay_ms(400)
2         = Vdelay_ms(300)
3         = Vdelay_ms(200)
4         = Vdelay_ms(100)




*******************************************************************************/
unsigned int tempo = 400;

void main() {

  // sentido hor�rio
  PORTC = 0b00000001; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00000010; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00000100; // A1=1 (RC0)
  Vdelay_ms(tempo);
  PORTC = 0b00001000; // A1=1 (RC0)
  Vdelay_ms(tempo);

}