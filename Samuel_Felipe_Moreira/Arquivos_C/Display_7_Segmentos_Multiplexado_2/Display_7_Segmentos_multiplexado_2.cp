#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Display_7_Segmentos_multiplexado_2.c"

int numero[16] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113};

int erro[3] = {121, 80, 92};
int display[5] = {0, 4, 8, 16, 32};
int tempo = 1;


void main() {

 CMCON = 7;

 ADCON0 = 0;
 ADCON1 = 7;

 TRISD = 0;
 PORTD = 0;
 TRISA = 0;
 PORTA = 0;


 while(1){


 PORTD = erro[0];
 PORTA.RA2 = 1;
 Vdelay_ms(tempo);
 PORTA.RA2 = 0;
 Vdelay_ms(tempo);


 PORTD = erro[1];
 PORTA.RA3 = 1;
 Vdelay_ms(tempo);
 PORTA.RA3 = 0;
 Vdelay_ms(tempo);


 PORTD = erro[1];
 PORTA.RA4 = 1;
 Vdelay_ms(tempo);
 PORTA.RA4 = 0;
 Vdelay_ms(tempo);


 PORTD = erro[2];
 PORTA.RA5 = 1;
 Vdelay_ms(tempo);
 PORTA.RA5 = 0;
 Vdelay_ms(tempo);

 }

}
