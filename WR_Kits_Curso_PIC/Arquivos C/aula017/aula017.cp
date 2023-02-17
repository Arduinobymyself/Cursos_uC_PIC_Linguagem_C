#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula017.c"







void main() {
 CMCON = 0X07;
 TRISA = 0b00000001;
 PORTA = 0b00000000;
 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){
 if(RA0_bit)
 {
 RB1_bit = 1;
 delay_ms(1000);
 RB1_bit = 0;
 }

 }


}
