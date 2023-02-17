#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula036_Timer0Contador.c"



void interrupt();

void main() {
 TRISD = 0;
 PORTD = 0;
 TRISA = 0b00001000;

 OPTION_REG.T0CS = 1;
 OPTION_REG.T0SE = 0;
 OPTION_REG.PSA = 1;
 OPTION_REG.PS2 = 0;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 0;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;
 TMR0 = 250;

 while(1){

 }

}

void interrupt(){
 if(INTCON.TMR0IF){
 INTCON.TMR0IF = 0;
 TMR0 = 250;
 RD0_bit = ~RD0_bit;
 }
}
