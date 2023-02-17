#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_display7seg_multiplexados.c"
#line 17 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_display7seg_multiplexados.c"
void display(int num);
void changeCount();


unsigned char i;
int tempo = 100;
int cnt = 0, num = 0;
unsigned char digitosCC[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
unsigned char digitosCA[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x82, 0x78, 0x00, 0x90, 0x88, 0x83, 0xC6, 0xA1, 0x86, 0x8E};


void main() {

 TRISA = 0b00000011;
 PORTA = 0b00000011;
 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){

 changeCount();
 display(cnt);

 }

}

void display(int num){

 PORTB = digitosCA[num/10];
  RA2_bit  = 0;
 delay_ms(5);
  RA2_bit  = 1;

 PORTB = digitosCA[num%10];
  RA3_bit  = 0;
 delay_ms(5);
  RA3_bit  = 1;

}

void changeCount()
{
 while( Button(&PORTA, 0, 50, 0) ){
 cnt += 1;
 delay_ms(200);
 if(cnt > 99) cnt = 99;
 }

 while( Button(&PORTA, 1, 50, 0) ){
 cnt -= 1;
 delay_ms(200);
 if(cnt < 1) cnt = 0;
 }

}
