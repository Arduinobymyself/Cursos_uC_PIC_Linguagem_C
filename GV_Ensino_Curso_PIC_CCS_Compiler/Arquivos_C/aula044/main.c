#include <main.h>

#include <lcd.c>



// SIMULANDO UM RELOGIO DIGITAL



void imprime(int h, int m, int s);

void main()
{

   lcd_init();
   
   int segundos = 45;
   int minutos = 58;
   int horas = 14;
   
   while(TRUE)
   {
      output_high(pin_b3);
      delay_ms(200);
      output_low(pin_b3);
      delay_ms(200);
      
      
      
      imprime(horas, minutos, segundos);
      
      segundos++;
      
      
      if(segundos >= 59)
      {
         minutos++;
         segundos = 0;
      }
      if(minutos > 59)
      {
         horas++;
         minutos = 0;
         segundos = 0;
      }
      if(horas > 24)
      {
         horas = 0;
         minutos = 0;
         segundos = 0;
      }
      

      

      

   }

}

void imprime(int h, int m, int s)
{

   printf(lcd_putc, "\f");
   lcd_gotoxy(1,1);
   printf(lcd_putc, "HH : MM : SS");
   lcd_gotoxy(1,2);
   
   // corrigindo numerais menores do que zero 
   // que aparecem como 1 ao invés de 01...
   // acrescenta zero no início do numeral
   if(h < 10 && m <10 && s < 10)
   {
      printf(lcd_putc, "0%u : 0%u : 0%u", h, m, s);
   }
   else if(h < 10 && m <10)
   {
      printf(lcd_putc, "0%u : 0%u : %u", h, m, s);
   }
   else if(h < 10 && s < 10)
   {
      printf(lcd_putc, "0%u : %u : 0%u", h, m, s);
   }
   else if(h < 10)
   {
      printf(lcd_putc, "0%u : %u : %u", h, m, s);
   }
   else if(m <10 && s < 10)
   {
      printf(lcd_putc, "%u : 0%u : 0%u", h, m, s);
   }
   else if(m <10)
   {
      printf(lcd_putc, "%u : 0%u : %u", h, m, s);
   }
   else if(s < 10)
   {
      printf(lcd_putc, "%u : %u : 0%u", h, m, s);
   }
   else
   {
      printf(lcd_putc, "%u : %u : %u", h, m, s);
   }

   
   

}
