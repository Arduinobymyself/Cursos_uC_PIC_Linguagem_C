
//Comunicação entre o PIC e o display
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD2_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD2_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
//end comunicação


//Funções auxiliares
void Celsius();                               //temperatura na escala Celsius
void Fahrenheit();                            //temperatura na escala Fahrenheit
void CustomChar(char pos_row, char pos_char); //função que escreve o caractere especial de "graus" no display
long average_temp();                          //função auxiliar retorna a média das tempeturas de 100 iterações
void termostato(unsigned int tempMin, unsigned int tempMax); // função que implementa um termostado
void LCD_BusyFlag();
//end funções auxiliares


//Diretivas
#define ad_resolution 1023 //resolução PICF877A
#define vdd           5    //alimentação TTL
#define factor        100  //fator de correção do sensor LM35
#define ledRED        RB0_bit  // quando aceso indica que a temperatura está acima da máxima e o ventilador será acionado
#define ledGREEN      RB1_bit  // quando aceso indica que a temperatura está dentro da faixa estabelecida
#define ledBLUE       RB2_bit  // quando aceso indica que a temperatura está abaixo da mínima e o aquecedor será acionado
#define aquecedor     RB3_bit
#define ventilador    RB4_bit
#define SW            RB7_bit

//end diretivas


//Macro (concatena cada dígito referente à temperatura lida, precisão de duas casas decimais)
#define disp_t  lcd_chr(2,9,dezena+48);    lcd_chr_cp(unidade+48); \
                lcd_chr_cp('.');           lcd_chr_cp(dec1+48);    \
                lcd_chr_cp(dec2+48);       CustomChar(2,14);
//end macro


//Variáveis
unsigned long store, t_Celsius, t_Fahrenheit; //variáveis armazenam as grandezas de temperatura
unsigned char dezena, unidade, dec1, dec2;    //dígitos para utilizar na macro e exibir no display
unsigned char *text;                          //Variável que armazena textos para escrever no display
const char character[] = {6,9,6,0,0,0,0,0};   //caractere especial de "graus"
//end variáveis


//Função principal
void main()
{

   
   TRISA = 0b11000001;                 //Configura RA0 como entrada AN0
   TRISB = 0x80;                       //Somente RB7 como entrada
   TRISD = 0x00;                       //Todo o PORT D como saída
   
   CMCON = 0b00000111;
   ADCON0 = 0b00000001;                //Ativa o conversor A/D e seleciona o canal analógico AN0
   //ADCON1 = 0b10001001;                //Canal analógico AN5 os demais digital
   
   PORTA = 0x00;                       //Inicializa os bits em low
   PORTB = 0x00;
   PORTD = 0x00;                       //Inicializa os bits em low

   Lcd_Init();                         //Inicializa o display
   Lcd_Cmd(_LCD_CURSOR_OFF);           //Apaga o cursor
   Lcd_Cmd(_LCD_CLEAR);                //Limpa o display



   text=("TEMPERATURA");               //Armazena o texto na variável text
   lcd_out(1,3,text);                  //Escreve o texto uma vez no display, linha 1, coluna 3

   text=("Temp =");                    //Armazena o texto na variável text
   lcd_out(2,1,text);                  //Escreve o texto uma vez no display, linha 2, coluna 1


    while(1)                         //Início do loop infinito
    {
      if(!SW) Celsius();           //Se RD0 estiver em low, exibe temperatura em Celsius

      else Fahrenheit();           //senão, exibe temperatura em Fahrenheit

    } //end while

} //end main

void Celsius(){
  store = average_temp();                       //atribui a média de 100 medidas à variável store
  t_Celsius = (store*vdd*factor)/ad_resolution; //converte o valor para escala Celsius

  //as 4 linhas seguintes separam os dígitos do valor em dezena, unidade e mais duas casas decimais
  dezena = t_Celsius / 10;
  unidade = t_Celsius % 10;
  dec1 = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
  dec2 = (((((store*vdd*factor)%ad_resolution)*10)%ad_resolution)*10)/ad_resolution;


  disp_t;              //chama a macro

  Lcd_Out(2, 15, "C"); //escreve "C" de Celsius no display

  termostato(20, 24);

  delay_ms(800);       //taxa de atualização do display e das medidas
}

void Fahrenheit(){
  store = average_temp();                       //atribui a média de 100 medidas à variável store
  t_Celsius = (store*vdd*factor)/ad_resolution; //converte o valor para escala Celsius

  t_Fahrenheit = (t_Celsius*1.8)+32;            //converte temperatura em Celsius para Fahrenheit


           //as 4 linhas seguintes separam os dígitos do valor em dezena, unidade e mais duas casas decimais
  dezena = t_Fahrenheit/10;
  unidade = t_Fahrenheit % 10;
  dec1 = (((store*vdd*factor)%ad_resolution)*10)/ad_resolution;
  dec2 = (((((store*vdd*factor)%ad_resolution)*10)%ad_resolution)*10)/ad_resolution;

  disp_t;              //chama a macro

  Lcd_Out(2, 15, "F"); //escreve "F" de Fahrenheit no display

  termostato(20, 24);

  delay_ms(800);       //taxa de atualização do display e das medidas

}

long average_temp(){
  unsigned char i;
  unsigned long temp_store = 0;

  for(i=0; i<100; i++)
  {
    temp_store += ADC_Read(0); //faz o somatório das 100 iterações
  }

  return(temp_store/100); //retorna a média das iterações
}

void CustomChar(char pos_row, char pos_char)  //função gerada pelo mikroC para imprimir caracteres especiais
{
    char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

void termostato(unsigned int tempMin, unsigned int tempMax){
  if(t_Celsius  < tempMin){
    // acender o LED Azul e ligar o aquecedor (aquecer)
    ledRED        = 0;
    ledBLUE       = 1;
    ledGREEN      = 0;
    aquecedor     = 1;
    ventilador    = 0;
  } else if(t_Celsius  > tempMax){
    // acender o LED Vermelho e ligar o ventilador (resfriar)
    ledRED        = 1;
    ledBLUE       = 0;
    ledGREEN      = 0;
    aquecedor     = 0;
    ventilador    = 1;
  } else {
    // temperatura dentro da faixa
    ledRED        = 0;
    ledBLUE       = 0;
    ledGREEN      = 1;
    aquecedor     = 0;
    ventilador    = 0;
  }
}

void LCD_BusyFlag(){
  LCD_D7   = 1;           //Make D7th bit of LCD as i/p
  LCD_EN   = 1;           //Make port pin as o/p
  LCD_RS   = 0;           //Selected command register
  //LCD_RW   = 1;           //We are reading
  while(LCD_D7){          //read busy flag again and again till it becomes 0
    LCD_EN   = 0;         //Enable H->L
    delay_ms(10);
    LCD_EN   = 1;         //Enable L->H
    delay_ms(10);
  }
}