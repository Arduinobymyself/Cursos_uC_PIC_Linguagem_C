#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula048/aula048.c"
#line 24 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula048/aula048.c"
sbit LCD_RS at RB1_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;


sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;



void interrupt();


char flag0 = 0x00;
unsigned int time1, time2;
char txt[16];
char* text = "Modo de Captura";


void main() {
 CMCON = 0X07;

 T1CON = 0x01;
 CCP1CON = 0x05;

 CCP1IE_bit = 1;
 GIE_bit = 1;
 PEIE_bit = 1;


 TRISA = 0XFF;
 PORTA = 0XFF;
 TRISB = 0x09;
 PORTB = 0x09;

 LCD_Init();
 LCD_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1, text);




 while(1)
 {
 time2 = time2 - time1;
 IntToStr(time2, txt);
 LCD_Out(2,1, txt);
 flag0.B1 = 0;

 }

}



void interrupt(){
 if(CCP1IF_bit){
 if(!flag0.B0){
 time1 = (CCPR1H << 8) + CCPR1L;


 flag0.B0 = 1;
 } else {
 time2 = (CCPR1H << 8) + CCPR1L;
 flag0.B0 = 0;
 flag0.B1 = 1;
 }
 CCP1IE_bit = 0;
 CCP1CON.B0 = ~CCP1CON.B0;
 CCP1IE_bit = 1;

 CCP1IF_bit = 0;
 }
}
