#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_1.c"
#line 7 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_1.c"
void main() {
 unsigned int tempo = 100;
 ADCON1 = 7;
 TRISB = 0xFF;
 TRISD = 0x00;
 PORTD = 0x00;

 while(1){

 if(! Button(&PORTB, 0, 50, 0) ) tempo += 100;
 if(! Button(&PORTB, 1, 50, 0) ) tempo -= 100;
 if(tempo < 100) tempo = 100;
 if(tempo > 2000) tempo = 2000;
 PORTD.RD0 = ~PORTD.RD0;
 Vdelay_ms(tempo);
 }

}
