#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula050_CCP_PWM.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula050_CCP_PWM.c"
unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;


void main() {

 TRISC = 0b00000000;
 PORTC = 0b00000000;


 T2CON = 0b00000100;










 PR2 = 255;


 CCP2M3_bit = 1;
 CCP2M2_bit = 1;
 CCP2M1_bit = 1;
 CCP2M0_bit = 1;

 CCP2X_bit = 0;
 CCP2Y_bit = 0;
 CCPR2L = 50;



 while(1){



 }

}
