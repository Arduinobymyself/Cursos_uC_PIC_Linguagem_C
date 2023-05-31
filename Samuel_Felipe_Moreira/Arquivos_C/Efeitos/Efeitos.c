// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Abr 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:



*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//



// --- protótipo das funçãoes --- //
void bip();
void erro();

// --- variáveis globais --- //
int efeito = 0;

// --- programa principal --- //
void main() {

  int i = 0;
  int control = 255;
  
  CMCON = 0x07;  // desabilita os comparadores internos
  ADCON0 = 0x00; // conversor AD desabilitado
  ADCON1 = 0x07; // todos os canais como digital
  TRISC = 0x00;  // configura todo o PORT C  como saída
  PORTC = 0X00;  // inicializa o PORT C
  TRISD = 0x00;  // configura todo o PORT D como saída
  PORTD = 0x00;  // inicializa o PORT D
  TRISB = 0x07;  // configura RB0 a RB2 como entrada digital
  PORTB = 0X00;  // Iinicializa o PORT B


  while(1)
  {
    if(PORTB.RB0 == 0){
      efeito = 1;
      bip();
    }
    
    if(PORTB.RB1 == 0){
      efeito = 2;
      bip();
      delay_ms(500);
      bip();
    }
    
    if(PORTB.RB2 == 0){
      switch(efeito){
        case 1:
          PORTD = control;
          delay_ms(250);
          for(i = 0; i < 8; i++){
            control = control << 1;
            PORTD = control;
            delay_ms(250);
          }
          control = 255;
          efeito = 0;
          break;
        case 2:
          PORTD = control;
          delay_ms(250);
          for(i = 0; i < 8; i++){
            control = control >> 1;
            PORTD = control;
            delay_ms(250);
          }
          control = 255;
          efeito = 0;
          break;
        case 0:
          efeito = 0;
          erro();
          break;
      }
    }
    


  }

}


// --- definição das funções auxiliares --- //     
void bip(){
  PORTC.RC1 = 1;
  delay_ms(500);
  PORTC.RC1 = 0;
}
void erro(){
  int i;
  for(i = 0; i < 5; i++){
    PORTC.RC1 = 1;
    delay_ms(500);
    PORTC.RC1 =0;
    delay_ms(500);
  }
}