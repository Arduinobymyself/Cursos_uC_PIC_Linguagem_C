#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I/WDT_Teste.c"
void main() {
 ADCON1 = 7;
 TRISB = 0xFF;
 PORTB = 0xFF;
 TRISD = 0x00;
 PORTD = 0b11000000;

 OPTION_REG = 0b10001100;


 while(1){
 PORTD.RD0 = ~PORTD.RD0;
 asm clrwdt;
 delay_ms(500);



 }
}
