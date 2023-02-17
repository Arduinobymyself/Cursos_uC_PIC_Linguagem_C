#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula034.c"





void interrupt();


void main() {

 CMCON = 7;

 OPTION_REG.INTEDG = 1;
 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.INTE = 1;
 INTCON.INTF = 0;

 TRISB = 0b00000001;
 PORTB = 0b00000001;
 TRISD = 0;
 PORTD = 0;

 while(1){
 RD0_bit = ~RD0_bit;
 delay_ms(500);
 }
}

void interrupt(){
 if(INTF_bit){
 INTF_bit = 0;
 RD7_bit = ~RD7_bit;
 }
}
