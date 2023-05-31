#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/PWM_1/PWM_1.c"


int duty = 750;

void main() {

 ADCON0 = 0x00;
 ADCON1 = 0X07;
 TRISC.RC2 = 0;
 PORTC.RC2 = 0;

 while(1){
 PORTC.RC2 = 1;
 Vdelay_ms(duty);
 PORTC.RC2 = 0;
 Vdelay_ms(1000 - duty);
 }

}
