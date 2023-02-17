#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula030.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula030.c"
void interrupt();




void main() {
 CMCON = 7;

 OPTION_REG = 0b10000110;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.T0IE = 1;

 TMR0 = 0x6C;


 T2CON = 0b00000110;
 PR2 = 255;
 CCPR1L = 0X00;
 CCP1CON = 0b00001100;





 TRISA = 0X03;
 TRISB = 0x00;
 PORTA = 0X03;
 PORTB = 0X00;



 while(1)
 {



 }

}


void interrupt(){

 if(INTCON.T0IF == 1){
 INTCON.T0IF = 0;
 TMR0 = 0x6C;


 if(! RA1_bit ){
 CCPR1L++;
 }
 else if(! RA0_bit ){
 CCPR1L--;
 }

 }
}
