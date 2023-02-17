#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Teste_Reles.c"
void main() {
 ADCON1 = 6;
 CMCON = 7;
 TRISC.RC0 = 0;
 TRISE.RE0 = 0;
 PORTC.RC0 = 0;
 PORTE.RE0 = 0;

 do{

 PORTC.RC0 = 0;
 PORTE.RE0 = 1;
 delay_ms(1000);
 PORTC.RC0 = 1;
 PORTE.RE0 = 0;
 delay_ms(1000);

 }while(1);
}
