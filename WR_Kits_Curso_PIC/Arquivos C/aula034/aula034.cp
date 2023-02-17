#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula034.c"
#line 40 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula034.c"
void interrupt();




void main() {
 CMCON = 0X07;

 TRISA = 0x00;
 PORTA = 0x00;
 TRISB = 0x01;
 PORTB = 0x01;

 GIE_bit = 1;
 PEIE_bit = 0;
 INTE_bit = 1;
 INTEDG_bit = 0;

 INTF_bit = 0;

 while(1){
  RA1_bit  = ~ RA1_bit ;
 delay_ms(3000);
 }

}


void interrupt(){
 if(INTF_bit){
 INTF_bit = 0;
  RA0_bit  = ~ RA0_bit ;
 }

}
