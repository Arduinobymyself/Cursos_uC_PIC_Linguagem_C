#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_display7seg.c"
#line 17 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_display7seg.c"
unsigned char i;
int tempo = 400;
unsigned char digitosCC[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
unsigned char digitosCA[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x82, 0x78, 0x00, 0x90, 0x88, 0x83, 0xC6, 0xA1, 0x86, 0x8E};


void main() {

 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){

 for(i=0; i<16; i++){
 PORTB = digitosCA[i];
 Vdelay_ms(tempo);
 }

 }

}