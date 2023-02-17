#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I_LAB/programa_2.c"
#line 9 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I_LAB/programa_2.c"
unsigned char i;


void interrupt();


void main() {
 ADCON1 = 7;
 CMCON = 7;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.INTE = 1;
 INTCON.INTF = 0;

 TRISB.RB0 = 1;
 TRISD = 0;
 PORTD = 0;

 while(1){
 PORTD.RD0 = ~PORTD.RD0;
 delay_ms(200);
 }

}


void interrupt(){

 if(INTCON.INTF == 1){
 PORTD = 0;
 for(i = 0; i < 5; i++){
 PORTD = ~PORTD;
 delay_ms(1000);
 }
 PORTD = 0;

 INTCON.INTF = 0;

 }
}
