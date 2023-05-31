#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_34_Entrada_Digital_4.c"






bit estado;


void main() {
 TRISA = 0b00011111;
 TRISB = 0b00000000;
 PORTA = 0b00000000;
 PORTB = 0b00000000;



 while(1){



 if(!PORTA.RA0 && estado==0){
 delay_ms(50);
 PORTB.RB7 = ~PORTB.RB7;
 estado = 1;
 }
 if(PORTA.RA0 && estado==1){
 delay_ms(50);
 estado = 0;
 }
 }
}
