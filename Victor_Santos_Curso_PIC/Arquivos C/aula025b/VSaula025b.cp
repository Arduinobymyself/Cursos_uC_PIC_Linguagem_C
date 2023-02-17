#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula025b.c"
#line 26 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula025b.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;










char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
unsigned int valorAD0 = 0;
unsigned int valorAD1 = 0;
unsigned char texto3[6];
unsigned char texto4[6];
bit flagB0;


void main() {

 ADCON0 = 0b00000000;
 ADCON1 = 0b11000100;
 TRISA = 0b00000011;

 TRISB.RB0 = 1;
 TRISB.RB1 = 1;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISE = 0x00;
 PORTE = 0x00;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);

 Lcd_Out(1, 1, texto1);
 Lcd_Out(2, 1, texto2);
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "AN0 = ");
 Lcd_Out(2, 1, "AN1 = ");

 while(1){

 ADCON0.CHS2 = 0;
 ADCON0.CHS1 = 0;
 ADCON0.CHS0 = 0;
 ADCON0.ADON = 1;
 delay_us(20);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE);

 valorAD0 = (ADRESH << 8) + ADRESL;

 ADCON0.ADON = 0;
 delay_us(20);

 WordToStr(valorAD0, texto3);
 Lcd_Out(1, 7, texto3);


 ADCON0.CHS2 = 0;
 ADCON0.CHS1 = 0;
 ADCON0.CHS0 = 1;
 ADCON0.ADON = 1;
 delay_us(20);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE);

 valorAD1 = (ADRESH << 8) + ADRESL;

 ADCON0.ADON = 0;
 delay_us(20);

 WordToStr(valorAD1, texto4);
 Lcd_Out(2, 7, texto4);



 if(! Button(&PORTB, 0, 50, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if( Button(&PORTB, 0, 50, 0)  && flagB0 == 1){
  RD0_bit  = ~ RD0_bit ;
 flagB0 = 0;
 }


 }

}
