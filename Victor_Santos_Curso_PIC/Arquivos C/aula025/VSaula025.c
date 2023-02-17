// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: jan 2023
  MCU: PIC16F877A
  Título / descrição:

  Canal Vitor Santos
  
  Configuração e Leitura do ADC
  aula025 até aula031



*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// Lcd pinout settings
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

// defines
#define L0 RD0_bit
#define L1 RD1_bit
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

// --- protótipo das funçãoes --- //
void converte(unsigned int valor);

// --- variáveis globais --- //
char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
unsigned int valor = 0;
unsigned char texto[6];
unsigned int valorAD0 = 0;
unsigned int valorAD1 = 0;



// --- programa principal --- //
void main() {

  ADCON0 = 0b00000000; // Fosc/4
  ADCON1 = 0b11000100; // justificado a direita, canais RA0/AN0, RA1/AN1 e RA3/AN3 configurados como analógico
  TRISA = 0b00000011;  // cnais AN0 e AN1 como entrada
  
  TRISC = 0x00;  // port C como saída
  PORTC = 0x00;  // port C inicia em nível baixo
  TRISB = 0x03;  // RB0 e RB1 como entrada
  PORTB = 0x03;  // resistores de pull-up
  TRISD = 0x00;  // port D configurado como saída digital
  PORTD = 0x00;  // port D inicia em nível baixo
  
  Lcd_Init();                 // inicializa o LCD
  Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
  Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início

  Lcd_Out(1, 1, texto1);
  Lcd_Out(2, 1, texto2);
  delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "AN0 = ");
  Lcd_Out(2, 1, "AN1 = ");
  
  while(1){
    // lendo canal 0
    ADCON0.CHS2 = 0;       // selecionam o canal AN0
    ADCON0.CHS1 = 0;
    ADCON0.CHS0 = 0;
    ADCON0.ADON = 1;       // ativa conversor A/D, liga o módulo
    delay_us(20);          // tempo de espera da ativação e carga do capacitor de conversão
    ADCON0.GO_DONE = 1;    // inicia o processo de conversão
    while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado

    valorAD0 = (ADRESH << 8) + ADRESL; // pega o valor da conversão  
                                       // o mesmo que ADRESH*256 + ADRESL
    
    valorAD0 = valorAD0*4.88758;  // valorAD0*5000/1023 = valorAD0*4.88758
    
    ADCON0.ADON = 0;
    delay_us(20);

    converte(valorAd0);
    Lcd_Out(1, 7, texto);
    Lcd_Out(1, 12, "V");
    
    // lendo canal 1
    ADCON0.CHS2 = 0;       // selecionam o canal AN1
    ADCON0.CHS1 = 0;
    ADCON0.CHS0 = 1;
    ADCON0.ADON = 1;       // ativa conversor A/D
    delay_us(20);          // tempo de espera da ativação
    ADCON0.GO_DONE = 1;    // inicia o processo de conversão
    while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado

    valorAD1 = (ADRESH << 8) + ADRESL; // pega o valor da conversão
                                       // o mesmo que ADRESH*256 + ADRESL
    valorAD1 = valorAD1*4.88758;   // valorAD1*5000/1023 = valorAD1*4.88758

    ADCON0.ADON = 0;
    delay_us(20);

    converte(valorAD1);
    Lcd_Out(2, 7, texto);
    Lcd_Out(2, 12, "V");
    

  }

}

// --- definição das funções auxiliares --- //

void converte(unsigned int valor){
  // "0" na tabela ASCII = 48 em decimal, somando qualquer número com 48 ele será respresentado em ASCII
  texto[0] = valor/1000+48;      // 1234/1000 = 1.234 pega o 1, o resto 234(é desconsiderado, devido a variável ser char)
  texto[1] = '.';                // caracter ponto
  texto[2] = (valor/100)%10+48;  // 1234/100 = 12.34 ... 12/10 = 1.2 pega o resto 2
  texto[3] = (valor/10)%10+48;   // 1234/10 = 123.4 ... 123/10 = 12.3 pega o resto 3
  texto[4] = (valor/1)%10+48;    // 1234/1 = 1234 ... 1234/10 = 123.4 pega o resto 4
  
}