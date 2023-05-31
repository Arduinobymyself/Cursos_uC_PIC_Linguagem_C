#include <16F628A.h>
#include "configPIC.h"
#include "LCDteste.c"

float pago, z=5.125, x=6.057, y=3.14159265;

void main(){
	set_tris_b(0x00);
	inicia_lcd();
	characteres();

	while(true){
		LCD_comando(Linha_1);
		printf(LCD_texto, "  ABMS Telecom");
		LCD_comando(Linha_2);
		LCD_texto("   Bem vindo!");
		delay_ms(1500);
		LCD_comando(Limpa_LCD);
		delay_ms(20);

		LCD_comando(Linha_1);
		printf(LCD_texto, "  Curso de PIC");
		LCD_comando(Linha_2);
		LCD_texto("    Jan 2023");
		delay_ms(1500);
		LCD_comando(Limpa_LCD);
		delay_ms(20);

		LCD_comando(Linha_1);
		LCD_texto("   Caracteres");	
		delay_ms(20);
		LCD_comando(Linha_2);
		printf(LCD_texto, " %c %c %c %c %c %c %c %c", 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07);
		delay_ms(2000);
		LCD_comando(limpa_LCD);
		delay_ms(500);

		pago = x+y+z;
		LCD_comando(Linha_1);
		printf(LCD_texto, "  Teste printf");
		LCD_comando(Linha_2);
		printf(LCD_texto, " Valor R$ %5.2f", pago);
		delay_ms(1500);
		LCD_comando(Limpa_LCD);
		delay_ms(20);

	
	}

}

