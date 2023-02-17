

unsigned char texto[7] = "!led0#";
unsigned char c_texto = 0;

void interrupt();

void main() {
   
   UART1_Init(9600);
   
   UART1_Write_Text("PIC");
   while(!UART1_Tx_Idle());
   UART1_Write(13);
   while(!UART1_Tx_Idle());
   
   // interrupção
   GIE_bit = 1;
   PEIE_bit = 1;
   RCIE_bit = 1;
   
   TRISC6_bit = 0;
   TRISC7_bit = 1;
   
   TRISD = 0;
   PORTD = 0;
   
   while(1){
     // seu código aqui
   }
   
   
}


void interrupt(){

  if(RCIF_bit){
    
    texto[c_texto] = UART1_Read();
    
    if(texto[0] != '!'){
      c_texto = 0;
    } else {
      if(texto[c_texto] == '#'){
      
        c_texto = 0;
        if(texto[0] == '!'){
          if(texto[1] == 'l'){
            if(texto[2] == 'e'){
              if(texto[3] == 'd'){
                switch(texto[4]){
                  case '0': PORTD &= 0b00000000; break; // apaga tudo!
                  case '1': PORTD |= 0b00000001; break; // acende LED 1 mantendo a condição dos anteriores
                  case '2': PORTD |= 0b00000010; break;
                  case '3': PORTD |= 0b00000100; break;
                  case '4': PORTD |= 0b00001000; break;
                  case '5': PORTD |= 0b00010000; break;
                  case '6': PORTD |= 0b00100000; break;
                  case '7': PORTD |= 0b01000000; break;
                  case '8': PORTD |= 0b10000000; break;
                }
              }
            }
          }
        }
        
      } else {
        c_texto++;
        if(c_texto > 5) c_texto = 0;
      }
    }
    
    RCIF_bit = 0;
    
  }
  
}