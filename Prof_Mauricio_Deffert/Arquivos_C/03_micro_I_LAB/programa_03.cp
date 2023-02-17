#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/03_micro_I_LAB/programa_03.c"







void main() {

 ADCON1 = 0b00000111;
 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISB = 0b00000011;
 PORTB = 0b00000011;

 while(1){
 if(PORTB.RB0 == 0) PORTD.RD1 = 1;
 if(PORTB.RB1 == 0) PORTD.RD1 = 0;
 PORTD.RD0 = ~PORTD.RD0;
 delay_ms(200);
 }

}
