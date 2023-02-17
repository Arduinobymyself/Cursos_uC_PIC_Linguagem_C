/*
  Este programa tem por objetivo implementar um Rel�gio B�sico com LCD
  com ajustes de segundos(RB0), minutos(RB1) e horas(RB2)
*/

// pinagem do display
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

// declara��o de vari�veis
char segundos = 0, minutos = 0, horas = 0;

char *clock = "00:00:00";
// �ndices --> 01234567

unsigned int cont;
char Flags = 0;

// prot�tipo fun��es
void interrupt();
void setupMCU();


void main(){

  setupMCU();
  
  while(1){
    clock[0] = horas/10+'0'; // carrega hora (dezena) para �ndice 0 da string
    clock[1] = horas%10+'0'; // carrega hora (unidade) para �ndice 1 da string
    clock[3] = minutos/10+'0'; // carrega minutos (dezena) para �ndice 3 da string
    clock[4] = minutos%10+'0'; // carrega minutos (unidade) para �ndice 4 da string
    clock[6] = segundos/10+'0'; // carrega segundos (dezena) para �ndice 6 da string
    clock[7] = segundos%10+'0'; // carrega segundos (unidade) para �ndice 7 da string

    Lcd_Out(2, 5, clock);

    if(PORTB.RB0) Flags.B0 = 1; // trava tecla
    if(PORTB.RB1) Flags.B1 = 1; // trava tecla
    if(PORTB.RB2) Flags.B2 = 1; // trava tecla

    if(PORTB.RB0 == 0 && Flags.B0){ // ajuste dos segundos
      Flags.B0 = 0;
      segundos = 0;
    }

    if(PORTB.RB1 == 0 && Flags.B1){ // ajuste dos minutos
      Flags.B1 = 0;
      minutos++;
      if(minutos >= 60) minutos = 0;
    }

    if(PORTB.RB2 == 0 && Flags.B2){ // ajuste das horas
      Flags.B2 = 0;
      horas++;
      if(horas >= 24) horas = 0;
    }
    
  }
}

void interrupt(){

  TMR0 = 6; // inicia TMR0 em 6 (contagem a partir de 6 at� 255... 250 ciclos de m�quina, 1ms)
  cont++;
  INTCON.TMR0IF = 0; // reinicializa o flag de estouro do TMR0
  
  if(cont == 1000){ // se 1000 estouros (1s)
    cont = 0;
    segundos++;
    PORTD.RD0 = ~PORTD.RD0; // inverte LED, pisca a cada 1s
    if(segundos == 60){
      segundos = 0;
      minutos++;
      if(minutos == 60){
        segundos = 0;
        minutos = 0;
        horas++;
        if(horas == 24){
          segundos = 0;
          minutos = 0;
          horas = 0;
        }
      }
    }
  }
  
}

void setupMCU(){

  TRISB = 255;    // PORT B como entrada
  PORTB = 255;    // PORT B  inicialmente em n�vel alto HIGH
  TRISD = 0;      // PORT D como sa�da
  PORTD = 0;      // PORT D inicialmente em n�vel baixo LOW
  
  INTCON.GIE = 1;           // liga chave geral de interrup��es (n�o necess�rio para TMR0
  INTCON.PEIE = 0;          // interrup��o por perif�ricos desabilitada
  INTCON.TMR0IE = 1;        // interrup��o por TMR0 habilitada
  OPTION_REG = 0b10000001;  // modo TIMER, prescaler 1:8
  TMR0 = 6;                 // TMR0 inicia me 6 para obter TE = 1ms

  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1, 1, "  Basic  Clock");
  
}