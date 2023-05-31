#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c"
#line 12 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_29_ComandosParaBIT_1.c"
void main() {
 TRISB.RB0 = 0;
 TRISB1_bit = 0;
 TRISB.f2 = 0;

 while(1){
 PORTB.RB0 = 1;
 RB1_bit = 1;
 PORTB.f2 = 1;

 delay_ms(500);

 PORTB.RB0 = 0;
 RB1_bit = 0;
 PORTB.f2 = 0;

 delay_ms(500);
 }

}
