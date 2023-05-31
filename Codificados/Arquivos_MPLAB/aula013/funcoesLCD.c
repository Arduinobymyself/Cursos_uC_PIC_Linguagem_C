

void LCD_nibble(int dado){
	output_bit(pin_b4, bit_test(dado, 0));
	output_bit(pin_b5, bit_test(dado, 1));
	output_bit(pin_b6, bit_test(dado, 2));
	output_bit(pin_b7, bit_test(dado, 3));
	toggle_enable();
}

void inicia_lcd(void){
	output_low(rs);
	delay_ms(15);
	LCD_comando(0x03);
	LCD_comando(0x02);
	delay_ms(1);
	LCD_comando(0x28);
	LCD_comando(0x0c);
	LCD_comando(0x06);
	LCD_comando(limpa_LCD);
	delay_ms(20);
}

void LCD_texto(char texto){
	output_high(rs);
	delay_ms(2);
	LCD_nibble(texto>>4);
	LCD_nibble(texto&0x0F);
	delay_ms(2);
}

void LCD_comando(int comando){
	output_low(rs);
	delay_ms(2);
	LCD_nibble(comando>>4);
	LCD_nibble(comando&0x0F);
	delay_ms(2);
}

void toggle_enable(void){
output_high(enable);
delay_ms(1);
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

