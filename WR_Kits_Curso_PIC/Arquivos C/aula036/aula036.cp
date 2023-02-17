#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula036.c"
#line 27 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula036.c"
void main() {
 CMCON = 0X07;
 OPTION_REG = 0b10001110;

 TRISB = 0;
 PORTB = 0;

  RB7_bit  = 1;

 asm clrwdt;

 while(1)
 {
 asm clrwdt;
  RB0_bit  = ~ RB0_bit ;
 delay_ms(300);
 }

}
