// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            aula035 - CONTADOR DE PASSAGEM(RBO/INT)
            PIC 16F628A
            Fosc = 16MHz
            CM = 0,25us
            PS = 1:256
            TMR0 = 0
            TE = CM*PS*(256-TMR0) = 16,384ms

            DISP1 -> RB1 - RB7
            B0 -> RB0/INT
            
            O display mostrará o número de passagens pelo sensor
            simulado por um botão


*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define B0 RB0_bit


// --- protótipo das funçãoes --- //
void interrupt();
int display(int num);

// --- variáveis globais --- //
int contador = 0;
int num;

// --- programa principal --- //
void main() {
  CMCON = 0X07;  // desabilita os comparadores internos

  TRISB = 0x01;  // RB0 como entrada digital
  PORTB = 0x7E;  // inicia  o porte B com o equivalente a "0" no display

  GIE_bit = 1;   // habilita chave geral de interrupções
  PEIE_bit = 0;  // desabilita interrupção por periféricos
  INTE_bit = 1;  // habilita interrupção externa RB0/INT
  INTEDG_bit = 1;// interrupção por borda de SUBIDA

  INTF_bit = 0;      // inicializa o flag de interrupção

  while(1){

  }

}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(INTF_bit){
    INTF_bit = 0;
    contador++;
    PORTB = display(contador);
    if(contador > 9){
      contador = 0;
      PORTB = display(contador);
    }
    
  }

}

int display(int num){
  int aux;
  
  // vetor para o barramento de dados do display 7 seg catodo comum PORTB<RB7:RB1>
  int catodo[] = {0x7E, 0x0C, 0xB6, 0x9E, 0xCC, 0xDA, 0xFA, 0x0E, 0xFE, 0xDE};
  aux = catodo[num];
  return aux;
  
}