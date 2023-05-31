#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_38_LCD.c"






sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;


sbit LCD_EN at RB5_bit;
sbit LCD_RS at RB4_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;





void main() {
 Lcd_Init();





 while(1){
 Lcd_Chr(1,6,'A');
 delay_ms(500);
 Lcd_Chr(1,7,'B');
 delay_ms(500);
 Lcd_Chr(1,8,'M');
 delay_ms(500);
 Lcd_Chr(1,9,'S');
 delay_ms(500);
 Lcd_Out(2,1,"ArduinoByMySelf");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 }

}
