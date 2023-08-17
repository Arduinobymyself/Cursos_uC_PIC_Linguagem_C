
/*
EXEMPLOS DE CONFIGURAÇÃO DE OSCILADOR
1. SETUP OSCILADOR
#fuses INTRC_IO
#use delay(clock=500000) 
void main()
{
   setup_oscillator(OSC_500KHZ|OSC_INTRC); //Cristal interno de 500KHz
}

2.
// Configurar el tiempo a 32KHz, se usa los fuses
// en delay_us() y en delay_ms()
#use delay (clock=32000, RESTART_WDT)
//4 Ejemplos que muestran la configuración del tiempo:
//Para usar un reloj de 20Mhz, donde la fuente es un cristal de cuarzo
#use delay (crystal=20000000)
#use delay (xtal=20,000,000)
#use delay(crystal=20Mhz)
#use delay(clock=20M, crystal)
//Para configurar un reloj  a 10Mhz con un oscillator, 
//pero usando el multiplicador PLL por 4 para aumentar la velocidad
//a 40MHz. El compilador configurará los bits si se usa:
#use delay(oscillator=10Mhz, clock=40Mhz)
//Para utilizar un Reloj Interno a 8MHz usamos la siguiente directiva
//donde el compilador configurará los bits para habilitar
//el oscilador a 8MHz.
#use delay(internal=8Mhz)
// si se desea ver la salida del reloj interno por el pin CLKO
#use delay(internal=8Mhz,clock_out)

3.
#INCLUDE <16f887.h>
#fuses RC, NOWDT, PUT, NOMCLR,BROWNOUT,NOLVP
#use delay(clock=4MHz)

4. OSCILADOR VIA 555
#INCLUDE <16f887.h>
#fuses EC, NOWDT, PUT, NOMCLR,BROWNOUT,NOLVP
#use delay(clock=101700)

5. OSCILADOR INTERNO
#INCLUDE <16f887.h>
#fuses XT, NOWDT, PUT, NOMCLR,BROWNOUT,NOLVP
#use delay(internal=4000000)

OU

#INCLUDE <16f887.h>
#fuses INTRC_IO, NOWDT, PUT, NOMCLR,BROWNOUT,NOLVP
#use delay(clock=4MHZ) 
void main(){
   setup_oscillator(OSC_4MHZ|OSC_INTRC); //Cristal interno de 4MHz
}

6.CRISTAL DE QUARTZO */

#include <16f887.h>
#fuses XT, NOWDT, PUT, NOMCLR,BROWNOUT,NOLVP
#use delay(clock=4000000,crystal)

void main(){

}






















