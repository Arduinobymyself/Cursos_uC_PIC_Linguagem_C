#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/pwm_1.c"






int duty = 1;

void main() {
 TRISC = 0;
 PORTC = 0;
 while(1){
  RC2_bit  = 1;
 Vdelay_ms(duty);
  RC2_bit  = 0;
 Vdelay_ms(10-duty);
 }

}
