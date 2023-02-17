#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/LCD-Relogio-Digital.c"
#line 7 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/LCD-Relogio-Digital.c"
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


char segundos = 0, minutos = 0, horas = 0;

char *clock = "00:00:00";


unsigned int cont;
char Flags = 0;


void interrupt();
void setupMCU();


void main(){

 setupMCU();

 while(1){
 clock[0] = horas/10+'0';
 clock[1] = horas%10+'0';
 clock[3] = minutos/10+'0';
 clock[4] = minutos%10+'0';
 clock[6] = segundos/10+'0';
 clock[7] = segundos%10+'0';

 Lcd_Out(2, 5, clock);

 if(PORTB.RB0) Flags.B0 = 1;
 if(PORTB.RB1) Flags.B1 = 1;
 if(PORTB.RB2) Flags.B2 = 1;

 if(PORTB.RB0 == 0 && Flags.B0){
 Flags.B0 = 0;
 segundos = 0;
 }

 if(PORTB.RB1 == 0 && Flags.B1){
 Flags.B1 = 0;
 minutos++;
 if(minutos >= 60) minutos = 0;
 }

 if(PORTB.RB2 == 0 && Flags.B2){
 Flags.B2 = 0;
 horas++;
 if(horas >= 24) horas = 0;
 }

 }
}

void interrupt(){

 TMR0 = 6;
 cont++;
 INTCON.TMR0IF = 0;

 if(cont == 1000){
 cont = 0;
 segundos++;
 PORTD.RD0 = ~PORTD.RD0;
 if(segundos == 60){
 segundos = 0;
 minutos++;
 if(minutos == 60){
 segundos = 0;
 minutos = 0;
 horas++;
 if(horas == 24){
 segundos = 0;
 minutos = 0;
 horas = 0;
 }
 }
 }
 }

}

void setupMCU(){

 TRISB = 255;
 PORTB = 255;
 TRISD = 0;
 PORTD = 0;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;
 OPTION_REG = 0b10000001;
 TMR0 = 6;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "  Basic  Clock");

}
