// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

            WRKITS - aula 023 - Interup��es, Timer0 e Prescaler

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //
int counter = 0;

// --- programa principal --- //
void main() {

  OPTION_REG = 0b10000001;  // (81h) - RBPU' desabilita o pullup do port B e PS0 configura o prescaler 1:4
  INTCON = 0b11100000;      // GIE - habilita a interrup��o global
                            // PEIE - habilita a interrup��o por perif�irocs
                            // T0IE - habilita a interrup��o por estouro do TMR0
  TMR0 = 6;                 // inicia o Timer 0 em 6 (contar� de 6 a 255 ou seja 250 vezes)

  TRISB.RB4 = 0;            // configura o RB4 como sa�da digital
  TRISB.RB5 = 0;
  RB4_bit = 0;              // RB4 inicia em low
  RB5_bit = 0;


  while(1)
  {
  
    // usando polling
    RB5_bit = 1;
    delay_ms(500);
    RB5_bit = 0;
    delay_ms(500);
    
  }

}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){
  
  // rotina de interrup��o, endere�o 0x04
  if(T0IF_bit){             // houve estouro?
    counter++;              // incrementa o contador de interrup��es
    TMR0 = 6;               // reinicia o registrador TMR0
    
    if(counter == 500){     // 1us * 4 * 250 = 1ms -> 500ms = 500 * 1ms
      RB4_bit = ~RB4_bit;
      counter = 0;
    }
    
    T0IF_bit = 0;           // limpa o flag, preprara pr�xima interrup��o
  }
  
}