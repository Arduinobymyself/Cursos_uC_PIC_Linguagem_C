#include <TelcadoMatricial_LCD.h>

#include <KBD.C>

/*
#define LCD_ENABLE_PIN PIN_B0
#define LCD_RS_PIN PIN_B1
#define LCD_RW_PIN PIN_B2
#define LCD_DATA4 PIN_B4
#define LCD_DATA5 PIN_B5
#define LCD_DATA6 PIN_B6
#define LCD_DATA7 PIN_B7
*/

#define LCD_DATA_PORT getenv("SFR:PORTB")
#include <lcd.c>



char c;

void main()
{
   kbd_init();

   lcd_init();
   
   printf(lcd_putc, "\f"); // limpa o LCD
   lcd_gotoxy(1,1); // vai para coluna 1, linha 1
   printf(lcd_putc, "Digite: ");
   delay_ms(50);

   while(TRUE)
   {
      //TODO: User Code
      
      c = kbd_getc(); // faz leitura do que for digitado no teclado matricial
      delay_ms(1);
      
      if(c != 0){
         lcd_gotoxy(1,2);
         printf(lcd_putc, "Voce digitou %c", c);
         //delay_ms(300);
      }
      
   }

}
