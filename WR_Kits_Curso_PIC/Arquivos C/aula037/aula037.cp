#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula037.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula037.c"
void interrupt();


bit control;


void main() {
 CMCON = 0X07;
 OPTION_REG = 0b10001110;
 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.INTE = 1;

 TRISA = 0b00000011;
 PORTA = 0b00000011;
 TRISB = 0b00000001;
 PORTB = 0b00000001;

  RA3_bit  = 0;
  RA2_bit  = 0;

 control = 0;

 while(1)
 {
  RA3_bit  = ~ RA3_bit ;
 delay_ms(500);
 }

}


void interrupt(){
 if(INTCON.INTF){
 INTCON.INTF = 0;
 control = ~control;
  RA2_bit  = ~ RA2_bit ;
 if(control){
 asm sleep;
 }
 }
}
