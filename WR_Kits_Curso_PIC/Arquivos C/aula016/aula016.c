// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
			Aula016 - Displays de 7 Segmentos Multiplexados
			Contador 0 - 999
*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define MAIS PORTA.F1
#define MENOS PORTA.F0
#define DIGIT1 PORTB.F7
#define DIGIT2 PORTA.F2
#define DIGIT3 PORTA.F3

// --- protótipo das funçãoes --- //
int display(int no);
void changeCount();
// --- variáveis globais --- //
int Cen, Msd, Lsd, Cnt = 0;

// --- programa principal --- //
void main() {
  CMCON = 0X07; // desabilita comparadores
  TRISA = 0X03; // RA2 e RA3 configurados como entrada digital
  TRISB = 0X00; // PORTB configurado como saída digital
  
  DIGIT1 = 0;   // desabilita digito 1
  DIGIT2 = 0;   // desabilita digito 2
  DIGIT3 = 0;   // desabilita digito 3

  while(1)
  {
    changeCount();

    Cen = (Cnt/100)-((Cnt%100)/100); // digito das centenas

    PORTB = display(Cen);            // envia para o PORTB
    DIGIT1 = 1;                      // habilita digito 1 (centena)
    delay_ms(5);                     // aguarda 5 milisegundos
    DIGIT1 = 0;                      // desabilita digito 1 (centena)

    Msd = (Cnt%100);
    Msd = (Msd/10)-((Msd%10)/10);    // digito mais significativo (dezena)

    PORTB = display(Msd);            // envia para o PORTB
    DIGIT2 = 1;                      // habilita digito 2 (dezena)
    delay_ms(5);                     // aguarda 5 milisegundos
    DIGIT2 = 0;                      // desabilita digito 2 (dezena)

    Lsd = Cnt%10;                    // digito menos significativo (unidade)

    PORTB = display(Lsd);            // envia para o PORTB
    DIGIT3 = 1;                      // habilita digito 3 (unidade)
    delay_ms(5);                     // aguarda 5 milisegundos
    DIGIT3 = 0;                      // desabilita digito 3 (unidade)
  
  }

}

// --- definição das funções auxiliares --- //
int display(int no)
{
  int Pattern;
  int SEGMENTO[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
  Pattern = SEGMENTO[no];
  return Pattern;
}

void changeCount()
{
  while(MAIS == 1)            // botão MAIS pressionado
  {
    Cnt += 10;                // incremento em 10 unidades
    delay_ms(300);            // debouncing
    if(Cnt > 300) Cnt = 300;  // chegou em 300 não incrementa mais
  }

  while(MENOS == 1)           // botão MENOS pressionado
  {
    Cnt -= 10;                // decremento em 10 unidades
    delay_ms(300);            // debouncing
    if(Cnt < 1) Cnt = 0;      // chegou em 1 não decrementa mais
  }
}
