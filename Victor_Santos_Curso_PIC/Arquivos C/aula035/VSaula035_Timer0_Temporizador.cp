#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula035_Timer0_Temporizador.c"



void interrupt();

void main() {
 TRISD = 0;
 PORTD = 0;

 OPTION_REG.T0CS = 0;
 OPTION_REG.T0SE = 0;
 OPTION_REG.PSA = 0;
 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 1;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;
 TMR0 = 0;

 while(1){
 RD7_bit = ~RD7_bit;
 delay_ms(32);
 }

}

void interrupt(){
 if(INTCON.TMR0IF){
 INTCON.TMR0IF = 0;
 TMR0 = 0;
 RD0_bit = ~RD0_bit;


 }
}
