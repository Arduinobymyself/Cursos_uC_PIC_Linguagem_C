#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula045/aula045.c"
#line 19 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula045/aula045.c"
void servo_slowUp();
void servo_slowDown();

unsigned char duty = 0x00;
int ADC = 0x00;

void interrupt();

void main() {

 CMCON = 0x07;
 OPTION_REG = 0x87;
 GIE_bit = 1;
 PEIE_bit = 1;
 TMR0IE_bit = 1;
 ADON_bit = 1;
 ADCON1 = 0x0E;
 TRISA = 0xFF;
 TRISC = 0XFE;
 PORTC = 0XFE;

 duty = 23;

 while(1){
 servo_slowUp();
 delay_ms(2000);
 servo_slowDown();
 delay_ms(2000);
 }
}



void servo_slowUp(){
 char i;
 for(i=9; i<38;i++){
 duty = i;
 Vdelay_ms( 50 );
 }
}

void servo_slowDown(){
 char i;
 for(i=37; i>8;i--){
 duty = i;
 Vdelay_ms( 50 );
 }
}


void interrupt(){

 if(TMR0IF_bit){
 TMR0IF_bit = 0;
 if( RC0_bit ){
 TMR0 = duty;
  RC0_bit  = 0;
 } else {
 TMR0 = 255 - duty;
  RC0_bit  = 1;
 }
 }




}
