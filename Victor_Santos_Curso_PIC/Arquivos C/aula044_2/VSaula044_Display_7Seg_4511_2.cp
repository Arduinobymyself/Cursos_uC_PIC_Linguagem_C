#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula044_Display_7Seg_4511_2.c"
#line 1 "c:/users/abms-telecom/documents/proteus/victor_santos_curso_pic/arquivos c/display_4511.h"
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




void display_4511_init(){

 display_4511_A_direction = 0;
 display_4511_B_direction = 0;
 display_4511_C_direction = 0;
 display_4511_D_direction = 0;


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
#line 15 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula044_Display_7Seg_4511_2.c"
sbit display_4511_A at RB0_bit;
sbit display_4511_B at RB1_bit;
sbit display_4511_C at RB2_bit;
sbit display_4511_D at RB3_bit;

sbit display_4511_A_direction at TRISB0_bit;
sbit display_4511_B_direction at TRISB1_bit;
sbit display_4511_C_direction at TRISB2_bit;
sbit display_4511_D_direction at TRISB3_bit;






unsigned char i;


void main() {
 display_4511_init();

 while(1){
 for(i=0; i < 9; i++){
 display_4511_out(i);
 delay_ms(300);
 }
 }

}
