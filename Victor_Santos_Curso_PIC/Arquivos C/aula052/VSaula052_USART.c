/*
  USART (Universal Sysnchronous Asynchronous Receiver Transmitter)
  
  Registradores:
  
  TXSTA: Transmit Status and Control Register (98h)
  [CSRC TX9 TXEN SYNC ---- BRGH TRMT TX9D]
    CSRC: Clock Source Select bit
      assíncrono = 0;
      síncrono:
        1 = modo master(gera clock internamente)
        0 = modo slave (clock fonte externa)
    TX9: 9-bit Transmit Enable bit
      1 = 9-bits
      0 = 8-bits
    TXEN: Transmit Enable bit
      1 = enabled
      0 = disabeld
    SYNC: USART Mode select bit
      1 = synchronous
      0 = asynchronous
    BRGH: High Baudrate Select bit
      assíncrono:
        1 = alta velocidade
        0 = baixa velocidade
      síncrono: não usado = 0
    TRMT: Transmit Shift Register Status bit
      1 = TSR empty
      0 = TSR full
    TX9D: 9th bit of Transmit Data, can be parity bit
    
  RCSTA: REceive Status and Contorl Register (18h)
  [SPEN RX9 SREN CREN ADDEN FERR OERR RXD9]
    SPEN: Serial Port Enable bit
      1 = serial port enabled(RC7/RX e RC6/TX pins)
      0 = Serial port disabled
    RX9: 9-bit Receive Enable bit
      1 = 9-bits
      0 = 8-bits
    SREN: Single Receive Enable bit
      asynchronous: don't care
      synchronous:
        1 = enable single receive
        0 = disables single receive
      cleared after reception is complete
    CREN: Continous Receive Enable bit
      asynchronous mode:
        1 = enables continous receive
        0 = disables continuous receive
      synchronous mode:
        1 = enables continuous receive until enable bit CREN is cleared (CREN overrides SREN)
        0 - disables continuous receive
    ADDEN: Address Detect Enable bit
      asynchronous mode 9-bit
        1 = enables address detection, enables interrupt and load of the receive buffer when RSR<8> is set
        0 = Disables address detection, all bytes are received and nith bit can be used as parity bit
    FERR: Framing Error bit
      1 = framing error (can be updated by reading RCREG register and receive next valid byte)
      0 = no Framing error
    OERR: Overrun error bit
      1 = Overrun error (can be cleares by clearing bit CREN)
      0 = no overrun error
    RXD9:  9th bit of received data (can be parity bit must be calculates by user firmware)
  
  SPBRG: Baud Rate Generator REgister (99h)

*/



short cont = 0;
unsigned char nome[] = "Marcelo Moraes";
unsigned char texto;

void main() {
  
  TXSTA = 0b00100000; // configura registrador
                      // [CSRC TX9 TXEN SYNC ---- BRGH TRMT TX9D]
  
  RCSTA = 0b10010000; // configura registrador
                      // [SPEN RX9 SREN CREN ADDEN FERR OERR RXD9]
  
  SPBRG = 12;
  
  /*
    BRGH = 0 (low speed)
    asynchronous; Baud Rate = Fosc/(64*(X+1))
    synchronous: Baud Rate = Fosc/(4*(X+1))
    
    BRGH = 1 (high speed)
    asynchronous: Baud Rate =  Fosc/(16*(X+1))
    synchronous: don't care
    
    X = value in SPBRG (0 to 255)
    
    Para nosso caso 8MHz, asynchronous e Baud Rate = 9600:
    Baud Rate = Fosc/64*(X+1))
    9600 = 8M/64*(X+1))
    X = ((8M/9600)*64)-1 => X = 12,02
    
    Cálculo do erro:
    Baud Rate = 8M/(64*(12,02+1) = 9615,38
    
    erro = ((9600 -9615,38)/9600)*100% = 0,16%
    
  */
  
  TRISC6_bit = 0; // RC6/TX como saída
  TRISC7_bit = 1; // RC7/RX como entrada
  
  // envia informação de um caractere ASCII
  TXREG = 'P';        // transmite informação
  while(!PIR1.TXIF);  // espera completar
  PIR1.TXIF = 0;      // limpa flag de tx
  
  TXREG = 'I';
  while(!PIR1.TXIF);
  PIR1.TXIF = 0;
  
  TXREG = 'C';
  while(!PIR1.TXIF);
  PIR1.TXIF = 0;
  
  TXREG = '\r';
  while(!PIR1.TXIF);
  PIR1.TXIF = 0;
  
  
  // envia um texto completo
  while(nome[cont] != '\0'){ // enquanto não chegar ao fim do texto
    TXREG = nome[cont]; // transmite informação
    while(!PIR1.TXIF);  // aguarda completar
    PIR1.TXIF = 0;      // reset flag de tx
    cont++;             // próximo caracter
  }
  

  while(1){
    if(PIR1.RCIF){
      texto = RCREG;     // recepção serial
      TXREG = texto;     // transmissão serial
      while(!PIR1.TXIF); // aguarda compeltar
      PIR1.TXIF = 0;     // reseta o flag de tx
      PIR1.RCIF = 0;     // reseta o flag de rx
    }
  }
  
}