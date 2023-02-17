#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/04_MICRO_I_LAB/programa_05.c"







void main() {
ADCON1 = 0b00000111;
TRISB = 0b11111111;
TRISC = 0b00000000;
PORTB = 0b11111111;
PORTC = 0b00000000;


while(1){
 if(PORTB.RB0 == 0){
 PORTC.RC3 = 1;
 }
 if(PORTB.RB1 == 0){
 PORTC.RC3 = 0;
 }
}

}
