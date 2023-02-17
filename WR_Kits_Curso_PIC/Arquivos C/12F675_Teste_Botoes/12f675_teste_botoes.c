#define B5 Button(&GPIO, 5, 100, 0)
#define B4 Button(&GPIO, 4, 100, 0)
#define L0 GPIO.F0
#define L1 GPIO.F1

bit flagB5, flagB4;


void main() {
   ANSEL = 0;    // desliga as entradas AD
   CMCON = 7;    // desliga os comparadores internos
   //TRISIO0_bit = 0;
   //TRISIO5_bit = 1;
   TRISIO = 0b00110000;
   GPIO = 0b00110000;
   while(1){
     
     if(!B5 && flagB5 == 0){
       flagB5 = 1;
     }
     if(B5 && flagB5 == 1){
       flagB5 = 0;
       L0 = ~L0;
     }
     
     if(!B4 && flagB4 == 0){
       flagB4 = 1;
     }
     if(B4 && flagB4 == 1){
       flagB4 = 0;
       L1 = ~L1;
     }
     
   }


}