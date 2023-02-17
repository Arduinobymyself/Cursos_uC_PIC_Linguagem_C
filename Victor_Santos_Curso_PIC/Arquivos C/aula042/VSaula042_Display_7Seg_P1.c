
// Canal Vitor Santos
// aula041 - Display 7 Segmentos Parte 1
// princ�pios b�sicos
/*

*/



unsigned char display(unsigned char num); // solu��o n�o muito elegante!!
unsigned char i;
unsigned char pattern[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111}; // solu��o mais elgante!!



void main() {

  TRISD = 0;
  PORTD = 0;
  
  
  while(1){
    for(i=0; i < 9; i++){
      // PORTD = display(i); // solu��o n�o muito elegante!!
      PORTD = pattern[i]; // solu��o mais elegante!!
      delay_ms(200);
    }
  }


}

// solu��o n�o muito elegante!!!
unsigned char display(char num){
   switch(num){
     case 1: return 0x06;
     case 2: return 0x5B;
     case 3: return 0x4F;
     case 4: return 0x66;
     case 5: return 0x6D;
     case 6: return 0x7D;
     case 7: return 0x07;
     case 8: return 0x7F;
     case 9: return 0x6F;
     case 0: return 0x3F;
   }
}