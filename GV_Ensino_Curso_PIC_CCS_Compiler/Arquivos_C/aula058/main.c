#include <main.h>

#define use_portb_kbd TRUE
#include <KBD.C>

#include <lcd.c>

// SIMULANDO UMA TRANCA ELETRONICA

char tecla;
char *senha = "1971";
int i = 0;
int errado = 0;

void main()
{
   kbd_init();

   lcd_init();
   
   printf(lcd_putc, "\fDigite a Senha: \n");

   while(TRUE)
   {
      tecla = kbd_getc();
      delay_ms(2);
      
      if(tecla != 0)
      {
         printf(lcd_putc, "%c", tecla);
         delay_ms(200);
         
         if(senha[i] != tecla)
         {
             errado++;
         }
         i++;      
      }
      
      if(i == 4 && errado != 0) // digitou 4 caracteres com erros
      {
         printf(lcd_putc, "\fSENHA ERRADA!");
         output_high(pin_a1);
         delay_ms(2000);
         output_low(pin_a1);
         printf(lcd_putc, "\fDigite a Senha: \n");
         i = 0;
         errado = 0;   
      }
      
      if(i == 4 && errado == 0) // digitou 4 caracteres sem erros
      {
         printf(lcd_putc, "\fSENHA CORRETA!");
         output_high(pin_a0);
         delay_ms(2000);
         output_low(pin_a0);
         printf(lcd_putc, "\fDigite a Senha: \n");
         i = 0;
         errado = 0;
      }
         
   }

}
