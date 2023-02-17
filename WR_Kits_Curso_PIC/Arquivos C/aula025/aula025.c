// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
  
            WRKITS - aula025 - EEPROM Leitura e Escrita

*/

// --- observações e comentários gerais --- //
/*
  aula 026 melhora do código
*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- protótipo das funçãoes --- //
void changeCont();
void writeEEPROM();
void readEEPROM();

// --- variáveis globais --- //
int cont = 0;
unsigned char catodo;
unsigned char segmento[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
unsigned char address = 0x01; // variável conterá o valor inicial do endereço de gravação
unsigned int store;

// --- programa principal --- //
void main() {
  CMCON = 0x07; // desabilita os comparadores internos
  TRISA = 0x03; // RA0 e RA1 são entradas digitais
  TRISB = 0x00; // todo o port B como saída
  PORTA = 0x03; // RA0 e RA1 iniciam em nível alto (HIGH)
  PORTB = 0x00; // port B inicia em nível baixo (LOW)
  
  readEEPROM();

  while(1)
  {
    // contador básico de 0 a 9 no display
    changeCont();
    if(!S2) writeEEPROM();
    delay_ms(100);
    catodo = segmento[cont]; // valor a ser enviado ao port B
    PORTB = catodo; // envia o pattern ao port B
  }
}
// --- definição das funções auxiliares --- //    void changeCont();
void changeCont(){
  if(!S1){
    delay_ms(100);
    cont++;
    if(cont > 9) cont = 0;
  }
}
void writeEEPROM(){
  unsigned char aux1, aux2;
  
  aux1 = EEPROM_Read(0x00);
  if(aux1 == 0xff){
    EEPROM_Write(0x00, address);
    delay_ms(10);
  }
  
  store = EEPROM_Read(0x00);
  delay_ms(10);
  aux2 = store;
  EEPROM_Write(store, cont);
  delay_ms(10);
  aux2++;
  if(aux2 > 128) aux2 = 0x00;
  
  EEPROM_Write(0x00, aux2);
  
  delay_ms(10);
  L1 = 1;
  delay_ms(300);
  L1 = 0;
}

void readEEPROM(){
  unsigned char anchor;
  anchor = EEPROM_Read(0x00);
  cont = EEPROM_Read(0x00+(anchor-1));
}