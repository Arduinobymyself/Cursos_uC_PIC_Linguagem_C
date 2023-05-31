#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula047/aula047.c"
#line 39 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/WR_Kits_Curso_PIC/Arquivos C/aula047/aula047.c"
void main() {
 int tempo = 100;

 CMCON = 0X07;
 TRISA = 0X03;
 PORTA = 0X03;
 VRCON = 0xE7;





 while(1)
 {
 VRCON = 0xE7;
 Vdelay_ms(tempo);
 VRCON = 0xE6;
 Vdelay_ms(tempo);
 VRCON = 0xE5;
 Vdelay_ms(tempo);
 VRCON = 0xE4;
 Vdelay_ms(tempo);
 VRCON = 0xE3;
 Vdelay_ms(tempo);
 VRCON = 0xE2;
 Vdelay_ms(tempo);
 VRCON = 0xE1;
 Vdelay_ms(tempo);
 VRCON = 0xE0;
 Vdelay_ms(tempo);
 }

}
