//************************ TESTE KIT DIDÁTICO ************************
// Testar o Display de 7 Segmentos
// B0 liga todos os LEDs do DSP1, B1 desliga
// B2 liga todos os LEDs do DSP2, B3 dseliga
// PIC 16F877A, cristal de 8MHz, Compilador MikroC PRO for PIC
//********************************************************************


void main() {
ADCON1 = 0b00000111;    // configura pinos de I/O como digital
TRISB = 0b11111111;     // configura port B como entrada digital
TRISC = 0b00000000;     // configura port C como saída digital
TRISD = 0b00000000;     // configura port D como saída digital
PORTB = 0b11111111;     // port B com pull-up
PORTC = 0b00000000;     // port C inicia em nível baixo
PORTD = 0b00000000;     // port D inicia em nível baixo

while(1){
if(PORTB.RB0 == 0){
PORTD = 0b11111111;
PORTC.RC4 = 1;
}
if(PORTB.RB1 == 0){
PORTC.RC4 = 0;
}
if(PORTB.RB2 == 0){
PORTD = 0b11111111;
PORTC.RC5 = 1;
}
if(PORTB.RB3 == 0){
PORTC.RC5 = 0;
}


}

}