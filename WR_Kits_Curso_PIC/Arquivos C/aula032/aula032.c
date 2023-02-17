// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                     Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:
            WR KITS - aula032 - PWM com PIC 16F877A
            Utilizando as bibliotecas do MikroC PRO for PIC
            PWM para Motores DC
            AN0- sensor de tens�o no motor

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define B1 RB1_bit
#define B2 RB2_bit
#define B3 RB3_bit
#define B4 RB4_bit


// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //
unsigned short int percent_duty;
unsigned int ADC = 0;

// --- programa principal --- //
void main() {
  CMCON = 0X07; // desabilita os comparadores internos
  ADCON0 = 0b00000001; // liga o m�dulo conversor AD e sleciona canal 0 (AN0)
  ADCON1 = 0b00001110; // apenas AN0 como anal�gico todos os outros pinos como digital
  
  TRISB = 0XFF; // todo port B como entrada
  TRISC = 0x00; // todo port C como sa�da
  PORTB = 0XFF; // todo port B inicia em HIGH
  PORTC = 0X00; // todo port C inicia em LOW

  PWM1_Init(1000);  // inicia o PWM com frequencia de 1KHz

  percent_duty = 50;

  PWM1_Start();

  PWM1_Set_Duty(percent_duty*255/100);


  while(1)
  {
    ADC = ADC_Read(0);
    PWM1_Set_Duty(ADC*255/100);
    if(ADC < 512 ){
      percent_duty++;
      delay_ms(50);
      if(percent_duty > 90) percent_duty = 90;
    } else {
      percent_duty = 80;
    }
  }

}

// --- defini��o das fun��es auxiliares --- //