#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula050/aula050.c"
#line 33 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula050/aula050.c"
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









void trigger();


char txt[7];
unsigned char Tempo_H, Tempo_L;
unsigned int Periodo, Distancia;


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
 Lcd_Out(1, 1, "Distancia:");
 Lcd_Out(2, 14, "cm");
 delay_ms(100);

 while(1)
 {
 trigger();
 delay_ms(100);
 Periodo = (Tempo_H << 8) + Tempo_L;
 Distancia = Periodo / 58;
 IntToStr(Distancia, txt);
 Lcd_Out(2, 8, txt);
 }

}


void interrupt(){
 if(CCP1IF_bit && CCP1CON.B0){
 CCP1IF_bit = 0x00;
 CCP1IE_bit = 0x00;
 CCP1CON = 0x04;
 CCP1IE_bit = 0x01;
 TMR1H = 0x00;
 TMR1L = 0x00;
 TMR1ON_bit = 0x01;
 } else if(CCP1IF_bit){
 CCP1IF_bit = 0x00;
 TMR1ON_bit = 0x00;
 CCP1IE_bit = 0x00;
 CCP1CON = 0x05;
 CCP1IE_bit = 0x01;
 Tempo_H = CCPR1H;
 Tempo_L = CCPR1L;

 }
}

void trigger(){
  RB2_bit  = 0x01;
 delay_us(10);
  RB2_bit  = 0x00;
}
