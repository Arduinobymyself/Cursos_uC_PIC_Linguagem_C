#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/04_MICRO_I_LAB/programa_02.c"








void main() {
ADCON1 = 0b00000111;
TRISB = 0b11111111;
TRISC = 0b00000000;
PORTB = 0b11111111;
PORTC = 0b00000000;

while(1){
if(PORTB.RB0 == 0){
PORTC.RC6 = 1;
}
if(PORTB.RB1 == 0){
PORTC.RC6 = 0;
}
if(PORTB.RB2 == 0){
PORTC.RC7 = 1;
}
if(PORTB.RB3 == 0){
PORTC.RC7 = 0;
}


}

}
