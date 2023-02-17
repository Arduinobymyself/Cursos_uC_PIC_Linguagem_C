// SISTEMA PARADOXUS COM PIC 16F84A
// Crystal XT 4MHz
// Dois LEDs e dois Botões embarcados
// Barramento PORT B disponível como I/O, assim como também o RA4

// --- inclusão de bibliotecas --- //

// --- definições do sistema --- //
#define S1 Button(&PORTA, 0, 50, 0)
#define S2 Button(&PORTA, 1, 50, 0)
#define L1 RA2_bit
#define L2 RA3_bit
#define DISP1 RA4_bit
#define DISP2 RB7_bit

// --- protótipos de funções --- //
void display(int num);
void changeCount();

// --- variáveis globais --- //
unsigned char i;
int tempo = 100;
int cnt = 0, num = 0;
unsigned char digitosCC[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
unsigned char digitosCA[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x82, 0x78, 0x00, 0x90, 0x88, 0x83, 0xC6, 0xA1, 0x86, 0x8E};

// --- programa principal --- //
void main() {

  TRISA = 0b00000011;
  PORTA = 0b00000011;
  TRISB = 0b00000000;
  PORTB = 0b00000000;

  while(1){

      changeCount();
      display(cnt);

  }

}

void display(int num){

  PORTB = digitosCA[num/10];
  L1 = 0;
  delay_ms(5);
  L1 = 1;
  
  PORTB = digitosCA[num%10];
  L2 = 0;
  delay_ms(5);
  L2 = 1;

}

void changeCount()
{
  while(S1){                // botão MAIS pressionado
    cnt += 1;                // incremento
    delay_ms(200);           // debouncing
    if(cnt > 99) cnt = 99;   // chegou em 99 não incrementa mais
  }

  while(S2){                // botão MENOS pressionado
    cnt -= 1;                // decremento
    delay_ms(200);           // debouncing
    if(cnt < 1) cnt = 0;      // chegou em 1 não decrementa mais
  }
  
}