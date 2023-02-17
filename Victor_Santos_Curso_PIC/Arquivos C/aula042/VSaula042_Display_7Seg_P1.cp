#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula042_Display_7Seg_P1.c"
#line 11 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula042_Display_7Seg_P1.c"
unsigned char display(unsigned char num);
unsigned char i;
unsigned char pattern[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};



void main() {

 TRISD = 0;
 PORTD = 0;


 while(1){
 for(i=0; i < 9; i++){

 PORTD = pattern[i];
 delay_ms(200);
 }
 }


}


unsigned char display(char num){
 switch(num){
 case 1: return 0x06;
 case 2: return 0x5B;
 case 3: return 0x4F;
 case 4: return 0x66;
 case 5: return 0x6D;
 case 6: return 0x7D;
 case 7: return 0x07;
 case 8: return 0x7F;
 case 9: return 0x6F;
 case 0: return 0x3F;
 }
}
