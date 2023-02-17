#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula049_CCP_Comparador.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula049_CCP_Comparador.c"
unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;

void interrupt();


void main() {

 TRISC = 0b00000000;
 PORTC = 0b00000000;

 T1CON = 0b00010001;


 TMR1H = 0;
 TMR1L = 0;


 CCP2M3_bit = 1;
 CCP2M2_bit = 0;
 CCP2M1_bit = 0;
 CCP2M0_bit = 0;



 INTCON = 0b11000000;

 TMR1IE_bit = 0;
 CCP2IE_bit = 1;

 CCPR2H = 0x02;
 CCPR2L = 0xBC;


 while(1){



 }

}


 void interrupt(){

 if(CCP2IF_bit){
 if(flag.b0){
 flag.b0 = 0;
 TMR1H = 0;
 TMR1L = 0;
 CCP2M0_bit = 1;
 } else {
 flag.b0 = 1;
 TMR1H = 0;
 TMR1L = 0;
 CCP2M0_bit = 0;
 }
 CCP2IF_bit = 0;
 }

 }
