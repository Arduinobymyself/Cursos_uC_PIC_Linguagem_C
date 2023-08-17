#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula054/aula054.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula054/aula054.c"
void interrupt();


unsigned int counter = 0;


void main() {
 CMCON = 0x07;
 OPTION_REG = 0b10000001;



 INTCON = 0b10100000;



 TMR0 = 6;

 TRISB = 0b01111111;
 PORTB = 0b01111111;

 while(1)
 {

 }

}


void interrupt(){

 if(T0IF_bit){

 T0IF_bit = 0;
 TMR0 = 6;
 counter++;
 if(counter == 500){

 counter = 0;
  RB7_bit  = ~ RB7_bit ;
 }
 }

}
