#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula028.c"
#line 35 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula028.c"
void interrupt();
void pulse(char number);


char control = 1;


void main() {
 CMCON = 7;

 OPTION_REG = 0b10000110;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.T0IE = 1;

 TMR0 = 0x6C;


 TRISA = 0X03;
 TRISB = 0XF0;
 PORTA = 0X03;
 PORTB = 0XFF;




 while(1)
 {



 }

}


void interrupt(){

 if(INTCON.T0IF == 1){
 INTCON.T0IF = 0;
 TMR0 = 0x6C;


 if( RB1_bit  && control == 1){
 control = 2;
  RB1_bit  = 0;
  RB2_bit  = 1;
  RB3_bit  = 1;
 if(! RB4_bit ) pulse(1);
 else if(! RB5_bit ) pulse(4);
 else if(! RB6_bit ) pulse(7);
 else if(! RB7_bit ) pulse(11);
 }
 if( RB2_bit  && control == 2){
 control = 3;
  RB1_bit  = 1;
  RB2_bit  = 0;
  RB3_bit  = 1;
 if(! RB4_bit ) pulse(2);
 else if(! RB5_bit ) pulse(5);
 else if(! RB6_bit ) pulse(8);
 else if(! RB7_bit ) pulse(10);
 }
 if( RB3_bit  && control == 3){
 control = 1;
  RB1_bit  = 1;
  RB2_bit  = 1;
  RB3_bit  = 0;
 if(! RB4_bit ) pulse(3);
 else if(! RB5_bit ) pulse(6);
 else if(! RB6_bit ) pulse(9);
 else if(! RB7_bit ) pulse(12);
 }


 }
}

void pulse(char number){
 char i;
 for(i = 0; i < number; i++){
  RA3_bit  = 1;
 delay_ms(200);
  RA3_bit  = 0;
 delay_ms(200);
 }
}
