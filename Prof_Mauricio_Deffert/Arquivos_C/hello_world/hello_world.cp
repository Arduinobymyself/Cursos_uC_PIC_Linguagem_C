#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/hello_world.c"
void main() {
 TRISB = 0;
 PORTB = 0;
 while(1){
 PORTB.RB0 = 1;
 delay_ms(500);
 PORTB.RB0 = 0;
 delay_ms(500);
 }

}
