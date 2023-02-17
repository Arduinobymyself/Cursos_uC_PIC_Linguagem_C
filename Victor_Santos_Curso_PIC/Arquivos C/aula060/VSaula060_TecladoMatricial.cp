#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula060_TecladoMatricial.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula060_TecladoMatricial.c"
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

char keypadPort at PORTD;

unsigned short kp, cnt, oldstate = 0;
char txt[6];
#line 60 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula060_TecladoMatricial.c"
void main() {

 cnt = 0;




 Keypad_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, "1");
 Lcd_Out(1, 1, "Key  :");
 Lcd_Out(2, 1, "Times:");




 TRISB = 0;
 PORTB = 0;
 TRISD = 0b00001111;
 PORTD = 0b00001111;




 do {
 kp = 0;


 do

 kp = Keypad_Key_Click();
 while (!kp);

 RC0_bit = 1;
 delay_ms(50);
 RC0_bit = 0;


 switch (kp) {





 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;

 }

 if (kp != oldstate) {
 cnt = 1;
 oldstate = kp;
 }
 else {
 cnt++;
 }

 Lcd_Chr(1, 8, ltrim(kp));

 if (cnt == 255) {
 cnt = 0;
 Lcd_Out(2, 8, "         ");
 }

 WordToStr(cnt, txt);
 Lcd_Out(2, 8, ltrim(txt));
 } while (1);

}
