// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:          Saídas Analógicas
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
      Configurando a saída anaógica Vref (Registrador VRCON)


   VRCON => [VREN VROE VRR --- VR3 VR2 VR1 VR0]
   VREN = Vref Enable bit
        1 = prowered on
        0 = powered down
   VROE = Vref output Enable bit
        1 = Vref output on RA2
        0 = vref disconnected
   VRR = Vref Range Selection
        1 = low range
        0 = high range
   VR<3:0> = Vref Value Selection bits
    Se VRR = 1 => Vref = VR<3:0> * VDD / 24
    Se VRR = 0 => Vref = VDD / 4 + VR<3:0> * VDD / 32
*/




// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  int tempo = 100;
  
  CMCON = 0X07; // desabilita os compareadores internos
  TRISA = 0X03; // 0b00000011 // RA0 e RA1 são entradas digitais
  PORTA = 0X03; // 0b00000011 // RA0 e RA1 iniciam em HIGH
  VRCON = 0xE7; // 0b11100111
  // VREM = 1, VROE = 1, VRR = 1, 0
  // VR<0111> => Vref = 7 / 24 * 5 = 1,25V



  while(1)
  {
      VRCON = 0xE7;
      Vdelay_ms(tempo);
      VRCON = 0xE6;
      Vdelay_ms(tempo);
      VRCON = 0xE5;
      Vdelay_ms(tempo);
      VRCON = 0xE4;
      Vdelay_ms(tempo);
      VRCON = 0xE3;
      Vdelay_ms(tempo);
      VRCON = 0xE2;
      Vdelay_ms(tempo);
      VRCON = 0xE1;
      Vdelay_ms(tempo);
      VRCON = 0xE0;
      Vdelay_ms(tempo);
  }

}

// --- definição das funções auxiliares --- //