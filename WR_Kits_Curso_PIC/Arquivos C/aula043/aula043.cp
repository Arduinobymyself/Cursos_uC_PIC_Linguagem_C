#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula043.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula043.c"
void main() {
 CMCON = 0X07;

 T1CON = 0B00110001;
 TMR1L = 0;
 TMR1H = 0;

 CCP1CON = 0b00001011;








 CCPR1L = 255;
 CCPR1H = 255;


 TRISC = 0;
 PORTC = 0;

 while(1)
 {
 if(CCP1IF_bit){
 CCP1IF_bit =0;
 RC0_bit = ~RC0_bit;
 }

 }

}
