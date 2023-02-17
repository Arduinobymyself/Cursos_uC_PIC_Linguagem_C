// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            aula034 - INTERRUPÇÃO EXTERNA (RBO/INT)
            PIC 16F648A
            Fosc = 16MHz
            CM = 0,25us
            PS = 1:256
            TMR0 = 0
            TE = CM*PS*(256-TMR0) = 16,384ms
            
            LED2(verde) -> RA1, deve piscar a cada 3s
            LED1(vermelho) -> RA0, deve inverter seu estado a 
                              cada pressionamento do botão B0
            B0 -> RB0/INT
            

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define LED1 RA0_bit
#define LED2 RA1_bit
#define B0 RB0_bit


// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0X07;  // desabilita os comparadores internos
  
  TRISA = 0x00;  // port A como saída digital
  PORTA = 0x00;  // port A inicia em nível baixo
  TRISB = 0x01;  // RB0 como entrada digital
  PORTB = 0x01;  // RB0 com pullup
  
  GIE_bit = 1;   // habilita chave geral de interrupções
  PEIE_bit = 0;  // desabilita interrupção por periféricos
  INTE_bit = 1;  // habilita interrupção externa RB0/INT
  INTEDG_bit = 0;// interrupção por borda de descida
  
  INTF_bit = 0;      // inicializa o flag de interrupção

  while(1){
    LED2 = ~LED2;
    delay_ms(3000);
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(INTF_bit){
    INTF_bit = 0;
    LED1 = ~LED1;
  }

}