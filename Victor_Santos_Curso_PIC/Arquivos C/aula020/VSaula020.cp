#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula020.c"
#line 24 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula020.c"
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








void inverte_led();
void escreve_lcd();


bit flagB0;
unsigned char cont = 0;

char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
char texto3[4];


void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0b00000011;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);

 escreve_lcd();
 delay_ms(2000);

 while(1){

 if(! Button(&PORTB, 0, 50, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if( Button(&PORTB, 0, 50, 0)  && flagB0 == 1){
 flagB0 = 0;
 inverte_led();
 cont++;
 Lcd_Cmd(_LCD_CLEAR);
 ByteToStrWithZeros(cont, texto3);
 Lcd_Out(2, 1, "B0 = ");
 Lcd_Out(2, 6, texto3);
 }

 }

}


void inverte_led(){
  RD0_bit  = ~ RD0_bit ;
}

void escreve_lcd(){
 Lcd_Out(1, 1, texto1);
 Lcd_Out(2, 1, texto2);
}
