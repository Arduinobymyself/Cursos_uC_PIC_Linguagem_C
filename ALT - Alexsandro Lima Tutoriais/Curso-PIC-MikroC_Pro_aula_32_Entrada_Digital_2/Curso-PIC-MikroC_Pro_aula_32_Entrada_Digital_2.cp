#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_32_Entrada_Digital_2.c"





void main() {
 TRISA = 0b00011111;
 TRISB = 0b00000000;
 PORTA = 0b00000000;
 PORTB = 0b00000000;

 while(1){



 if(!PORTA.RA0 && PORTA.RA1){
 delay_ms(50);
 PORTB.RB0 = 1;
 }
 if(PORTA.RA0 && !PORTA.RA1){
 delay_ms(50);
 PORTB.RB0 = 0;
 }
 }
}
