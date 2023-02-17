


void main() {
   ANSEL =0;    // desliga as entradas AD
   CMCON = 7;   // desliga os comparadores internos
   //TRISIO0_bit = 1;
   //TRISIO1_bit = 0;
   TRISIO = 0b00000000;
   GPIO = 0;
   while(1){
     GPIO.F0 = 1;
     delay_ms(300);
     GPIO.F0 = 0;
     GPIO.F1 = 1;
     delay_ms(300);
     GPIO.F1 = 0;
     GPIO.F2 = 1;
     delay_ms(300);
     GPIO.F2 = 0;
     GPIO.F4 = 1;
     delay_ms(300);
     GPIO.F4 = 0;

   }

}