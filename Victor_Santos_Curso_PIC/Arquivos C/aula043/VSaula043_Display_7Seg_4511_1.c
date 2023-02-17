
// Canal Vitor Santos
// aula043 - Display 7 Segmentos Parte 2
// usando CD4511 para economizar pinos
/*

*/



unsigned char display(unsigned char num); // solução não muito elegante!!
unsigned char i;
unsigned char pattern[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111}; // solução mais elgante!!



void main() {

  TRISD = 0;
  PORTD = 0;


  while(1){
    for(i=0; i < 9; i++){
      // PORTD = display(i); // solução não muito elegante!!
      PORTD = Dec2Bcd(i); // solução mais elegante!!
      delay_ms(300);
    }
  }


}

// solução não muito elegante!!!
unsigned char display(char num){
   switch(num){
     case 0: return Dec2Bcd(0);
     case 1: return Dec2Bcd(1);
     case 2: return Dec2Bcd(2);
     case 3: return Dec2Bcd(3);
     case 4: return Dec2Bcd(4);
     case 5: return Dec2Bcd(5);
     case 6: return Dec2Bcd(6);
     case 7: return Dec2Bcd(7);
     case 8: return Dec2Bcd(8);
     case 9: return Dec2Bcd(9);
   }
}