#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula037_Timer1_Temporizador.c"



void interrupt();

void main() {
 TRISD = 0;
 PORTD = 0;


 T1CON.T1CKPS0 = 1;
 T1CON.T1CKPS1 = 0;
 T1CON.T1OSCEN = 0;
 T1CON.NOT_T1SYNC = 1;
 T1CON.TMR1CS = 0;
 T1CON.TMR1ON = 1;

 TMR1H = 0x3C;
 TMR1L = 0xB0;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 PIE1.TMR1IE = 1;
 PIR1.TMR1IF = 0;


 while(1){
 RD7_bit = ~RD7_bit;
 delay_ms(100);
 }

}

void interrupt(){
 if(PIR1.TMR1IF){
 PIR1.TMR1IF = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 RD0_bit = ~RD0_bit;
 }
}
