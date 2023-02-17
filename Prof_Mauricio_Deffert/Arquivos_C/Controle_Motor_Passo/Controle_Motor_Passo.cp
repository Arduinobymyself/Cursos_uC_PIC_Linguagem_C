#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Controle_Motor_Passo.c"
#line 27 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Controle_Motor_Passo.c"
unsigned int tempo = 400;

void main() {


 PORTC = 0b00000001;
 Vdelay_ms(tempo);
 PORTC = 0b00000010;
 Vdelay_ms(tempo);
 PORTC = 0b00000100;
 Vdelay_ms(tempo);
 PORTC = 0b00001000;
 Vdelay_ms(tempo);

}
