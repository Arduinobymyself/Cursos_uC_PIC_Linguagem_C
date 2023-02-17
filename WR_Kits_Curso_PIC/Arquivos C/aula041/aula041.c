/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descrição do Projeto:

            aula041 - PIC16F876A, TEMPORIZAÇÃO - TIMER1 - INTERRUPÇÃO
            Fosc = 16MHz
            
            1 - gerar um oscilador de onda quadrada de 5 Hz no pino RC5
            2 - gerar um pulso de 2ms em um péríodo de 100ms no pino RC4
            
            CM = Fosc/4 = 250ns
            TE = CM*PS*(65536 - TRM1)
            
            para 100ms = 250ns*8*(65536 - TRM1)
            TMR1 = 15536 = 0x3C B0 ou 00111100 10110000
            para 2ms = 250ns*8*(65536 - TMR1)
            TMR1 = 64536 = 0xFC 18 ou 11111100 00011000

*/


// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //
unsigned char aux = 0;

// --- programa principal --- //
void main() {
  CMCON = 0b00000111;   // desabilita comparadores internos

  T1CON = 0b00110001;   // prescaler 1:8, Timer1 On

  TMR1H = 0xFC;         // inicializa o TMR1
  TMR1L = 0x18;
  
  GIE_bit = 1;
  PEIE_bit = 1;
  TMR1IE_bit = 1;
  TMR1IF_bit = 0;
  

  TRISC = 0;
  PORTC = 0;

  while(1){

  }




}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(TMR1IF_bit){
    TMR1IF_bit = 0;

    TMR1H = 0xFC;
    TMR1L = 0x18;
    
    RC4_bit = 0; // a cada estouro zera RC4
    
    aux++;
    
    if(aux == 50){ // 50 * 2ms = 100ms
    // a cada 100ms inverte RC5 e pulsa RC4
      aux = 0;
      RC4_bit = 1;
      RC5_bit = ~RC5_bit;
    }
    
    

    
    
  }
}
