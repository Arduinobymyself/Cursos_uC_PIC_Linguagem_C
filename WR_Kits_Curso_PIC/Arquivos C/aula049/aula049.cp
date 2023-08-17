#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aulao49/aula049.c"
#line 21 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aulao49/aula049.c"
sbit LCD_RS at RB1_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;


sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;







void interrupt();


char txt[7];
unsigned char Tempo_H, Tempo_L;
unsigned int Periodo;


void main() {
 CMCON = 0X07;
 TRISA = 0XFF;
 TRISB = 0X08;
 PORTA = 0XFF;
 PORTB = 0X00;
 INTCON = 0XC0;
 TMR1IE_bit = 0X00;
 CCP1IE_bit = 0X01;
 CCP1CON = 0X05;

 T1CKPS1_bit = 0X00;
 T1CKPS0_bit = 0X00;
 TMR1CS_bit = 0X00;
 TMR1ON_bit = 0X00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Medida de Pulso");
 Lcd_Out(2, 14, "us");
 delay_ms(100);

 while(1)
 {
 delay_ms(100);
 Periodo = (Tempo_H << 8) + Tempo_L;
 IntToStr(Periodo, txt);
 Lcd_Out(2, 8, txt);
 }

}


void interrupt(){
 if(CCP1IF_bit && CCP1CON.B0){
 CCP1IF_bit = 0x00;
 CCP1IE_bit = 0x00;
 CCP1CON = 0x04;
 TMR1H = 0x00;
 TMR1L = 0x00;
 TMR1ON_bit = 0x01;
 } else if(CCP1IF_bit){
 CCP1IF_bit = 0x00;
 TMR1ON_bit = 0x01;
 CCP1IE_bit = 0x00;
 CCP1CON = 0x05;
 TMR1H = CCPR1H;
 TMR1L = CCPR1L;

 }
}
