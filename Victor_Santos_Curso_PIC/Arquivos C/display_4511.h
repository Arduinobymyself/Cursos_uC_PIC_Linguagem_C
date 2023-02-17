extern sfr sbit display_4511_A;
extern sfr sbit display_4511_B;
extern sfr sbit display_4511_C;
extern sfr sbit display_4511_D;

extern sfr sbit display_4511_A_direction;
extern sfr sbit display_4511_B_direction;
extern sfr sbit display_4511_C_direction;
extern sfr sbit display_4511_D_direction;


void display_4511_init();
void display_4511_out(unsigned char num);


// --- desenvolvimento das funções auxiliares --- //

void display_4511_init(){
  // pinos do display como saída
  display_4511_A_direction = 0;
  display_4511_B_direction = 0;
  display_4511_C_direction = 0;
  display_4511_D_direction = 0;

  // barramento BCD com 1111, valor este que desliga o display
  display_4511_A = 1;
  display_4511_B = 1;
  display_4511_C = 1;
  display_4511_D = 1;
}


void display_4511_out(unsigned char num){
   switch(num){
     case 0:
       display_4511_A = 0;
       display_4511_B = 0;
       display_4511_C = 0;
       display_4511_D = 0;
     break;
     case 1:
       display_4511_A = 1;
       display_4511_B = 0;
       display_4511_C = 0;
       display_4511_D = 0;
     break;
     case 2:
       display_4511_A = 0;
       display_4511_B = 1;
       display_4511_C = 0;
       display_4511_D = 0;
     break;
     case 3:
       display_4511_A = 1;
       display_4511_B = 1;
       display_4511_C = 0;
       display_4511_D = 0;
     break;
     case 4:
       display_4511_A = 0;
       display_4511_B = 0;
       display_4511_C = 1;
       display_4511_D = 0;
     break;
     case 5:
       display_4511_A = 1;
       display_4511_B = 0;
       display_4511_C = 1;
       display_4511_D = 0;
     break;
     case 6:
       display_4511_A = 0;
       display_4511_B = 1;
       display_4511_C = 1;
       display_4511_D = 0;
     break;
     case 7:
       display_4511_A = 1;
       display_4511_B = 1;
       display_4511_C = 1;
       display_4511_D = 0;
     break;
     case 8:
       display_4511_A = 0;
       display_4511_B = 0;
       display_4511_C = 0;
       display_4511_D = 1;
     break;
     case 9:
       display_4511_A = 1;
       display_4511_B = 0;
       display_4511_C = 0;
       display_4511_D = 1;
     break;

   }
}