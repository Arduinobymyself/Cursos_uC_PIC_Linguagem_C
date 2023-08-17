#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula055/aula055.c"
#line 57 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula055/aula055.c"
char flag0 = 0x00;
unsigned int time1, time2;
unsigned long freq;




void main() {
 CMCON = 0X07;
 OPTION_REG = 0x80;
 T1CON = 0X01;
 CCP1CON = 0X07;
 CCP1IE_bit = 0X01;
 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 T0IE_bit = 0x01;
 TMR0 = 0x06;
 TRISA = 0XFF;
 TRISB = 0XF9;
 PORTA = 0XFF;
 PORTB = 0X00;


 while(1)
 {
 time2 = abs(time2 - time1);
 time2 = (time2) >> 4;
 freq = 1/ (time2 * 1E-6);

 if(freq > 950 && freq < 1050){

  RB2_bit  = 0x01;
 } else{

  RB2_bit  = 0x00;
 }

 flag0.B1 - 0x00;
 delay_ms(100);
 }

}


void interrupt(){

 if(T0IF_bit){

 T0IF_bit = 0x00;
 TMR0 = 0x06;
  RB1_bit  = ~ RB1_bit ;
 }

 if(CCP1IF_bit){

 CCP1IF_bit = 0x00;
 if(!flag0.B0){

 time1 = (CCPR1H << 8) + CCPR1L;
 flag0.B0 = 0x01;
 } else {

 time2 = (CCPR1H << 8) + CCPR1L;
 flag0.B0 = 0x00;
 flag0.B1 = 0x01;
 }
 }
}
