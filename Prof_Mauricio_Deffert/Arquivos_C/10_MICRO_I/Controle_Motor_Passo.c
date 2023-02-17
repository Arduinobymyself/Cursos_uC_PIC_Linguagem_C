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

#define B0 Button(&PORTB, 0, 100, 0)
#define B1 Button(&PORTB, 1, 100, 0)
#define B2 Button(&PORTB, 2, 100, 0)


unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned int tempo = 100;
bit flagB0, flagB1, flagB2;
unsigned char flagCCW = 0, flagCW = 1;
unsigned char velocidade = 4;



void CW();
void CCW();
void speed();

void main() {

  ADCON1 = 7;
  CMCON = 7;
  TRISA = 0;
  PORTA = 0;
  TRISB = 7;
  TRISC = 0;
  PORTC = 0;
  TRISD = 0;
  PORTD = 0;

  PORTC.RC4 = 1;

  while(1){

    PORTD = texto[velocidade];

    speed();

    if(B2 && flagB2 == 0){
      flagB2 = 1;
    }
    if(!B2 && flagB2 == 1){
      flagB2 = 0;
      
      if(flagCW){
        flagCW = 0;
        flagCCW = 1;
      } else if(flagCCW){
        flagCCW = 0;
        flagCW = 1;
      }
      
    }
    
    CCW();
    CW();
    
    
  }


}

void speed(){

  if(B0 && flagB0 == 0){
    flagB0 = 1;
  }
  if(!B0 && flagB0 == 1){
    flagB0 = 0;
    tempo -= 100;
    velocidade++;
    if(tempo < 100 || velocidade > 4){
      tempo = 100;
      velocidade = 4;
    }
  }

  if(B1 && flagB1 == 0){
    flagB1 = 1;
  }
  if(!B1 && flagB1 == 1){
    flagB1 = 0;
    tempo += 100;
    velocidade--;
    if(tempo > 400 || velocidade < 1){
      tempo = 400;
      velocidade = 1;
    }
  }
  
}

void CCW(){

  // sentido Anti-horário CCW - Counter Clock Wise
  if(flagCCW){
    PORTA.RA0 = 0;
    PORTA.RA1 = 1;

    PORTC = 0b00000001; // A-1=1 (RC0)
    Vdelay_ms(tempo);
    PORTC = 0b00000010; // A-2=1 (RC1)
    Vdelay_ms(tempo);
    PORTC = 0b00000100; // B-2=1 (RC2)
    Vdelay_ms(tempo);
    PORTC = 0b00001000; // B-1=1 (RC3)
    Vdelay_ms(tempo);
  }

}

void CW(){

  if(flagCW){
    // sentido horário CW - Clock Wise
    PORTA.RA0 = 1;
    PORTA.RA1 = 0;

    PORTC = 0b00000001; // A-1=1 (RC0)
    Vdelay_ms(tempo);
    PORTC = 0b00001000; // B-1=1 (RC3)
    Vdelay_ms(tempo);
    PORTC = 0b00000100; // B-2=1 (RC2)
    Vdelay_ms(tempo);
    PORTC = 0b00000010; // A-2=1 (RC1)
    Vdelay_ms(tempo);
  }

}