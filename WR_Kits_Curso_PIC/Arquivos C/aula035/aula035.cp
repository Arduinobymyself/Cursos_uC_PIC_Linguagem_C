#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula035.c"
#line 39 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula035.c"
void interrupt();
int display(int num);


int contador = 0;
int num;


void main() {
 CMCON = 0X07;

 TRISB = 0x01;
 PORTB = 0x7E;

 GIE_bit = 1;
 PEIE_bit = 0;
 INTE_bit = 1;
 INTEDG_bit = 1;

 INTF_bit = 0;

 while(1){

 }

}


void interrupt(){
 if(INTF_bit){
 INTF_bit = 0;
 contador++;
 PORTB = display(contador);
 if(contador > 9){
 contador = 0;
 PORTB = display(contador);
 }

 }

}

int display(int num){
 int aux;


 int catodo[] = {0x7E, 0x0C, 0xB6, 0x9E, 0xCC, 0xDA, 0xFA, 0x0E, 0xFE, 0xDE};
 aux = catodo[num];
 return aux;

}
