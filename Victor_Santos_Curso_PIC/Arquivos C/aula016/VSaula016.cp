#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula016.c"
#line 32 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula016.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;










bit flagB0;
unsigned char contB0 = 0;

char texto1[] = "  ABMS Telecom  ";
char texto2[] = "   Led0 Aceso   ";
char texto3[] = "  Led0 Apagado  ";


void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0b00000011;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);


 Lcd_Out(1, 1, texto1);

 while(1){
#line 88 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula016.c"
 if(! Button(&PORTB, 0, 50, 0)  && flagB0 == 0){
 flagB0 = 1;

 }
 if( Button(&PORTB, 0, 50, 0)  && flagB0 == 1){
 flagB0 = 0;
 contB0++;
 }


 switch(contB0){
 case 1:  RD0_bit  = 1; Lcd_Out(2, 1, texto2); break;
 case 2:  RD0_bit  = 0; Lcd_Out(2, 1, texto3); contB0 = 0; break;
 }


 }

}
