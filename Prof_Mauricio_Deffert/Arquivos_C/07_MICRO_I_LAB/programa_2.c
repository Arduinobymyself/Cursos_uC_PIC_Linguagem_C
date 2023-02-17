#define START PORTB.RB0
#define SA PORTB.RB1
#define SB PORTB.RB2
#define STOP PORTB.RB3
#define MOTOR_ON_DIR PORTC.RC6 = 1, PORTC.RC7 = 0
#define MOTOR_ON_ESQ PORTC.RC6 = 0, PORTC.RC7 = 1
#define MOTOR_OFF    PORTC.RC6 = 0, PORTC.RC7 = 0



void main() {
  ADCON1 = 7;
  TRISB = 0XFF;
  PORTB = 0XFF;
  TRISC = 0;
  PORTC = 0;
  TRISD = 0;
  PORTD = 0;
  
  while(1){
    if(START == 0){
      delay_ms(40);
      MOTOR_ON_DIR;
    }
    
    if(SB == 0){
      delay_ms(50);
      MOTOR_OFF;
      while(PORTD < 16){
        PORTD++;
        delay_ms(1000);
      }
      PORTD = 0;
      MOTOR_ON_ESQ;
    }
    
    if(SA == 0){
      delay_ms(50);
      MOTOR_OFF;
      while(PORTD < 16){
        PORTD++;
        delay_ms(1000);
      }
      PORTD = 0;
      MOTOR_ON_DIR;
    }
    
    if(STOP == 0){
      delay_ms(50);
      MOTOR_OFF;
    }
    




  }
  
  
}