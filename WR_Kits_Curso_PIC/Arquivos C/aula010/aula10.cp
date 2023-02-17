#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula10.c"









void servo1_horario();
void servo1_centro();
void servo1_antihorario();




void main() {
 cmcon = 0x07;
 trisA = 0x03;
 trisB = 0x00;
 portA = 0x03;
 portB = 0x00;

 while(1){

 if( RA1_bit  == 0x00 &&  RA0_bit  == 0x01) servo1_horario();


 if( RA1_bit  == 0x01 &&  RA0_bit  == 0x00) servo1_antihorario();


 if( RA1_bit  == 0x01 &&  RA0_bit  == 0x01) servo1_centro();
 }
}


void servo1_centro(){
  RB0_bit  = 0x00;
 delay_us(18500);
  RB0_bit  = 0x01;
 delay_us(1500);
}

void servo1_antihorario(){
  RB0_bit  = 0x00;
 delay_us(19000);
  RB0_bit  = 0x01;
 delay_us(1000);
}

void servo1_horario(){
  RB0_bit  = 0x00;
 delay_us(18000);
  RB0_bit  = 0x01;
 delay_us(2000);
}
