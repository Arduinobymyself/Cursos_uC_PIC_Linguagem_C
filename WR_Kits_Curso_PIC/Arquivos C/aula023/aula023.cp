#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula023.c"
#line 24 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula023.c"
void interrupt();


int counter = 0;


void main() {

 OPTION_REG = 0b10000001;
 INTCON = 0b11100000;


 TMR0 = 6;

 TRISB.RB4 = 0;
 RB4_bit = 0;


 while(1)
 {
 if(counter == 500){
 RB4_bit = ~RB4_bit;
 counter = 0;
 }
 }

}


void interrupt(){

 if(T0IF_bit){
 counter++;
 TMR0 = 6;
 T0IF_bit = 0;
 }
}
