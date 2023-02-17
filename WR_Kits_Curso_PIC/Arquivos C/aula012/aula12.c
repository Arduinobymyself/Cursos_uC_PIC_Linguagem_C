// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data:
  MCU: PIC16F675
  Descrição do Projeto:
            aula012 - Conversores A/D
            Parte prática.
            Leitura analógica no pino AN0
            Visualização através de LEDs nos pinos gpio f1, f2, f4 e f5
*/

// --- observações e comentários gerais --- //
/*
  PODE FUNCIONAR COMO UM INDICADOR DE BATERIA DE CELULAR
5,00V - Todos os LEDs acesos
3,75V - acende o LED 3
2,50V - acende o LED 2
1,25V - acende o LED 1
0,00V - Todos os LEDs apagados
*/

// --- bibliotecas --- //

// --- definições do sistema ---//
#define D1 gpio.f1
#define D2 gpio.f2
#define D3 gpio.f4
#define D4 gpio.f5

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
int leitura = 0;

// --- programa principal --- //
void main() {
ansel = 0x01;  // entrada analógica AN0 selecionada (0b00000001)
adcon0 = 0x01; // entrada analógica AN0 habilitada
cmcon = 0x07;  // desabilita os comparadores internos

trisio = 0x01; // gpio.f0 configurado como uma entrada (0b00000001)
gpio = 0x00;   // inicia o todo o gpio em nível baixo

  while(1){

    leitura = adc_read(0); // faz a leitura

    if(leitura > 0){
      D1 = 0;
      D2 = 0;
      D3 = 0;
      D4 = 0;
    }
    if(leitura > 256){
      D1 = 1;
      D2 = 0;
      D3 = 0;
      D4 = 0;
    }
    if(leitura > 512){
      D1 = 1;
      D2 = 1;
      D3 = 0;
      D4 = 0;
    }
    if(leitura > 768){
      D1 = 1;
      D2 = 1;
      D3 = 1;
      D4 = 0;
    }
    if(leitura > 816){
      D1 = 1;
      D2 = 1;
      D3 = 1;
      D4 = 1;
    }
    delay_ms(100); // taxa de atualização
  }
}

// --- definição das funções --- //
