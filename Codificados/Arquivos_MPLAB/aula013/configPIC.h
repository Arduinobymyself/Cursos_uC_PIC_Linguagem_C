#fuses XT, NOWDT, NOLVP
#use delay(clock=4000000)
#use fast_io(b)

void inicia_lcd(void);
void LCD_texto(char texto);
void LCD_comando(int comando);
void LCD_nibble(int dado);
void toggle_enable(void);
void characteres(void);

#define rs			pin_b0
#define enable		pin_b1
#define limpa_LCD	0x01
#define Linha_1		0x80
#define Linha_2		0xC0