#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_42_LCD_Message_Shift.c"






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

unsigned short int contador;

const char smile[] = {0,10,10,0,17,14,0,0};

void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(smile[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"     ABMS");
 CustomChar(1,11);
 Lcd_Out(2,1,"ArduinoByMySelf");



 while(1){
 for(contador = 0; contador < 16; contador++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 delay_ms(100);
 }
 for(contador = 0; contador < 32; contador++){
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 delay_ms(100);
 }
 for(contador = 0; contador < 16; contador++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 delay_ms(100);
 }
 }
}
