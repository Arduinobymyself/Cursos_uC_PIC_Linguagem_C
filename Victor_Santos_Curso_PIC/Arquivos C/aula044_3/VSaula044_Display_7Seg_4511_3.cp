#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula044_Display_7Seg_4511_3.c"
#line 1 "c:/users/abms-telecom/documents/proteus/victor_santos_curso_pic/arquivos c/display_4x_4511.h"
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




void display_4511_init(){

 display_4511_A_direction = 0;
 display_4511_B_direction = 0;
 display_4511_C_direction = 0;
 display_4511_D_direction = 0;

 display_4511_disp1_direction = 0;
 display_4511_disp2_direction = 0;
 display_4511_disp3_direction = 0;
 display_4511_disp4_direction = 0;



 display_4511_A = 1;
 display_4511_B = 1;
 display_4511_C = 1;
 display_4511_D = 1;

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


 display_4511_disp1 = 0;
 display_4511_disp2 = 0;
 display_4511_disp3 = 0;
 display_4511_disp4 = 0;
 delay_us(10);

 switch(position){
 case 1:
 display_4511_out((numero/1000));
 display_4511_disp1 = 1;
 position = 2;
 break;

 case 2:
 display_4511_out(((numero/100)%10));
 display_4511_disp2 = 1;
 position = 3;
 break;

 case 3:
 display_4511_out(((numero/10)%10));
 display_4511_disp3 = 1;
 position = 4;
 break;

 case 4:
 display_4511_out(((numero/1)%10));
 display_4511_disp4 = 1;
 position = 1;
 break;

 }

}
#line 15 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula044_Display_7Seg_4511_3.c"
sbit display_4511_A at RB0_bit;
sbit display_4511_B at RB1_bit;
sbit display_4511_C at RB2_bit;
sbit display_4511_D at RB3_bit;

sbit display_4511_disp1 at RD0_bit;
sbit display_4511_disp2 at RD1_bit;
sbit display_4511_disp3 at RD2_bit;
sbit display_4511_disp4 at RD3_bit;


sbit display_4511_A_direction at TRISB0_bit;
sbit display_4511_B_direction at TRISB1_bit;
sbit display_4511_C_direction at TRISB2_bit;
sbit display_4511_D_direction at TRISB3_bit;

sbit display_4511_disp1_direction at TRISD0_bit;
sbit display_4511_disp2_direction at TRISD1_bit;
sbit display_4511_disp3_direction at TRISD2_bit;
sbit display_4511_disp4_direction at TRISD3_bit;



void initTimer0();
void interrupt();


unsigned char i;
unsigned int contador = 5678;


void main() {
 initTimer0();
 display_4511_init();

 while(1){
 delay_ms(500);
 contador++;
 }

}

void initTimer0(){
 OPTION_REG = 0x83;
 TMR0 = 6;
 INTCON = 0xA0;
}

void interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 6;
 display_4511_sweep(contador);
 }
}
