#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula033.c"
#line 20 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula033.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 50 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula033.c"
void chrWrite(char number);
unsigned char StrToValue(char dez, char uni);


char control = 1;
char *text = "PWM Config";
char value = 0;
char aux = 1;
char store = 0;
char dezena = 0;
char unidade = 0;


void interrupt(){
 if(TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 0;
 if( RB1_bit  && control == 0x01){
 control = 0x02;
  RB1_bit  = 0x00;
  RB2_bit  = 0x01;
  RB3_bit  = 0x01;
 if(! RB4_bit ) chrWrite(1);
 else if(! RB5_bit ) chrWrite(4);
 else if(! RB6_bit ) chrWrite(7);
 else if(! RB7_bit ) value = 50;
 }
 if( RB2_bit  && control == 0x02){
 control = 0x03;
  RB1_bit  = 0x01;
  RB2_bit  = 0x00;
  RB3_bit  = 0x01;
 if(! RB4_bit ) chrWrite(2);
 else if(! RB5_bit ) chrWrite(5);
 else if(! RB6_bit ) chrWrite(8);
 else if(! RB7_bit ) chrWrite(0);
 }
 if( RB3_bit  && control == 0x03){
 control = 0x01;
  RB1_bit  = 0x01;
  RB2_bit  = 0x01;
  RB3_bit  = 0x00;
 if(! RB4_bit ) chrWrite(3);
 else if(! RB5_bit ) chrWrite(6);
 else if(! RB6_bit ) chrWrite(9);
 else if(! RB7_bit ) aux = 0x00;
 }
 }
}




void main() {
 CMCON = 0X07;
 ADCON1 = 0x07;

 OPTION_REG = 0b10000111;
 GIE_bit = 1;
 PEIE_bit = 1;
 TMR0IE_bit = 1;

 TMR0 = 0;

 TRISB = 0xF0;
 PORTB = 0xFF;
 TRISC = 0b11111011;
 TRISD = 0b00000011;

 TRISA = 0X03;
 PORTA = 0X03;


 PWM1_Init(2000);

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 4, text);

 PWM1_Start();


 while(1){
  Lcd_Out(2, 1, "Valor Duty: "); Lcd_Chr_CP(dezena+48); Lcd_Chr_CP(unidade+48); ;
 if(!aux){
 value = StrToValue(dezena, unidade);
 aux = 1;
 store = 0;
 }
 PWM1_Set_Duty((value*255)/100);
 delay_ms(100);
 }

}


void chrWrite(char number){
 if(store == 0){
 dezena = number;
 store = 1;
 } else {
 unidade = number;
 }
}

unsigned char StrToValue(char dez, char uni){
 unsigned char result;
 result = (10*dez)+uni;
 return result;
}
