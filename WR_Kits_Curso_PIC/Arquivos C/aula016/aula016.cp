#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula016.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula016.c"
int display(int no);
void changeCount();

int Cen, Msd, Lsd, Cnt = 0;


void main() {
 CMCON = 0X07;
 TRISA = 0X03;
 TRISB = 0X00;

  PORTB.F7  = 0;
  PORTA.F2  = 0;
  PORTA.F3  = 0;

 while(1)
 {
 changeCount();

 Cen = (Cnt/100)-((Cnt%100)/100);

 PORTB = display(Cen);
  PORTB.F7  = 1;
 delay_ms(5);
  PORTB.F7  = 0;

 Msd = (Cnt%100);
 Msd = (Msd/10)-((Msd%10)/10);

 PORTB = display(Msd);
  PORTA.F2  = 1;
 delay_ms(5);
  PORTA.F2  = 0;

 Lsd = Cnt%10;

 PORTB = display(Lsd);
  PORTA.F3  = 1;
 delay_ms(5);
  PORTA.F3  = 0;

 }

}


int display(int no)
{
 int Pattern;
 int SEGMENTO[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
 Pattern = SEGMENTO[no];
 return Pattern;
}

void changeCount()
{
 while( PORTA.F1  == 1)
 {
 Cnt += 10;
 delay_ms(300);
 if(Cnt > 300) Cnt = 300;
 }

 while( PORTA.F0  == 1)
 {
 Cnt -= 10;
 delay_ms(300);
 if(Cnt < 1) Cnt = 0;
 }
}
