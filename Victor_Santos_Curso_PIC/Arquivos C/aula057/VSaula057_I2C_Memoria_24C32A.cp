#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula057_I2C_Memoria_24C32A.c"
#line 1 "c:/users/abms-telecom/documents/proteus/victor_santos_curso_pic/arquivos c/24c32a_i2c_lib.h"
#line 20 "c:/users/abms-telecom/documents/proteus/victor_santos_curso_pic/arquivos c/24c32a_i2c_lib.h"
void write24C32A(char wdevice, char w24C32A_reg, char w24C32A_value){

 I2C1_Start();
 I2C1_Wr((0b10100000) | (wdevice << 1));
 I2C1_Wr(w24C32A_reg >> 4);
 I2C1_Wr(w24C32A_reg & 0x0F);
 I2C1_Wr(w24C32A_value);
 I2C1_Stop();
 delay_ms(5);
}

char read24C32A(char rdevice, char r24C32A_reg){

 char r24C32A_value;
 I2C1_Start();
 I2C1_Wr((0b10100000) | (rdevice << 1));
 I2C1_Wr(r24C32A_reg >> 4);
 I2C1_Wr(r24C32A_reg & 0x0F);
 I2C1_repeated_Start();
 I2C1_Wr((0b10100001) | (rdevice << 1));
 r24C32A_value = I2C1_Rd(0);
 I2C1_Stop();
 delay_ms(5);
 return r24C32A_value;

}


void write24C32A_text(char wdevice, char w24C32A_reg, char *w24C32A_text){

 while(*w24C32A_text != '\0'){
 write24C32A(wdevice, w24C32A_reg, *w24C32A_text);
 w24C32A_reg++;
 w24C32A_text++;
 }
}

void read24C32A_text(char rdevice, char r24C32A_reg, char *r24C32A_text, char r24C32A_chr){

 char rauxtxt;
 while(rauxtxt != r24C32A_chr){
 *r24C32A_text = read24C32A(rdevice, r24C32A_reg);
 rauxtxt = *r24C32A_text;
 r24C32A_reg++;
 r24C32A_text++;
 }

}
#line 4 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula057_I2C_Memoria_24C32A.c"
char caractere;
char texto[20];
char tamanho;


void main() {
 I2C1_Init(100000);
 UART1_Init(9600);


 write24C32A(0x00, 0x00, 'a');
 caractere = read24C32A(0x00, 0x00);
 UART1_Write(caractere);
 UART1_Write(13);

 write24C32A_text(0x01, 0x00, "Marcelo Moraes#");
 read24C32A_text(0x01, 0x00, texto, '#');
 tamanho = strlen(texto);
 texto[tamanho-1] = '\0';
 UART1_Write_Text(texto);

 while(1){

 }

}
