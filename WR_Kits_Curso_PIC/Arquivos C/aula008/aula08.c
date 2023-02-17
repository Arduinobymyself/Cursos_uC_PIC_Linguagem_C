
#define S1 RA1_bit
#define S2 RA0_bit
#define L1 RA3_bit
#define L2 RA2_bit


void main() {

     CMCON = 0x07;
     TRISA = 0x03; // 0b00000011 port A pinos 0 e 1 como entrada  e pinos 2 e 3 como saída
     PORTA = 0x00; // 0b00000000 caso necessário, podemos setar os bits 0 e 1 para usar pullup interno 0b00000011
         
     while(1){
        if(S1 == 0){ // pressionando S1 os LEDs piscam alternadamente
            while(1){
                L1 = 1;
                L2 = 0;
                delay_ms(500);
                L1 = 0;
                L2 = 1;
                delay_ms(500);
            }
        }
        if(S2 == 0){ // pressionando S2 os LEDs piscam juntos
            while(1){
                L1 = 1;
                L2 = 1;
                delay_ms(500);
                L1 = 0;
                L2 = 0;
                delay_ms(500);
            }
        }
     }
         
         
}