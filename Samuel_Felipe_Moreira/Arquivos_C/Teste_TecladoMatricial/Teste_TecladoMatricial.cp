#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Teste_TecladoMatricial.c"
#line 13 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Teste_TecladoMatricial.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char var1;

void lcdr(char a[5]){
 TRISD = 0;
 Lcd_Cmd(_LCD_CLEAR);
 LCD_Out_CP(a);
 TRISD = 255;
}

void main() {

 char var2;
 ADCON1 = 0x15;
 TRISE = 0;
 TRISD = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms(100);
 TRISD = 255;
 PORTB = 255;
 PORTD = 255;
 TRISD = 255;
 TRISB = 0;






 do {

 PORTB.RB0 = 0;
 var2 = PORTD;
 if (var2.f0 == 0) lcdr("<--");
 else if (var2.f1 == 0) lcdr("7");
 else if (var2.f2 == 0) lcdr("4");
 else if (var2.f3 == 0) lcdr("1");
 PORTB.RB0 = 1;

 PORTB.RB1 = 0;
 var2 = PORTD;
 if (var2.f0 == 0) lcdr("0");
 else if (var2.f1 == 0) lcdr("8");
 else if (var2.f2 == 0) lcdr("5");
 else if (var2.f3 == 0) lcdr("2");
 PORTB.RB1 = 1;

 PORTB.RB2 = 0;
 var2 = PORTD;
 if (var2.f0 == 0) lcdr("-->");
 else if (var2.f1 == 0) lcdr("9");
 else if (var2.f2 == 0) lcdr("6");
 else if (var2.f3 == 0) lcdr("3");
 PORTB.RB2 = 1;
 delay_ms(100);

 } while(1);

}
