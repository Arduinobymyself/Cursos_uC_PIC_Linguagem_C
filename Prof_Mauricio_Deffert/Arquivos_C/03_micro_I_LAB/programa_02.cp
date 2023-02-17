#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/03_micro_I_LAB/programa_02.c"







void main() {

 ADCON1 = 0b00000111;
 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISB = 0b00000001;
 PORTB = 0b00000001;

 while(1){

 if(PORTB.RB0 == 0){
 PORTD.RD0 = 1;
 } else{
 PORTD.RD0 = 0;
 }

 }

}
