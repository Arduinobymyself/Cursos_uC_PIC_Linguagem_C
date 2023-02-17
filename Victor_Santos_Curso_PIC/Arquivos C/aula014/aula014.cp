#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula014.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula014.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
#line 55 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula014.c"
void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISA = 0b00000001;
 PORTA = 0X00;

 Lcd_Init();
#line 93 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula014.c"
 while(1){
 Lcd_Out(1, 1, "  ABMS Telecom  ");
 Lcd_Out(2, 1, " Seja Bem Vindo!");
 delay_ms(2000);
 Lcd_Out(1, 1, "  Linguagem C   ");
 Lcd_Out(2, 1, "   MikroC PRO   ");
 delay_ms(2000);
 }

}
