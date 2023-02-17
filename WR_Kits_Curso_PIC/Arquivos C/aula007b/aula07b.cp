#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula07b.c"
int control = 0b00000001;

void main() {

 trisb = 0x00;
 portb = 0xff;


 while(1){
 portb = control;
 delay_ms(200);
 control = control << 1;
 if(control == 0b10000000){
 while(control != 0b00000001){
 portb = control;
 control = control >> 1;
 delay_ms(200);
 }

 }
 }

}
