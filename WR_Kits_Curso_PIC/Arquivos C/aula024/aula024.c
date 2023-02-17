// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            WRKITS - aula 023 - Interupções, Timer0 e Prescaler

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //
int counter = 0;

// --- programa principal --- //
void main() {

  OPTION_REG = 0b10000001;  // (81h) - RBPU' desabilita o pullup do port B e PS0 configura o prescaler 1:4
  INTCON = 0b11100000;      // GIE - habilita a interrupção global
                            // PEIE - habilita a interrupção por periféirocs
                            // T0IE - habilita a interrupção por estouro do TMR0
  TMR0 = 6;                 // inicia o Timer 0 em 6 (contará de 6 a 255 ou seja 250 vezes)

  TRISB.RB4 = 0;            // configura o RB4 como saída digital
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

// --- definição das funções auxiliares --- //
void interrupt(){
  
  // rotina de interrupção, endereço 0x04
  if(T0IF_bit){             // houve estouro?
    counter++;              // incrementa o contador de interrupções
    TMR0 = 6;               // reinicia o registrador TMR0
    
    if(counter == 500){     // 1us * 4 * 250 = 1ms -> 500ms = 500 * 1ms
      RB4_bit = ~RB4_bit;
      counter = 0;
    }
    
    T0IF_bit = 0;           // limpa o flag, preprara próxima interrupção
  }
  
}