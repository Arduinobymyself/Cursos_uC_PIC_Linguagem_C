#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula038_Timer0_Timer1.c"



void interrupt();

void main() {
 TRISD = 0;
 PORTD = 0;






 OPTION_REG = 0b10000110;
 TMR0 = 22;






 T1CON = 0b00000101;
 TMR1H = 0x3C;
 TMR1L = 0xAF;


 INTCON = 0b11100100;
 TMR0IF_bit = 0;

 PIE1 = 0b00000001;
 PIR1 = 0b00000001;


 while(1){

 }

}

void interrupt(){
 if(PIR1.TMR1IF){
 PIR1.TMR1IF = 0;
 TMR1H = 0x3C;
 TMR1L = 0xAF;
 RD7_bit = ~RD7_bit;
 }
 if(INTCON.TMR0IF){
 INTCON.TMR0IF = 0;
 TMR0 = 22;
 RD0_bit =~RD0_bit;
 }
}
