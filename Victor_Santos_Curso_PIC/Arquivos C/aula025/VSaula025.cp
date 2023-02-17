#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula025.c"
#line 26 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula025.c"
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;


sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;








void converte(unsigned int valor);


char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
unsigned int valor = 0;
unsigned char texto[6];
unsigned int valorAD0 = 0;
unsigned int valorAD1 = 0;




void main() {

 ADCON0 = 0b00000000;
 ADCON1 = 0b11000100;
 TRISA = 0b00000011;

 TRISC = 0x00;
 PORTC = 0x00;
 TRISB = 0x03;
 PORTB = 0x03;
 TRISD = 0x00;
 PORTD = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);

 Lcd_Out(1, 1, texto1);
 Lcd_Out(2, 1, texto2);
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "AN0 = ");
 Lcd_Out(2, 1, "AN1 = ");

 while(1){

 ADCON0.CHS2 = 0;
 ADCON0.CHS1 = 0;
 ADCON0.CHS0 = 0;
 ADCON0.ADON = 1;
 delay_us(20);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE);

 valorAD0 = (ADRESH << 8) + ADRESL;


 valorAD0 = valorAD0*4.88758;

 ADCON0.ADON = 0;
 delay_us(20);

 converte(valorAd0);
 Lcd_Out(1, 7, texto);
 Lcd_Out(1, 12, "V");


 ADCON0.CHS2 = 0;
 ADCON0.CHS1 = 0;
 ADCON0.CHS0 = 1;
 ADCON0.ADON = 1;
 delay_us(20);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE);

 valorAD1 = (ADRESH << 8) + ADRESL;

 valorAD1 = valorAD1*4.88758;

 ADCON0.ADON = 0;
 delay_us(20);

 converte(valorAD1);
 Lcd_Out(2, 7, texto);
 Lcd_Out(2, 12, "V");


 }

}



void converte(unsigned int valor){

 texto[0] = valor/1000+48;
 texto[1] = '.';
 texto[2] = (valor/100)%10+48;
 texto[3] = (valor/10)%10+48;
 texto[4] = (valor/1)%10+48;

}
