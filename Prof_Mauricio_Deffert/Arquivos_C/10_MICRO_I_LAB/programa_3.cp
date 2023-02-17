#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I_LAB/programa_3.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I_LAB/programa_3.c"
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
 PORTD = 0b11000000;
 delay_ms(100);
 PORTD = 0b00000011;
 delay_ms(100);
 }

}


void interrupt(){

 if(INTCON.INTF == 1){

 PORTD = 0b10000001;
 delay_ms(200);
 PORTD = 0b01000010;
 delay_ms(200);
 PORTD = 0b00100100;
 delay_ms(200);
 PORTD = 0b00011000;
 delay_ms(200);
 PORTD = 0b00100100;
 delay_ms(200);
 PORTD = 0b01000010;
 delay_ms(200);
 PORTD = 0b10000001;
 delay_ms(200);

 INTCON.INTF = 0;

 }
}
