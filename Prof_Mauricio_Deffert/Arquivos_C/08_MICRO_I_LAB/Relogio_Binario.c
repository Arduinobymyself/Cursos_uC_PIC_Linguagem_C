/*************************************************
  PROJETO RELOGIO BINÁRIO
  
  PORTD apresenta no sistema binário o  valor dos segundos de 00 a 59
  PORTC apresenta no sistema binário o  valor dos segundos de 00 a 59
  PORTA apresenta no sistema binário o  valor dos segundos de 01 a 12
  RE0 apresenta a frequência do relógio
  RE1 informa AM
  RE2 informa PM
  RD6 informa modo ajuste
  B0 = ajusta minutos
  B1 = ajusta horas
  B2 = incrementa
  B3 = volta modo relógio

*************************************************/

#define TRUE 1
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)
#define B2 Button(&PORTB, 2, 50, 0)
#define B3 Button(&PORTB, 3, 50, 0)

//#define B0 PORTB.RB0  // ajusta minutos
//#define B1 PORTB.RB1  // ajusta horas
//#define B2 PORTB.RB2  // incrementa
//#define B3 PORTB.RB3  // volta modo relógio

char horas, minutos, segundos;
char ajuste = 3;

void config_mcu();
void atualiza();



void main() {

  config_mcu();
  
  horas = 12;
  minutos = 59;
  segundos = 50;
  ajuste = 3;
  
  PORTD = segundos;
  PORTC = minutos;
  PORTA = horas;
  
  PORTE.RE2 = 0;
  PORTE.RE1 = 1;
  
  while(TRUE){
    
    segundos++;

    if(segundos > 59){
      segundos = 0;
      minutos++;
    }
    if(minutos > 59){
      segundos = 0;
      minutos = 0;
      horas++;
    }
    if(horas > 12){
      PORTE.RE2 = ~PORTE.RE2;
      PORTE.RE1 = ~PORTE.RE1;
      segundos = 0;
      minutos = 0;
      horas = 1;
    }
    
    atualiza();

    if(B0){
      ajuste = 0;
      PORTD.RD6 = 1;
    }
    if(B1){
      ajuste = 1;
      PORTD.RD6 = 1;
    }
    if(B2){
      ajuste = 2;
      PORTD.RD6 = 1;
    }
    if(B3){
      ajuste = 3;
      PORTD.RD6 = 0;
    }

    while(ajuste == 0){ // ajuste minutos
      PORTD.RD6 = 1;
      if(B2){
       delay_ms(200);
       minutos++;
       if(minutos > 59){
         minutos = 0;
         horas++;
         if(horas > 12){
           PORTE.RE2 = ~PORTE.RE2;
           PORTE.RE1 = ~PORTE.RE1;
           horas = 1;
           atualiza();
         }
         atualiza();
       }
       atualiza();
      }
      if(B3) ajuste = 3;
    }
    while(ajuste == 1){ // ajuste horas
      PORTD.RD6 = 1;
      if(B2){
        delay_ms(200);
        horas++;
        if(horas > 12){
          PORTE.RE2 = ~PORTE.RE2;
          PORTE.RE1 = ~PORTE.RE1;
          horas = 1;
          atualiza();
        }
        atualiza();
      }
      if(B3){
        ajuste = 3;
        PORTD.RD6 = 0;
      }
    }
    
    PORTE.RE0 = 1;
    delay_ms(500);
    PORTE.RE0 = 0;
    delay_ms(500);

  }

}

void atualiza(){
  PORTA = horas;
  PORTC = minutos;
  PORTD = segundos;
}

void config_mcu(){
  ADCON1 = 7;
  TRISA = 0;
  PORTA = 0;
  TRISB = 255;
  //PORTB = 255;
  TRISC = 0;
  PORTC = 0;
  TRISD = 0;
  PORTD = 0;
  TRISE = 0;
  PORTE = 0;
}