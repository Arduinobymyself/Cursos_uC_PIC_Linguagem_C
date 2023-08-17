// INTERRUPÇÕES
/*
#INT_EXT              INTERRUPCIÓN EXTERNA
#INT_RTCC            DESBORDAMIENTO DEL TIMER0(RTCC)
#INT_RB                  CAMBIO EN UNO DE LOS PINES B4,B5,B6,B7
#INT_AD                  CONVERSOR A/D
#INT_EEPROM   ESCRITURA EN LA EEPROM COMPLETADA
#INT_TIMER1      DESBORDAMIENTO DEL TIMER1
#INT_TIMER2     DESBORDAMIENTO DEL TIMER2

// PARA PIC18F4550:
#include <18f4550.h>
#byte porta = 0xf80 // Identificador para el puerto A. 
#byte portb = 0xf81 // Identificador para el puerto B. 
#byte portc = 0xf82 // Identificador para el puerto C. 
#byte portd = 0xf83 // Identificador para el puerto D. 
#byte porte = 0xf84 // Identificador para el puerto E.


*/

#INCLUDE <16F887.H>
#FUSES XT,NOLVP,NOWDT,PUT
//#USE DELAY(CLOCK=4000000) //Cystal interno 4MHz
#use delay(clock=4000000,crystal)//Crystal Externo 4MHz
Byte CONST display[10]= {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};
#BYTE PORTC = 7
#BYTE PORTB = 6
INT CONT=0;


#INT_EXT             //Funcion de la Interrupcion
VOID INTERRUPCION()
{
   DELAY_MS(200);    //Retardo
   CONT++;           //Incremente la variable CONT
   IF(CONT==10)      //Si la variable CONT es igual a 10
      CONT=0;        //Ponga en cero la variable CONT
}

VOID MAIN()
{
   SET_TRIS_B(0B11111111);       //Configurar el puerto B
   SET_TRIS_C(0);                //Configurar el puerto C
   ENABLE_INTERRUPTS(GLOBAL);    //Habilita todas las interrupciones
   ENABLE_INTERRUPTS(INT_EXT);   //Habilita la interrupción externa
   WHILE(TRUE)
   {
      PORTC= (display[CONT]);    //Muestra lo que hay en la variable CONT en el display
   }
}
