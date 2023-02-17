#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula039.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula039.c"
void interrupt();




void main() {
 CMCON = 0b00000111;

 GIE_bit = 1;
 PEIE_bit = 1;
 RBIE_bit = 1;

 TRISB = 0b11110000;
 PORTB = 0b11110000;
 TRISC = 0b00000000;
 PORTC = 0b00000000;



}


void interrupt(){
 if(RBIF_bit){
 RBIF_bit = 0;
 RC4_bit = ~RC4_bit;
 delay_us(500);
 }
}
