#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula041.c"
#line 30 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula041.c"
void interrupt();


unsigned char aux = 0;


void main() {
 CMCON = 0b00000111;

 T1CON = 0b00110001;

 TMR1H = 0xFC;
 TMR1L = 0x18;

 GIE_bit = 1;
 PEIE_bit = 1;
 TMR1IE_bit = 1;
 TMR1IF_bit = 0;


 TRISC = 0;
 PORTC = 0;

 while(1){

 }




}


void interrupt(){
 if(TMR1IF_bit){
 TMR1IF_bit = 0;

 TMR1H = 0xFC;
 TMR1L = 0x18;

 RC4_bit = 0;

 aux++;

 if(aux == 50){
 aux = 0;
 RC4_bit = 1;
 RC5_bit = ~RC5_bit;
 }





 }
}
