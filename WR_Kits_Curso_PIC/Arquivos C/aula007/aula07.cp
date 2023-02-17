#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula07.c"



int control = 0xff;

void main() {

 trisb = 0x00;
 portb = 0xff;


 while(1){
 portb = control;
 delay_ms(300);
 control = control << 1;
 if(portb == 0x00){
 control = 0xff;
 }
 }

}
