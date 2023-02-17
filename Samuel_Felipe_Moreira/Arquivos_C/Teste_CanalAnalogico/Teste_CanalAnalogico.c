/****************************************************************************
Centro de Tecnologia Microgenios
Programa: Diplay_7_seg_01
Placa: KIT PICGENIOS
Objetivo: este programa tem por função ler o canal AD0 e AD1 e escrever no lcd
o valor de conversão
Cristal = 4MHz
*******************************************************************************
*/

// Lcd pinout settings
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


char texto[16];
int temp_res1 = 0;
int temp_res2 = 0;


void main() {

  TRISB = 0;             //define portb como saida
  TRISD = 0;             //define portd como saida
  ADCON1 = 0x06;         //torna todos os pinos AD como i/o de uso geral 0b0000011x
  Lcd_Init();            //inicializa lcd
  Lcd_Cmd(_LCD_CLEAR);   //apaga lcd
  Lcd_Cmd(_LCD_CURSOR_OFF);      //desliga cursor do lcd
  Lcd_Out(1, 1, "Canal AN0: ");  //escreve mansagem na linha 1, coluna 1 do lcd
  delay_ms (10);                 //delay de 10ms
  Lcd_Out(2, 1, "Canal AN1: "); //escreve mensagem na linha 2, coluna 1 do lcd
  delay_ms (10);                //delay 10 milisegundos
  ADCON1 = 0b00000100;          //habilita canal A/D 0 e A/D 1 do PIC
  TRISA = 0b00001111;           //define pinos como entrada
  
  do {
    temp_res1 = Adc_Read(0);    //le canal ad0 do PIC e salva valor na variável temp_res
    temp_res2 = Adc_Read(1);    //lê canal ad1 do PIC e salva valor na variável temp_res2
    delay_us(10);               //delay de 10 microsegundos
    WordToStr(temp_res1, texto);//converte valor da conversão do ad0 para string
    Lcd_Out(1, 11, texto);      //escreve no lcd o valor da conversão do ad0
    delay_us(10);               //delay de 10 us
    WordToStr(temp_res2, texto); //converte valor da conversão do ad1 para string
    Lcd_Out(2, 11, texto);       //escreve no lcd o valor da conversão do ad1
  } while (1);

}