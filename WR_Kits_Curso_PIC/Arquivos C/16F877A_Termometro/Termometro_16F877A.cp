#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/16F877A_Termometro/Termometro_16F877A.c"

sbit LCD_RS at RA1_bit;
sbit LCD_EN at RA3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISA1_bit;
sbit LCD_EN_Direction at TRISA3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;








void disp_t();


unsigned char* text;
unsigned char dezena, unidade, decimos, centesimos;
unsigned long int store, t_Celsius, t_Fahrenheit;


void main(){
 ADCON0 = 0b00000001;
 ADCON1 = 0b00001110;



 TRISA = 0b11110101;
 TRISD = 0b00000100;
 PORTA = 0b00000000;
 PORTD = 0b00000001;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 text = ("TEMPERATURA");
 Lcd_Out(1, 3, text);
 text = ("Temp =");
 Lcd_Out(2, 1, text);


 while(1){
 store = ADC_Read(0);
 t_Celsius = (store *  5  *  100 ) /  1023 ;
 dezena = t_Celsius / 10;
 unidade = t_Celsius % 10;
 decimos = (((store *  5  *  100 ) %  1023 ) * 10) /  1023 ;
 centesimos = (((((store *  5  *  100 ) %  1023 ) * 10) %  1023 ) * 10) /  1023 ;

 Lcd_Chr(2, 9, dezena + 48);
 Lcd_Chr_Cp(unidade + 48);
 Lcd_Chr_Cp('.');
 Lcd_Chr_Cp(decimos + 48);
 Lcd_Chr_Cp(centesimos + 48);

 delay_ms(800);

 }

}

void disp_t(){
 Lcd_Chr(2, 9, dezena + 48);
 Lcd_Chr_CP(unidade + 48);
 Lcd_Chr_CP('.');
 Lcd_Chr_CP(decimos + 48);
 Lcd_Chr_CP(centesimos + 48);
}
