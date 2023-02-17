#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula021.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula021.c"
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










char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
signed int i;


void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0b00000011;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);

 Lcd_Out(1, 1, texto1);
 Lcd_Out(2, 1, texto2);


 while(1){
#line 83 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula021.c"
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, texto1);
 for(i = 1; i < 16; i++){
 Lcd_Out(2, i, texto2);
 delay_ms(200);
 Lcd_Out(2, 1, "                ");
 }
 for(i = -16; i < 16; i++){
 Lcd_Out(2, i, texto2);
 delay_ms(200);
 Lcd_Out(2, 1, "                ");
 }
 for(i = 16; i >= 1; i--){
 Lcd_Out(2, i, texto2);
 delay_ms(200);
 Lcd_Out(2, 1, "                ");
 }
 }

}
