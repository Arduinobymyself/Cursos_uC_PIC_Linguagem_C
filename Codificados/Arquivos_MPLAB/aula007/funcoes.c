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