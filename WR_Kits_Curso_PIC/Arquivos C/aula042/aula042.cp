#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula042.c"
#line 24 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula042.c"
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




unsigned int pulse = 0;
char texto[7];


void main() {
 CMCON = 0b00000111;

 T1CON = 0b00000011;



 TMR1H = 0;
 TMR1L = 0;


 TRISB= 0;
 PORTB = 0;
 TRISC = 0b00000001;
 PORTC = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);



 while(1){

 pulse = (TMR1H << 8) + TMR1L;
 IntToStr(pulse, texto);
 Lcd_Out(1, 1, "    CONTADOR    ");
 Lcd_Out(2, 1, "Pulsos: ");
 Lcd_Out(2, 9, texto);
 if(pulse%10 == 0){
 RC4_bit = ~RC4_bit;
 delay_ms(200);
 }


 }


}
