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
void characteres(void);

void main(){
	set_tris_b(0x00);
	inicia_lcd();
	characteres();

	while(true){
		LCD_comando(Linha_1);
		LCD_texto("  ABMS Telecom");	
		delay_ms(20);
		LCD_comando(Linha_2);
		printf(LCD_texto, "  Bem vindo! %c", 0x00);
		delay_ms(2000);
		LCD_comando(limpa_LCD);
		delay_ms(500);

		LCD_comando(Linha_1);
		LCD_texto("   Caracteres");	
		delay_ms(20);
		LCD_comando(Linha_2);
		printf(LCD_texto, " %c %c %c %c %c %c %c %c", 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07);
		delay_ms(2000);
		LCD_comando(limpa_LCD);
		delay_ms(500);
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

void characteres(void){
	LCD_comando(0b01000000);
	LCD_texto(0b00000000);
	LCD_texto(0b00001010);
	LCD_texto(0b00001010);
	LCD_texto(0b00000000);
	LCD_texto(0b00010001);
	LCD_texto(0b00001110);
	LCD_texto(0b00000000);
	LCD_texto(0b00000000);

	LCD_texto(0b00000000);
	LCD_texto(0b00001010);
	LCD_texto(0b00001010);
	LCD_texto(0b00000000);
	LCD_texto(0b00001110);
	LCD_texto(0b00010001);
	LCD_texto(0b00000000);
	LCD_texto(0b00000000);

	LCD_texto(0b00000000);
	LCD_texto(0b00000000);
	LCD_texto(0b00001010);
	LCD_texto(0b00010101);
	LCD_texto(0b00010001);
	LCD_texto(0b00001010);
	LCD_texto(0b00000100);
	LCD_texto(0b00000000);

	LCD_texto(0b00001110);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00011111);
	LCD_texto(0b00000000);

	LCD_texto(0b00001110);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00000000);

	LCD_texto(0b00001110);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00011111);
	LCD_texto(0b00000000);

	LCD_texto(0b00001110);
	LCD_texto(0b00010001);
	LCD_texto(0b00010001);
	LCD_texto(0b00011111);
	LCD_texto(0b00011011);
	LCD_texto(0b00011011);
	LCD_texto(0b00011111);
	LCD_texto(0b00000000);

	LCD_texto(0b00000001);
	LCD_texto(0b00000011);
	LCD_texto(0b00001101);
	LCD_texto(0b00011101);
	LCD_texto(0b00001101);
	LCD_texto(0b00000011);
	LCD_texto(0b00000001);
	LCD_texto(0b00000000);

}
