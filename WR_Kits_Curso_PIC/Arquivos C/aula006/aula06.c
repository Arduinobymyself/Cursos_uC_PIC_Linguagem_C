
#define S1 gpio.f0 // button 1
#define S2 gpio.f1 // button 2
#define L1 gpio.f4 // led 1
#define L2 gpio.f5 // led 2

void main() {
     cmcon = 0b00000111; // desliga os comparadores internos CMCON = 7
     ansel = 0b00000000; // desligas as entradas A/D
     
     trisio0_bit = 1;  // entradas
     trisio1_bit = 1;
     
     trisio4_bit = 0;  // saídas
     trisio5_bit = 0;
     
     S1 = 1; // chaves com pullup
     S2 = 1;
     L1 = 0; // leds apagados
     L2 = 0;
     
     while(1){
         if(!S1){       // se S1 pressionado
             L1 = ~L1;      // inverte o estado do led 1
             delay_ms(300); // deboucing
         }
         if(!S2){       // se S2 pressionado
             L2 = ~L2;      // inverte o estado do led 2
             delay_ms(300); // deboucing
         }
     }
     
     
}