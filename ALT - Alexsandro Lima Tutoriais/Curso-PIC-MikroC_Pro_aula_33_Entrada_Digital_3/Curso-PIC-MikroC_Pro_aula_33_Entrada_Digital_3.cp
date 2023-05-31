#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_33_Entrada_Digital_3.c"






void main() {
 TRISB = 0b11110000;
 PORTB = 0b00000000;
 OPTION_REG.f7 = 0;

 while(1){



 if(!PORTA.RB0 && PORTA.RB1){
 delay_ms(50);
 PORTB.RB7 = 1;
 }
 if(PORTA.RB0 && !PORTA.RB1){
 delay_ms(50);
 PORTB.RB7 = 0;
 }
 }
}
