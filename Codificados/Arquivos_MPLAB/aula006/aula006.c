#include <16F628A.h>
#fuses XT, NOWDT, NOLVP
#use delay(clock=4000000)
#use fast_io(b)

#define rs			pin_a0
#define enable		pin_a1
#define limpa_LCD	0x01
#define Linha_1		0x80
#define Linha_2		0xC0

void inicia_lcd(void);
void LCD_texto(char letra);
void LCD_comando(int comando);
void toggle_enable(void);

void main(){
	set_tris_b(0x00);
	inicia_lcd();

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
		LCD_texto("   Maio 2023");
		delay_ms(1500);
		LCD_comando(Limpa_LCD);
		delay_ms(20);
	}
	
	
}

void inicia_lcd(void){
	output_low(rs);
	output_b(0x38);
	toggle_enable();
	delay_ms(20);
	output_b(0x0C);
	toggle_enable();
	output_b(0x06);
	toggle_enable();
	output_b(limpa_LCD);
	toggle_enable();
	delay_ms(5);
}

void LCD_texto(char letra){
	output_high(rs);
	output_b(letra);
	toggle_enable();
}

void LCD_comando(int comando){
	output_low(rs);
	output_b(comando);
	toggle_enable();
}
void toggle_enable(void){
output_high(enable);
delay_us(500);
output_low(enable);
}