#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula051/aula051.c"
#line 33 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula051/aula051.c"
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
#line 59 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula051/aula051.c"
char txt[12];
char flag0 = 0x00;
unsigned int time1, time2;
unsigned long Frequencia;
char* text1 = "Frequencimetro";
char* text2 = "Hz";



void main() {
 CMCON = 0X07;

 T1CON = 0X01;
 CCP1CON = 0X07;
 CCP1IE_bit = 0X01;
 GIE_bit = 0x01;
 PEIE_bit = 0x01;

 TRISA = 0XFF;
 TRISB = 0X0C;
 PORTA = 0XFF;
 PORTB = 0X00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, text1);
 Lcd_Out(2, 14, text2);
 delay_ms(100);

 while(1)
 {
 time2 = abs(time2 - time1);
 time2 = (time2) >> 4;
 Frequencia = 1/ (time2 * 1E-6);
 LongToStr(Frequencia, txt);
 Lcd_Out(2, 1, txt);
 flag0.B1 - 0x00;
 delay_ms(100);
 }

}


void interrupt(){
 if(CCP1IF_bit){
 CCP1IF_bit = 0x00;
 if(!flag0.B0){
 time1 = (CCPR1H << 8) + CCPR1L;
 flag0.B0 = 0x01;
 } else {
 time2 = (CCPR1H << 8) + CCPR1L;
 flag0.B0 = 0x00;
 flag0.B1 = 0x01;
 }
 }
}
