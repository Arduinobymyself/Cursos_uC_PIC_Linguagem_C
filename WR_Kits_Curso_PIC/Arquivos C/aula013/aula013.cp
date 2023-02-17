#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula013.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula013.c"
void main() {
 unsigned char catodo, cont = 0x00;
 unsigned char segmento[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F};

 cmcon = 0x07;
 trisB = 0x00;
 portB = 0x00;

 while(1){
 catodo = segmento[cont];
 portB = catodo;
 cont++;
 if(cont == 10) cont = 0;
 delay_ms(1000);
 }
}
