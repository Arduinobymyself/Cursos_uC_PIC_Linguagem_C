



unsigned char texto;

void main() {
  
  UART1_Init(9600);
  UART1_Write_Text("Marcelo Moraes");
  
  while(1){
    if(UART1_Data_Ready()){ // se tem algo no buffer
      texto = UART1_read(); // pega informação
      UART1_Write(13);      // próxima linha
      UART1_Write(texto);   // faz o echo
      UART1_Write(13);
      while(!UART1_Tx_Idle()); // espera terminar de transmitir
    }

  }

  
  
  


}