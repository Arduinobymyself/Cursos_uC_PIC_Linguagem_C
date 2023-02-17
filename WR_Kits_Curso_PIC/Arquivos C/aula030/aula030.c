// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            aula030 - PWM Configurado a partir do Timer 2

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 7; // desabilita os comparadores

  OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128

  INTCON.GIE = 1;  // habilita a interrupção global
  INTCON.PEIE = 1; // habilita a interrupção por periféricos
  INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0

  TMR0 = 0x6C;
  
  // Timer 2
  T2CON = 0b00000110;    // 0, postscaler 1:1, timer 2 on, prescaler 1:16
  PR2 =  255;            // inicializa o registrador de controle do Timer 2
  CCPR1L = 0X00;         // LED inici[ara apagado
  CCP1CON = 0b00001100;  // modo PWM habilitado (LSB 11xx)

  // periodo PWM = (PR2+1)*CM*PS = 256*1us*16 = 4,096ms
  // frequência PWM = 244,14Hz
  // Duty Cycle = PR2+1 = estouro do TMR2 -> low para high / CCPR1L:CCP1CON<5:4>

  TRISA = 0X03; // RA0 e RA1 são entradas digitais
  TRISB = 0x00; // todo o port B será saída
  PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
  PORTB = 0X00; // port B inicia em LOW



  while(1)
  {

    // implementações futuras

  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
    INTCON.T0IF = 0; // limpa a flag de estouro do Timer 0
    TMR0 = 0x6C; // reinicia o registrador TMR0

    // tarefa 2 - testar botões
    if(!S1){
      CCPR1L++; // incrementa PWM
    }
    else if(!S2){
      CCPR1L--; // decrementa PWM
    }

  }
}