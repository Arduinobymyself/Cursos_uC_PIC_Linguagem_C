
int numero[16] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113};
// {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, b, C, d, E, F}
int erro[3] = {121, 80, 92};  // { E, r, o}

int tempo = 1;


void main() {

  CMCON = 7;
  
  ADCON0 = 0;
  ADCON1 = 7;
  
  TRISD = 0;
  PORTD = 0;
  TRISA = 0;
  PORTA = 0;


  while(1){
  
    // Display 1
    PORTD = erro[0];   // E
    PORTA.RA2 = 1;
    Vdelay_ms(tempo);
    PORTA.RA2 = 0;
    Vdelay_ms(tempo);

    // Display 2
    PORTD = erro[1];   // r
    PORTA.RA3 = 1;
    Vdelay_ms(tempo);
    PORTA.RA3 = 0;
    Vdelay_ms(tempo);
    
    // Display 3
    PORTD = erro[1];   // r
    PORTA.RA4 = 1;
    Vdelay_ms(tempo);
    PORTA.RA4 = 0;
    Vdelay_ms(tempo);
    
    // Display 4
    PORTD = erro[2];   // o
    PORTA.RA5 = 1;
    Vdelay_ms(tempo);
    PORTA.RA5 = 0;
    Vdelay_ms(tempo);

  }

}