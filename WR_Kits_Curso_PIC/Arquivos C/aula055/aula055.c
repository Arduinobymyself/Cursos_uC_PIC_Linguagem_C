// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

  Aula055: Sensor Modulado de Passagem
  Filtragem digital de sinal

  Clock: 4MHz
  Ciclo de Máquina: 1us
  Sistema Embarcado PARADOXUS 9

  RB1 -> LED_IR (TX - modulador - emissor IR - TIL32)
  RB2 -> LED Indicador
  RB3/CCP1 - > Foto-Transistor (Rx - demodulador - receptor IR - TIL78)
  
  Através do módulo de captura (RB3/CCP1) é implementado um frequencímetro.
  Via TIMER 0 geramos uma frequência para o modulador IR conectado em RB1.
  A frequência medida em RB3/CCP1 pelo demodulador IR 
  deve dar match com a frequência gerada pelo TIMER 0; ligando 
  o LED Indicador conectado em RB2 (sinalizando passagem livre entre TX e RX),
  caso contrário o LED Indicador será desligado (sinalizando passagem obstruída
  entre TX e RX).
  
  
  Sinal gerado pelo TIMER 0:
  S = CM * TMR0 * PS = 1us * 250 * 2 = 500us => F = 1/(2*S) = 1KHz


*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1            RA3_bit
#define L2            RA2_bit
#define S1            RA1_bit
#define S2            RA0_bit
#define LED_IR        RB1_bit       // saída para o LED infravermelho
#define s_out         RB2_bit       // saída do sensor em RB2


// --- protótipo das funçãoes --- //


// --- variáveis globais --- //

char flag0 = 0x00;
unsigned int time1, time2;
unsigned long freq;



// --- programa principal --- //
void main() {
  CMCON = 0X07;                // desabilita compardores internos
  OPTION_REG = 0x80;           // pull-up desabilitados, TIMER 0 incrementa com ciclo de máquina, pre-escaler 1:2
  T1CON = 0X01;                // habilita contagem do Timer 1, com prescaler
  CCP1CON = 0X07;              // configura captura a cada 16 bordas de subida
  CCP1IE_bit = 0X01;           // habilita interrupções no módulo CCP
  GIE_bit = 0x01;              // habilita interrupção global
  PEIE_bit = 0x01;             // habilita interrupção por periféricos
  T0IE_bit = 0x01;             // habilita interrupção por TIMER 0
  TMR0 = 0x06;                 // incicializa o registrador TMR0 em 6 (conta até 250)
  TRISA = 0XFF;                // configura o PORT A como entrada
  TRISB = 0XF9;                // configura RB1 e RB2 como entrada 0b11111001
  PORTA = 0XFF;                // inicializa o PORT A
  PORTB = 0X00;                // inicializa o PORT B


  while(1)
  {
    time2 = abs(time2 - time1);              // calcula o tempo de 16 períodos
    time2 = (time2) >> 4;                    // divide o valor por 16 (2^4) para obter o tempo de um período
    freq = 1/ (time2 * 1E-6);                // converte período para frequência em Hz
    
    if(freq > 950 && freq < 1050){           // frequencia entre 950 e 1050Hz ?
      // sim...
      s_out = 0x01;                          // liga LED indicador, passagem liberada entre TX e RX
    } else{
      // não...
      s_out = 0x00;                          // desliga LED indicador, passagem obstruída entre TX e RX
    }
    
    flag0.B1 - 0x00;                         // limpa flag
    delay_ms(100);
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(T0IF_bit){                             // houve estouro do TIMER 0?
    // sim...
    T0IF_bit = 0x00;                        // limpa flag
    TMR0 = 0x06;                            // reinicia o conteudo do TMR0
    LED_IR = ~LED_IR;                       // inverte estado do LED_IR (gerando pulsos quadrados na saída)
  }
  
  if(CCP1IF_bit){                           // houve interupção no módulo de captura?
    // sim...
    CCP1IF_bit = 0x00;                      // limpa flag para nova captura
    if(!flag0.B0){                          // flag B0 limpa?
      // sim...
      time1 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 1
      flag0.B0 = 0x01;
    } else {
      // não
      time2 = (CCPR1H << 8) + CCPR1L;       // captura o tempo 2
      flag0.B0 = 0x00;
      flag0.B1 = 0x01;
    }
  }
}