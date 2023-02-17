#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula025.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula025.c"
void changeCont();
void writeEEPROM();
void readEEPROM();


int cont = 0;
unsigned char catodo;
unsigned char segmento[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
unsigned char address = 0x01;
unsigned int store;


void main() {
 CMCON = 0x07;
 TRISA = 0x03;
 TRISB = 0x00;
 PORTA = 0x03;
 PORTB = 0x00;

 readEEPROM();

 while(1)
 {

 changeCont();
 if(! RA0_bit ) writeEEPROM();
 delay_ms(100);
 catodo = segmento[cont];
 PORTB = catodo;
 }
}

void changeCont(){
 if(! RA1_bit ){
 delay_ms(100);
 cont++;
 if(cont > 9) cont = 0;
 }
}
void writeEEPROM(){
 unsigned char aux1, aux2;

 aux1 = EEPROM_Read(0x00);
 if(aux1 == 0xff){
 EEPROM_Write(0x00, address);
 delay_ms(10);
 }

 store = EEPROM_Read(0x00);
 delay_ms(10);
 aux2 = store;
 EEPROM_Write(store, cont);
 delay_ms(10);
 aux2++;
 if(aux2 > 128) aux2 = 0x00;

 EEPROM_Write(0x00, aux2);

 delay_ms(10);
  RA3_bit  = 1;
 delay_ms(300);
  RA3_bit  = 0;
}

void readEEPROM(){
 unsigned char anchor;
 anchor = EEPROM_Read(0x00);
 cont = EEPROM_Read(0x00+(anchor-1));
}
