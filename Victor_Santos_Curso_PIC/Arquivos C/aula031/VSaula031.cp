#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula031.c"



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



unsigned int valorAD0 = 0, valor0 = 0;
unsigned int valorAD1 = 0, valor1 = 0;
char texto[6];

void converter(unsigned int valor);



void main() {

 ADCON0 = 0b00000001;
 ADCON1 = 0b11000100;
 TRISA = 0b000000011;


 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1, 1, "  ABMS Telecom  ");
 Lcd_Out(2, 1, " Seja Bem Vindo!");
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);


 while(1){
 Lcd_Out(1, 1, "AN0 =" );
 Lcd_Out(2, 1, "AN1 =" );
 valorAD0 = ADC_Get_Sample(0);
 valorAD1 = ADC_Get_Sample(1);

 if(valor0 != valorAD0){
 valor0 = valorAD0;
 WordToStr(valorAD0, texto);
 Lcd_Out(1, 6, "    ");
 Lcd_Out(1, 6, Ltrim(texto));
 valorAD0 = valorAD0*0.09775171;
 WordToStr(valorAD0, texto);
 Lcd_Out(1, 12, "    ");
 Lcd_Out(1, 11, Ltrim(texto));
 Lcd_Chr_CP('%');
 }

 if(valor1 != valorAD1){
 valor1 = valorAD1;
 WordToStr(valorAD1, texto);
 Lcd_Out(2, 6, "    ");
 Lcd_Out(2, 6, Ltrim(texto));
 valorAD1 = 100-valorAD1*0.09775171;
 WordToStr(valorAD1, texto);
 Lcd_Out(2, 12, "    ");
 Lcd_Out(2, 11, Ltrim(texto));
 Lcd_Chr_CP('%');
 }






 }

}

void converter(unsigned int valor){
 texto[0] = valor/1000;
 texto[1] = (valor/100)%10;
 texto[2] = (valor/10)%10;
 texto[3] = (valor/1)%10;
}
