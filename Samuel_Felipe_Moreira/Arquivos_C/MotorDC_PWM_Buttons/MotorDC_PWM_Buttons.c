 /*
   Usando PWM para controlar a velocidade da ventoinha
   incrementando e decrementando em 10% a velocidade a cada pressionamento
   
   B0 (RB0) incrementa
   B1 (RB1) decrementa
   
 */
#define B0 Button(&PORTB, 0, 50, 1)
#define B1 Button(&PORTB, 1, 50, 1)

int valorPWM = 0, porcentagem = 0;
bit flagB0;
bit flagB1;

void main() {
  CMCON = 7; // comparadores desativados
  //ADCON1 = 15;  // para PIC16F45XX
  ADCON0 = 0; // conversor AD desligado
  ADCON1 = 7; // todas as entradas como digital
  TRISB = 0b00000011; // port B RB0 e RB1 como entrada digital



  PWM1_Init(5000);            // inicializa o PWM
  PWM1_Start();               //
  PWM1_Set_Duty(valorPWM);    // configura o DutyCycle de acordo com o valor desejado

  while(1){
    
    if(B0 && flagB0 == 0){ // B0 incrementa o valor em 10%
      flagB0 = 1;
    }
    if(!B0 && flagB0 == 1){
      flagB0 = 0;
      porcentagem += 10;
      if(porcentagem > 100){ // não pode ser maior que 100%
        porcentagem = 100;
      }
      valorPWM = (porcentagem*255)/100;
      PWM1_Set_Duty(valorPWM);
    }
    
    if(B1 && flagB1 == 0){ // B1 decrementa o valor em 10%
      flagB1 = 1;
    }
    if(!B1 && flagB1 == 1){
      flagB1 = 0;
      porcentagem -= 10;
      if(porcentagem < 0){ // não pode ser menor que 0%
        porcentagem = 0;
      }
      valorPWM = (porcentagem*255)/100;
      PWM1_Set_Duty(valorPWM);
    }
    
  }







}