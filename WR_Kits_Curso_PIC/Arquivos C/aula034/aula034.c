// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

            aula034 - INTERRUP��O EXTERNA (RBO/INT)
            PIC 16F648A
            Fosc = 16MHz
            CM = 0,25us
            PS = 1:256
            TMR0 = 0
            TE = CM*PS*(256-TMR0) = 16,384ms
            
            LED2(verde) -> RA1, deve piscar a cada 3s
            LED1(vermelho) -> RA0, deve inverter seu estado a 
                              cada pressionamento do bot�o B0
            B0 -> RB0/INT
            

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define LED1 RA0_bit
#define LED2 RA1_bit
#define B0 RB0_bit


// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0X07;  // desabilita os comparadores internos
  
  TRISA = 0x00;  // port A como sa�da digital
  PORTA = 0x00;  // port A inicia em n�vel baixo
  TRISB = 0x01;  // RB0 como entrada digital
  PORTB = 0x01;  // RB0 com pullup
  
  GIE_bit = 1;   // habilita chave geral de interrup��es
  PEIE_bit = 0;  // desabilita interrup��o por perif�ricos
  INTE_bit = 1;  // habilita interrup��o externa RB0/INT
  INTEDG_bit = 0;// interrup��o por borda de descida
  
  INTF_bit = 0;      // inicializa o flag de interrup��o

  while(1){
    LED2 = ~LED2;
    delay_ms(3000);
  }

}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){
  if(INTF_bit){
    INTF_bit = 0;
    LED1 = ~LED1;
  }

}