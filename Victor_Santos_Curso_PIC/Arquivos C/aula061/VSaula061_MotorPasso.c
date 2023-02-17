/*******************************************************************************
Firmware: Controle motor de passo
Autor: Marcelo Moraes
Data: 02/203
Microcontrolador: 18F4550
Frequência: 8MHz
Compilador: MikroC PRO For PIC
Descrição:
*******************************************************************************/

//Biblioteca para o motor de passo
#include "Stepper_Lib.h"

//Configura os pinos de saida
sbit Stepper_PinB1 at RD7_bit;
sbit Stepper_PinB2 at RD6_bit;
sbit Stepper_PinB3 at RD5_bit;
sbit Stepper_PinB4 at RD4_bit;

sbit Stepper_PinB1_Direction at TRISD7_bit;
sbit Stepper_PinB2_Direction at TRISD6_bit;
sbit Stepper_PinB3_Direction at TRISD5_bit;
sbit Stepper_PinB4_Direction at TRISD4_bit;

void main()
{
//modo de acionamento, numero de passo, rotação em rpm
  Stepper_Init(_Stepper_FullStep, 200, 60);
  TRISD2_bit = 0;
  RD2_bit = 1;
  delay_ms(500);
  RD2_bit = 0;
  delay_ms(500);
  RD2_bit = 1;
  delay_ms(500);
  RD2_bit = 0;
  delay_ms(500);


  for(;;){
   Stepper_Step(25); //25*1,8 = 45°
   delay_ms(1000);
  }
}