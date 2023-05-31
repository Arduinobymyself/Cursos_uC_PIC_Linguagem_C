#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Efeitos/Efeitos.c"
#line 21 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Efeitos/Efeitos.c"
void bip();
void erro();


int efeito = 0;


void main() {

 int i = 0;
 int control = 255;

 CMCON = 0x07;
 ADCON0 = 0x00;
 ADCON1 = 0x07;
 TRISC = 0x00;
 PORTC = 0X00;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0x07;
 PORTB = 0X00;


 while(1)
 {
 if(PORTB.RB0 == 0){
 efeito = 1;
 bip();
 }

 if(PORTB.RB1 == 0){
 efeito = 2;
 bip();
 delay_ms(500);
 bip();
 }

 if(PORTB.RB2 == 0){
 switch(efeito){
 case 1:
 PORTD = control;
 delay_ms(250);
 for(i = 0; i < 8; i++){
 control = control << 1;
 PORTD = control;
 delay_ms(250);
 }
 control = 255;
 efeito = 0;
 break;
 case 2:
 PORTD = control;
 delay_ms(250);
 for(i = 0; i < 8; i++){
 control = control >> 1;
 PORTD = control;
 delay_ms(250);
 }
 control = 255;
 efeito = 0;
 break;
 case 0:
 efeito = 0;
 erro();
 break;
 }
 }



 }

}



void bip(){
 PORTC.RC1 = 1;
 delay_ms(500);
 PORTC.RC1 = 0;
}
void erro(){
 int i;
 for(i = 0; i < 5; i++){
 PORTC.RC1 = 1;
 delay_ms(500);
 PORTC.RC1 =0;
 delay_ms(500);
 }
}
