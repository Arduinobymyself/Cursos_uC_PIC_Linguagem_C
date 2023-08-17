// SEQUENCIAL LEDS - LEDS INICIAM APAGADOS E VÃO ACENDENDO

#INCLUDE<16F887.h>
#USE DELAY(CLOCK=4000000)
#FUSES XT,NOPROTECT,NOWDT,NOBROWNOUT,PUT,NOLVP

#BYTE PORTB=6
MAIN()
{
   SET_TRIS_B(0B00000000);          //Configura el Puerto B Como salidas
   PORTB=0;                         //Comienza con todos los Leds Apagados
   WHILE(TRUE)                      //Haga por siempre ....
   {
      PORTB=0B00000001;             //Prendo unicamente el led de RB0
      DELAY_MS(500);                //Retardo de 500 milisegundos
      WHILE (!BIT_TEST(PORTB,7))    //Haga mientras el LED RB7 se encuentre apagado
      {
         PORTB=PORTB<<1;            //Rote hacia la izquierda una unidad
         DELAY_MS(500);             //Retardo de 500 milisegundos
      }
      DELAY_MS(500);                //Retardo de 500 milisegundos
      WHILE (!BIT_TEST(PORTB,0))    //Haga mientras el LED RB0 se encuentre apagado
      {
         PORTB=PORTB>>1;            //Rote hacia la derecha una unidad
         DELAY_MS(500);             //Retardo de 500 milisegundos
      }
   }
}

/*
// PARA LÓGICA INVERTIDA - LEDS INICIAM ACESOS E VÃO APAGANDO

#INCLUDE<16F887.h>
#USE DELAY(CLOCK=4000000)
#FUSES XT,NOPROTECT,NOWDT,NOBROWNOUT,PUT,NOLVP

#BYTE PORTB=6
int AUX;
MAIN()
{
   SET_TRIS_B(0B00000000);          //Configura el Puerto B Como salidas
   PORTB=0;                         //Comienza con todos los Leds Apagados
   WHILE(TRUE)                      //Haga por siempre ....
   {
      PORTB=0B11111110;             //Prendo unicamente el led de RB0
      AUX=0B00000001; 
      DELAY_MS(500);                //Retardo de 500 milisegundos
      WHILE (BIT_TEST(PORTB,7))    //Haga mientras el LED RB7 se encuentre encendido
      {
         AUX=AUX<<1;                 //Rote hacia la izquierda una unidad
         PORTB=~(AUX);             //Complementar la variable AUX
         DELAY_MS(500);             //Retardo de 500 milisegundos
      }
      DELAY_MS(500);                //Retardo de 500 milisegundos
      WHILE (BIT_TEST(PORTB,0))    //Haga mientras el LED RB0 se encuentre encendido
      {
          AUX=AUX>>1;                 //Rote hacia la izquierda una unidad
         PORTB=~(AUX);             //Complementar la variable AUX
         DELAY_MS(500);             //Retardo de 500 milisegundos
      }
   }
}
*/
