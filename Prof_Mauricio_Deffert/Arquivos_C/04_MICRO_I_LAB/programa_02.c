//************************ TESTE KIT DIDÁTICO ************************
// Testar o Motor DC
// B0 liga o Motor DC sentido horário, B1 desliga
// B2 liga o Motor DC sentido anti-horário, B3 dseliga
// PIC 16F877A, cristal de 8MHz, Compilador MikroC PRO for PIC
//********************************************************************


void main() {
ADCON1 = 0b00000111;    // configura pinos de I/O como digital
TRISB = 0b11111111;     // configura port B como entrada digital
TRISC = 0b00000000;     // configura port C como saída digital
PORTB = 0b11111111;     // port B com pull-up
PORTC = 0b00000000;     // port C inicia em nível baixo

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