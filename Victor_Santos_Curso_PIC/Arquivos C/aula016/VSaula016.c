// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  MCU: PIC16F877A
  Título / descrição:

  aula016 - LCD - Sinalização de Comandos
          LED L0 acende por 500ms e mosta "ON" no display
          LED L0 apaga por 500ms e mostra "OFF" no display
          Repete o ciclo
  aula017 - LCD - Sinalização usando botões
          B0 acionado acende o LED L0 e mostra "Aceso" no LCD,
          B0 acionando novamente, apaga o LED L0 e mostra "Apagado" no display
  aula018 - Matrizes, Vetores, Arrays
          os textos informados no display agora provém de vetores de textos
          char texto[tamanho+1] = "Texto"; não precisa especificar o tamanho do texto
          o compilador faz o tratamento disso. Lembrando que ao tamanho é  somado 1
          que é o caracter nulo no fim do string
          

*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

// defines
#define L0 RD0_bit
#define L1 RD1_bit
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
bit flagB0; // variáveis do tipo bit já vem inicializada em 0 sbit não!
unsigned char contB0 = 0;
// aula018, matrizes de textos
char texto1[] = "  ABMS Telecom  ";
char texto2[] = "   Led0 Aceso   ";
char texto3[] = "  Led0 Apagado  ";

// --- programa principal --- //
void main() {
  CMCON = 0x07;  // desliga os comparadores internos
  TRISD = 0x00;  // port D configurado como saída digital
  PORTD = 0x00;  // port D inicia em nível baixo
  TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1

  Lcd_Init();                 // inicializa o LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
  //Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início

  Lcd_Out(1, 1, texto1); // texto1 = "ABMS Telecom"

  while(1){
    /*
    // conteúdo da aula016
    L0 = 1;
    Lcd_Out(2, 1, "ON ");
    delay_ms(500);
    L0 = 0;
    Lcd_Out(2, 1, "OFF");
    delay_ms(500);
    */
    
    // conteúdo da aula017
    if(!B0 && flagB0 == 0){
      flagB0 = 1;
      //contB0++;
    }
    if(B0 && flagB0 == 1){
      flagB0 = 0;
      contB0++;
    }
    
    // matrizes de textos acrescentados aula018
    switch(contB0){
      case 1: L0 = 1; Lcd_Out(2, 1, texto2); break; // texto2 = "Led0 Aceso"
      case 2: L0 = 0; Lcd_Out(2, 1, texto3); contB0 = 0; break; // texto3 = "Led0 Apagado"
    }
    
    
  }

}

// --- definição das funções auxiliares --- //