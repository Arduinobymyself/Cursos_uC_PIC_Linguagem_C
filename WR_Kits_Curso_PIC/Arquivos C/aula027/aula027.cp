#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula027.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula027.c"
void interrupt();




void main() {
 CMCON = 7;

 OPTION_REG = 0b10000110;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.T0IE = 1;

 TMR0 = 0x6C;


 TRISA = 0X03;
 PORTA = 0X03;



 while(1)
 {


  RA2_bit  = 0;
 delay_ms(500);
  RA2_bit  = 1;
 delay_ms(500);

 }

}


void interrupt(){

 if(INTCON.T0IF == 1){
 INTCON.T0IF = 0;
 TMR0 = 0x6C;


 if(! RA1_bit ){
  RA3_bit  = 1;
 }
 else if(! RA0_bit ){
  RA3_bit  = 0;
 }

 }
}
