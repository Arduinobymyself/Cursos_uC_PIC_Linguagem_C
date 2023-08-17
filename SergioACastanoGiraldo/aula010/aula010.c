// TEMPORIZADOR - TIMER 0 - CONTADOR DE 0 A 60 SEGUNDOS
/*
PRESCALER:
RTCC_DIV_2, RTCC_DIV_4, RTCC_DIV_8,
RTCC_DIV_16, RTCC_DIV_32,
RTCC_DIV_64, RTCC_DIV_128,
RTCC_DIV_256.

MACRO DE INTERRUPÇÃO TIMER 0
#INT_RTCC  //TIMER0
void timer0(void){
   contador--;          //Se decrementa hasta llegar a cero
   set_rtcc(value); //Timer0
   if (contador<=0) // Si llega a cero, se cumplió tiempo
   {
      //Su Codigo aqui......
      contador=valor_contador;  // Inicializa el contador para el próximo periodo
   }
}

MACRO DE INTERRUPÇÃO TIMER 1
#int_timer1  //TIMER1
void timer1(void){
   contador--;          //Se decrementa hasta llegar a cero
   set_timer1(value);         //Carga de nuevo el timer1
   if (contador<=0)     // Si llega a cero, se cumplió el tiempo
   {
      //Codigo aqui......
      contador=valor_contador;  // Inicializa el contador para el próximo periodo
   }
}


*/


#INCLUDE<16f887.h>
#USE DELAY(CRYSTAL=4000000)
#fuses XT,NOPROTECT,NOWDT,NOBROWNOUT,PUT,NOLVP
Byte CONST display[10]= {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};
#DEFINE U PORTC,0
#DEFINE D PORTC,1
#byte PORTB= 6
#byte PORTC= 7
INT VECES,SEG;
// Función para mostrar los segundos en el Display
VOID MOSTRAR( ) //Rutina mostrar
{
   INT UNI,DEC;   //Declarar las variables UNI, DEC
                  //como un entero, es decir de 8bits
   DEC=SEG/10;
   UNI=SEG%10;
   PORTB=(DISPLAY[UNI]);   //Muestra lo que hay en unidades
                           //en el display
   BIT_SET (U);            //Enciende el display de unidades
   DELAY_MS(1);            //Retardo de 1 milisegundos
   BIT_CLEAR(U);           //Apaga el display de unidades
   PORTB=(DISPLAY[DEC]);   //Muestra lo que hay en unidades
                           //en el display
   BIT_SET (D);            //Enciende el display de decenas
   DELAY_MS(1);            //Retardo de 1 milisegundos
   BIT_CLEAR(D);           //Apaga el display de decenas
   
}
//Rutina de interrupción por RTCC (TIMER)
#INT_RTCC 
VOID RELOJ()
{
   VECES--;          //Se decrementa la variable VECES
   SET_RTCC(238);    //Se carga el timer con 238
   IF(VECES==0)      //Pregunta si VECES ya llego a cero
   {
      SEG++;         //Cuando VECES llega a cero incrementa SEG (Transcurrio 1 seg)
      VECES=217;     //Vuelvo y cargo VECES con el valor 217
   }
}
//Programa Principal
VOID MAIN()
{
   SET_TRIS_B(0);    //Configura PUERTO B como salida
   SET_TRIS_C(0);    //Configura PUERTO C como salida
   VECES=217;        //Carga VECES con 217 para efectuar la cuenta de 1 seg con el timer
   SEG=0;            //Inicializa los segundos en cero
   SET_RTCC(238);    //Cargo valor inicial del timer
   
   // Configuración ANTIGUA del TIMER0
   //SETUP_COUNTERS(RTCC_INTERNAL, RTCC_DIV_256); //Configura interrupcion del timer
   
   // Configuración Recomendada del TIMER0
   SETUP_TIMER_0(RTCC_INTERNAL|RTCC_DIV_256|RTCC_8_bit); 
   
   ENABLE_INTERRUPTS(INT_RTCC);                 //Activa interrupcion del timer
   ENABLE_INTERRUPTS(GLOBAL);                   //Activa TODAS las interrupciones
   WHILE(TRUE)       //Haga por siempre
   {
      IF(SEG==60)    //Pregunta si ya se llego a 60 segundos
         SEG=0;      //Si si, vuelva a SEG a cero
      ELSE           //Si no,
         MOSTRAR();  //Muestre el valor de SEG en los Display 7 Segmentos
   }
}
