extern sfr sbit display_4511_A;
extern sfr sbit display_4511_B;
extern sfr sbit display_4511_C;
extern sfr sbit display_4511_D;
extern sfr sbit display_4511_disp1;
extern sfr sbit display_4511_disp2;
extern sfr sbit display_4511_disp3;
extern sfr sbit display_4511_disp4;

extern sfr sbit display_4511_A_direction;
extern sfr sbit display_4511_B_direction;
extern sfr sbit display_4511_C_direction;
extern sfr sbit display_4511_D_direction;
extern sfr sbit display_4511_disp1_direction;
extern sfr sbit display_4511_disp2_direction;
extern sfr sbit display_4511_disp3_direction;
extern sfr sbit display_4511_disp4_direction;


void display_4511_init();
void display_4511_out(unsigned char digito);
void display_4511_sweep(unsigned int numero);


// --- desenvolvimento das funções auxiliares --- //

void display_4511_init(){
  // pinos do display como saída
  display_4511_A_direction = 0;
  display_4511_B_direction = 0;
  display_4511_C_direction = 0;
  display_4511_D_direction = 0;
  
  display_4511_disp1_direction = 0;
  display_4511_disp2_direction = 0;
  display_4511_disp3_direction = 0;
  display_4511_disp4_direction = 0;


  // barramento BCD com 1111, valor este que desliga o display
  display_4511_A = 1;
  display_4511_B = 1;
  display_4511_C = 1;
  display_4511_D = 1;
  // todos os displays não selecionados
  display_4511_disp1 = 0;
  display_4511_disp2 = 0;
  display_4511_disp3 = 0;
  display_4511_disp4 = 0;
}


void display_4511_out(unsigned char digito){
   switch(digito){
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

void display_4511_sweep(unsigned int numero){
  static unsigned char position = 1;
  
  if(numero > 9999) numero = 9999;

  // desliga todos os displays
  display_4511_disp1 = 0;
  display_4511_disp2 = 0;
  display_4511_disp3 = 0;
  display_4511_disp4 = 0;
  delay_us(10);
  
  switch(position){
    case 1:
      display_4511_out((numero/1000));     // escreve no barramento
      display_4511_disp1 = 1;              // liga o display
      position = 2;                        // habilita o próximo display
    break;
    
    case 2:
      display_4511_out(((numero/100)%10)); // escreve no barramento
      display_4511_disp2 = 1;              // liga o display
      position = 3;                        // habilita o próximo display
    break;
    
    case 3:
      display_4511_out(((numero/10)%10));  // escreve no barramento
      display_4511_disp3 = 1;              // liga o display
      position = 4;                        // habilita o próximo display
    break;
    
    case 4:
      display_4511_out(((numero/1)%10));   // escreve no barramento
      display_4511_disp4 = 1;              // liga o display
      position = 1;                        // habilita o próximo display
    break;
    
  }
    
}