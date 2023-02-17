#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula040.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula040.c"
void main() {
 CMCON = 0b00000111;

 T1CON = 0b00110001;

 TMR1H = 0;
 TMR1L = 0;

 TRISC = 0;
 PORTC = 0;

 while(1){
 if(TMR1IF_bit){
 TMR1IF_bit = 0;
 RC4_bit = ~RC4_bit;
 }
 }




}
