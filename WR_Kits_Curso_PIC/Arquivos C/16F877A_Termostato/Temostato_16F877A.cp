#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/16F877A_Termostato/Temostato_16F877A.c"


sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD2_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD2_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;




void Celsius();
void Fahrenheit();
void CustomChar(char pos_row, char pos_char);
long average_temp();
void termostato(unsigned int tempMin, unsigned int tempMax);
void LCD_BusyFlag();
#line 51 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/16F877A_Termostato/Temostato_16F877A.c"
unsigned long store, t_Celsius, t_Fahrenheit;
unsigned char dezena, unidade, dec1, dec2;
unsigned char *text;
const char character[] = {6,9,6,0,0,0,0,0};




void main()
{


 TRISA = 0b11000001;
 TRISB = 0x80;
 TRISD = 0x00;

 CMCON = 0b00000111;
 ADCON0 = 0b00000001;


 PORTA = 0x00;
 PORTB = 0x00;
 PORTD = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);



 text=("TEMPERATURA");
 lcd_out(1,3,text);

 text=("Temp =");
 lcd_out(2,1,text);


 while(1)
 {
 if(! RB7_bit ) Celsius();

 else Fahrenheit();

 }

}

void Celsius(){
 store = average_temp();
 t_Celsius = (store* 5 * 100 )/ 1023 ;


 dezena = t_Celsius / 10;
 unidade = t_Celsius % 10;
 dec1 = (((store* 5 * 100 )% 1023 )*10)/ 1023 ;
 dec2 = (((((store* 5 * 100 )% 1023 )*10)% 1023 )*10)/ 1023 ;


  lcd_chr(2,9,dezena+48); lcd_chr_cp(unidade+48); lcd_chr_cp('.'); lcd_chr_cp(dec1+48); lcd_chr_cp(dec2+48); CustomChar(2,14); ;

 Lcd_Out(2, 15, "C");

 termostato(20, 24);

 delay_ms(800);
}

void Fahrenheit(){
 store = average_temp();
 t_Celsius = (store* 5 * 100 )/ 1023 ;

 t_Fahrenheit = (t_Celsius*1.8)+32;



 dezena = t_Fahrenheit/10;
 unidade = t_Fahrenheit % 10;
 dec1 = (((store* 5 * 100 )% 1023 )*10)/ 1023 ;
 dec2 = (((((store* 5 * 100 )% 1023 )*10)% 1023 )*10)/ 1023 ;

  lcd_chr(2,9,dezena+48); lcd_chr_cp(unidade+48); lcd_chr_cp('.'); lcd_chr_cp(dec1+48); lcd_chr_cp(dec2+48); CustomChar(2,14); ;

 Lcd_Out(2, 15, "F");

 termostato(20, 24);

 delay_ms(800);

}

long average_temp(){
 unsigned char i;
 unsigned long temp_store = 0;

 for(i=0; i<100; i++)
 {
 temp_store += ADC_Read(0);
 }

 return(temp_store/100);
}

void CustomChar(char pos_row, char pos_char)
{
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void termostato(unsigned int tempMin, unsigned int tempMax){
 if(t_Celsius < tempMin){

  RB0_bit  = 0;
  RB2_bit  = 1;
  RB1_bit  = 0;
  RB3_bit  = 1;
  RB4_bit  = 0;
 } else if(t_Celsius > tempMax){

  RB0_bit  = 1;
  RB2_bit  = 0;
  RB1_bit  = 0;
  RB3_bit  = 0;
  RB4_bit  = 1;
 } else {

  RB0_bit  = 0;
  RB2_bit  = 0;
  RB1_bit  = 1;
  RB3_bit  = 0;
  RB4_bit  = 0;
 }
}

void LCD_BusyFlag(){
 LCD_D7 = 1;
 LCD_EN = 1;
 LCD_RS = 0;

 while(LCD_D7){
 LCD_EN = 0;
 delay_ms(10);
 LCD_EN = 1;
 delay_ms(10);
 }
}
