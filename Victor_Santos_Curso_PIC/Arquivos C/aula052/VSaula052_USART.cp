#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula052_USART.c"
#line 71 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula052_USART.c"
short cont = 0;
unsigned char nome[] = "Marcelo Moraes";
unsigned char texto;

void main() {
 TXSTA = 0b00100000;
 RCSTA = 0b10010000;

 SPBRG = 12;
#line 104 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula052_USART.c"
 TRISC6_bit = 0;
 TRISC7_bit = 1;


 TXREG = 'P';
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;

 TXREG = 'I';
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;

 TXREG = 'C';
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;

 TXREG = '\r';
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;

 while(nome[cont] != '\0'){
 TXREG = nome[cont];
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;
 cont++;
 }


 while(1){
 if(PIR1.RCIF){
 texto = RCREG;
 TXREG = texto;
 while(!PIR1.TXIF);
 PIR1.TXIF = 0;
 PIR1.RCIF = 0;
 }
 }

}
