#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula052/aula052.c"
#line 60 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula052/aula052.c"
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;


sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;









void interrupt();



char txt[12];
char* text1 = "Testing...      ";
char* text2 = "    ...interrupt";

int counter0 = 0x00;
int counter1 = 0x00;

bit change;



void main() {

 CMCON = 0X07;
 T1CON = 0X31;
 OPTION_REG = 0x81;
 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 T0IE_bit = 0x01;
 TMR1IE_bit = 0x01;

 TMR0 = 0X06;
 TMR1L = 255;
 TMR1H = 206;

 TRISA = 0XFF;
 TRISB = 0X00;
 PORTA = 0XFF;
 PORTB = 0X00;

 change = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, text1);
 Lcd_Out(2, 14, text2);
 delay_ms(100);

 while(1)
 {
 if(!change) Lcd_Out(1, 1, text1);
 else Lcd_Out(1, 1, text2);
 }

}


void interrupt(){

 if(T0IF_bit){

 T0IF_bit = 0x00;
 TMR0 = 0x06;
 counter0++;
 if(counter0 == 500){

 counter0 = 0x00;
  RB2_bit  = ~ RB2_bit ;
 }
 }

 if(TMR1IF_bit){

 TMR1IF_bit = 0x00;
 TMR1L = 255;
 TMR1H = 206;
 counter1++;
 if(counter1 == 10){

 counter1 = 0x00;
 change = ~change;
 RB3_bit = ~RB3_bit;
 }
 }

}
