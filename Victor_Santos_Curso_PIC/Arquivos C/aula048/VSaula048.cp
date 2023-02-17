#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula048.c"
#line 49 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula048.c"
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

unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;

void interrupt();


void main() {

 TRISC = 0b00000100;

 T1CON = 0b00010000;


 TMR1H = 0;
 TMR1L = 0;


 CCP1M3_bit =0;
 CCP1M2_bit =1;
 CCP1M1_bit =0;
 CCP1M0_bit =1;



 INTCON = 0b11000000;
 TMR1IE_bit = 0;
 CCP1IE_bit = 1;


 LCD_Init();
 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);
 LCD_Out(1, 14, "us");
 LCD_Out(2, 14, "Hz");

 while(1){

 if(flag.b1){
 LongToStr((tempo), texto);
 Lcd_Out(1, 1, texto);
 freq = 1000000/(2*tempo);
 LongToStr(freq, texto);
 LCD_Out(2, 1, texto);
 flag.b1 = 0;
 }

 }

}


 void interrupt(){

 if(CCP1IF_bit){
 if(flag.b0){
 TMR1H = 0;
 TMR1L = 0;
 TMR1ON_bit = 1;
 CCP1M0_bit = 0;
 flag.b0 = 0;
 } else {
 TMR1ON_bit = 0;
 tempo = (TMR1H<<8)+TMR1L;
 CCP1M0_bit = 1;
 flag.b0 = 0;
 flag.b1 = 1;
 }
 CCP1IF_bit = 0;
 }

 }
