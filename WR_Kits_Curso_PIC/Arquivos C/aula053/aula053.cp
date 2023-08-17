#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula053/aula053.c"
#line 36 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula053/aula053.c"
void interrupt();




void main() {
 CMCON = 0x07;
 OPTION_REG = 0b10111000;




 INTCON = 0b10100000;


 TMR0 = 250;

 TRISA = 0b11110111;
  RA3_bit  = 0;

 while(1)
 {

 }

}


void interrupt(){

 if(T0IF_bit){

 T0IF_bit = 0;
 TMR0 = 250;
  RA3_bit  = ~ RA3_bit ;
 }

}
