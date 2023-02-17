


void main() {
   ANSEL =0;    // desliga as entradas AD
   CMCON = 7;   // desliga os comparadores internos
   //TRISIO0_bit = 1;
   //TRISIO1_bit = 0;
   TRISIO = 0b00010000;
   GPIO = 0;
   while(1){
       if(GPIO.F5 == 1){    // se botão pressionado
           GPIO.F0 = 1;     // liga o led
           delay_ms(2000);  // por 2 segundos
       } else {
           GPIO.F0 = 0;     // desliga o led
       }
   }
   
}