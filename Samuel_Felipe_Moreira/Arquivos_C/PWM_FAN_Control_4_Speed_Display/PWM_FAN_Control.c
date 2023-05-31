 /*
   Usando PWM para controlar a velocidade da ventoinha através de botões
   incrementando e decrementando em 25% a velocidade a cada pressionamento
   se abaixo de 0 ou acima de 100% deve tocar um alarme sonoro a cada pressionamento
   e manter em 0 ou 100%
   1 - 25%
   2 - 50%
   3 - 75%
   4 - 100%

   B0 (RB0) decrementa (-)
   B1 (RB1) incrementa (+)
   
   Cooler (RC2)
   Display - dados PORTD  RD0 ~RD7 (a, b, c, d, e, f, g, pto)
             controle RA2 ~ RA5 (DPS1 ~DSP4)
 */

// ------ definições ------
#define B0 PORTB.RB0
#define B1 PORTB.RB1

// ------ variáveis ------
int valorPWM = 0, porcentagem = 0;
int contador = 0, tempo = 1;
bit flagB0, flagB1;
int numero[10] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
int display[5] = {0, 4, 8, 16, 32};

// ------ protótipo das funções ------
void bip();
void setPWM(int porcentagem);
void displaySpeed(int contador);

// ------ programa principal ------
void main() {
  CMCON = 7; // comparadores desativados
  //ADCON1 = 15;  // para PIC16F45XX
  ADCON0 = 0; // conversor AD desligado
  ADCON1 = 7; // todas as entradas como digital
  TRISB = 0b00000011; // port B RB0 e RB1 como entrada digital
  TRISC.RC1 = 0; // pino do buzzer
  PORTC.RC1 = 0;
  TRISD = 0; // pinos de dados dos displays
  PORTD = 0;
  TRISA = 0; // pinos de controle dos displays
  PORTA = 0;
  
  PWM1_Init(5000);            // inicializa o PWM
  PWM1_Start();               // ativa o PWM1 pino RC2
  PWM1_Set_Duty(valorPWM);    // configura o DutyCycle de acordo com o valor desejado

  while(1){

    if(B0 && flagB0 == 0){ // B0 decrementa o valor em 25%
      flagB0 = 1;
    }
    if(!B0 && flagB0 == 1){
      flagB0 = 0;
      porcentagem -= 25;
      if(porcentagem < 0){
        porcentagem = 0;
        bip();
      }
      contador--;
      if(contador <= 0){
        contador = 0;
      }
      setPWM(porcentagem);
    }

    if(B1 && flagB1 == 0){ // B1 incrementa o valor em 25%
      flagB1 = 1;
    }
    if(!B1 && flagB1 == 1){
      flagB1 = 0;
      porcentagem += 25;
      if(porcentagem > 100){
        porcentagem = 100;
        bip();
      }
      contador++;
      if(contador >= 4){
        contador = 4;
      }
      setPWM(porcentagem);
    }
    

    

    
    //setPWM(porcentagem);
    displaySpeed(porcentagem);

  }

}

// ------ implementação das funções ------
void displaySpeed(int valorNumerico){
  int valor, resto;
// primeiro digito
  valor = valorNumerico/1000;
  PORTD = numero[valor];
  PORTA = display[1];
  Vdelay_ms(tempo);

  // segundo digito
  valor = valorNumerico/100;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[2];
  Vdelay_ms(tempo);

  // terceiro digito
  valor = valorNumerico/10;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[3];
  Vdelay_ms(tempo);

  // quarto digito
  valor = valorNumerico/1;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[4];
  Vdelay_ms(tempo);

}

void setPWM(int porcentagem){

  valorPWM = (porcentagem*255)/100;
  PWM1_Set_Duty(valorPWM);
}

void bip(){
  PORTC.RC1 = 1;
  delay_ms(250);
  PORTC.RC1 = 0;
  delay_ms(250);
}