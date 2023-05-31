#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/Curso-PIC-MikroC_Pro_aula_35_Entrada_Digital_5.c"






bit estado;


void main() {
 TRISA = 0b00011111;
 TRISB = 0b00000000;
 PORTA = 0b00000000;
 PORTB = 0b00000000;



 while(1){



 if(Button(&PORTA, 0, 50, 0) && (estado == 0)){
 PORTB.RB7 = ~PORTB.RB7;
 estado = 1;
 }
 if(!Button(&PORTA, 0, 50, 0) && (estado == 1)){
 estado = 0;
 }
 }
}
