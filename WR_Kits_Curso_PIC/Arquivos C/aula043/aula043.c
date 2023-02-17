// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descri��o do Projeto:
  
            aula043 - Modo de Compara��o CCP
            Fosc = 16MHz
            CM = 250nS
            PS = 1:8
            
            TE = CM*PS*CCPR1 = 250nS*8*65536 =  131,07mS

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0X07; // desabilita os comparadores
  
  T1CON = 0B00110001; // [--- --- TICKPS1 T1CKPS0 T1OSCEN T1SYNC' TMR1CS TMR1ON]
  TMR1L = 0;
  TMR1H = 0;
  
  CCP1CON = 0b00001011; // [--- --- CCPxX CCPxY CCPxM3 CCPxM2 CCPxM1 CCPxM0]
                        // CCPxM3:CCPxM0 = 1000
                        // --> modo comparador, seta sa�da quando der match (CCPxIF = 1)
                        //     congela o TMR1
                        // CCPxM3:CCPxM0 = 1011
                        // --> modo comparador, evento especial, CCPx pin n�o afetado
                        //     TMR1 � resertado (n�o congela)
                        //     seta sa�da quando der match (CCPxIF = 1)
                        //     inicia convers�o AD se habilitado
  CCPR1L = 255;         // inicializa o registrador CCPR
  CCPR1H = 255;
  
                        
  TRISC = 0;
  PORTC = 0;

  while(1)
  {
    if(CCP1IF_bit){
      CCP1IF_bit =0;
      RC0_bit = ~RC0_bit;
    }

  }

}

// --- defini��o das fun��es auxiliares --- //