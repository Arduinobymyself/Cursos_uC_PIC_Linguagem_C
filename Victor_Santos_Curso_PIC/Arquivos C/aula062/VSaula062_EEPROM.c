/*******************************************************************************
Firmware:
Autor:            Marcelo Moraes
Local:            Sorocaba - SP
Data:             fev 2023
Microcontrolador: 16F877A
Frequência:       8MHz
Compilador:       MikroC PRO For PIC
Descrição:
    Ciclo Máquina = 500ns



*******************************************************************************/


//Incluções de Headers
/******************************************************************************/

//Definições (Apelidos)
/******************************************************************************/

//Variáveis Globais
/******************************************************************************/
// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// lCD Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

#define B1 Button(&PORTB, 0, 10, 0)
#define B2 Button(&PORTB, 1, 10, 0)
#define B3 Button(&PORTB, 2, 10, 0)
#define B4 Button(&PORTB, 3, 10, 0)

#define LED RD1_bit

char texto1[] = "senha:";
char texto2[] = "OK!!";
char texto3[] = "ERRO";

char cont = 0, senha = 0, teste = 0;



//Protótipo das Funções Secundárias
/******************************************************************************/




//Função Principal
/******************************************************************************/
void main() {
  //Variáveis Locais
  char flagBtn = 0;
  
  // Configuração de Registradores
  
  //Configuração dos TRISs e PORTs
  TRISD = 0b00000000;
  TRISB = 0b11111111;
  PORTD = 0b00000000;

  //Inicialização das funções
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, texto1);
  senha = EEPROM_Read(0x00);
  Lcd_Chr(1, 8, (senha+48));
  Lcd_Chr(2, 8, (cont+48));

  LED = 1;
  delay_ms(200);
  LED = 0;
  LED = 1;
  delay_ms(200);
  LED = 0;
  LED = 1;
  delay_ms(200);
  LED = 0;
  LED = 1;
  delay_ms(200);
  LED = 0;

  // Loop Infinito
  do {

    if(B1 && !flagBtn.b1){
      flagBtn.b1 = 1;
      cont++;
      if(cont>9) cont = 0;
      Lcd_Chr(2, 8, (cont+48));
      delay_ms(100);
    }
    if(!B1 && flagBtn.b1){
      flagBtn.b1 = 0;
    }
    
    if(B2 && !flagBtn.b2){
      flagBtn.b2 = 1;
      senha++;
      if(senha>9) senha = 0;
      Lcd_Chr(1, 8, (senha+48));
      delay_ms(100);
    }
    if(!B2 && flagBtn.b2){
      flagBtn.b2 = 0;
    }
    
    if(B3 && !flagBtn.b3){
      flagBtn.b3 = 1;
      EEPROM_Write(0x00, senha);
      delay_ms(100);
    }
    if(!B3 && flagBtn.b3){
      flagBtn.b3 = 0;
    }
    
    if(B4 && !flagBtn.b4){
      flagBtn.b4 = 1;
      teste = EEPROM_read(0x00);
      if(teste == cont){
        Lcd_Out(1, 12, texto2);
        LED = 1;
        teste = 0;
      } else {
        Lcd_Out(1, 12, texto3);
        LED = 0;
      }
      delay_ms(100);
    }
    if(!B4 && flagBtn.b4){
      flagBtn.b4 = 0;
    }

  } while (1); //Final do Loop

}//Final da main()




// Desenvolvimento das Funções Secundárias
/******************************************************************************/