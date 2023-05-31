
#define B0 PORTB.RB0
#define B1 PORTB.RB1


int x, valor, resto;
int numero[16] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113};
int display[5] = {0, 4, 8, 16, 32};
bit flagB0, flagB1;
int i, contador = 0;




void muxDisplay(int valorNumerico);
void buzzer(int xBuzzer);


void main() {
  CMCON = 7;
  ADCON0 = 0;
  ADCON1 = 7;
  TRISB = 0b00000011;
  TRISD = 0;
  PORTD = 0;
  TRISA = 0;
  PORTA = 0;
  TRISC.RC1 = 0;
  PORTC.RC1 = 0;

  

  
  while(1){
  
    if(!B0){ // B0 incrementa contador
      if(contador < 9999){
        contador++;
        buzzer(contador);
      } else {
        contador = 0;
        buzzer(contador);
        buzzer(contador);
        buzzer(contador);
        buzzer(contador);
      }
    }
    if(!B1){ // B0 incrementa contador
      if(contador > 0){
        contador--;
        buzzer(contador);
      } else {
        buzzer(contador);
        buzzer(contador);
        buzzer(contador);
        buzzer(contador);
      }
    }
    muxDisplay(contador);


  
  
  }

}

void muxDisplay(int valorNumerico){
  // primeiro digito
  valor = valorNumerico/1000;
  PORTD = numero[valor];
  PORTA = display[1];
  delay_ms(1);
  
  // segundo digito
  valor = valorNumerico/100;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[2];
  delay_ms(1);
  
  // terceiro digito
  valor = valorNumerico/10;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[3];
  delay_ms(1);
  
  // quarto digito
  valor = valorNumerico/1;
  resto = valor % 10;
  PORTD = numero[resto];
  PORTA = display[4];
  delay_ms(1);
}

void buzzer(int xBuzzer){
  int i;
  PORTC.RC1 = 1;
  for(i = 0; i < 150; i++){
    if(i > 75) PORTC.RC1 = 0;
    muxDisplay(xBuzzer);
  }
}