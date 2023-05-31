#line 1 "C:/Users/marcelo/SkyDrive/PIC Projects/MickroC Projects/PIC_16F877A_DS1302_LCD_Clock.c"

__CONFIG(0x1832);







 unsigned char time_rx @ 0x30;
 static volatile bit time_rx7 @ (unsigned)&time_rx*8+7;


void port_init();
void ds1302_init();
void set_time();
void get_time();
void display();
void time_write_1(unsigned char time_tx);
unsigned char time_read_1();
void delay();

const char table[]={0x00,0x58,0x12,0x8,0x3,0x06,0x06,0x00};

char table1[7];

const char table2[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};



void main()
 {
 port_init();
 ds1302_init();
 set_time();
 while(1)
 {
 get_time();
 display();
 }
 }



void ds1302_init()
 {
  RB0 =0;
  RB5  =0;
  RB5 =1;
 time_write_1(0x8e);
 time_write_1(0);
  RB5 =0;
 }



void set_time()
 {
 int i;
  RB5 =1;
 time_write_1(0xbe);
 for(i=0;i<8;i++)
 {
 time_write_1(table[i]);
 }
  RB5 =0;
 }



void get_time()
 {
 int i;
  RB5 =1;
 time_write_1(0xbf);
 for(i=0;i<7;i++)
 {
 table1[i]=time_read_1();
 }
  RB5 =0;
 }



void time_write_1(unsigned char time_tx)
 {
 int j;
 for(j=0;j<8;j++)
 {
  RB4 =0;
  RB0 =0;
 if(time_tx&0x01)
 {
  RB4 =1;
 }
 time_tx=time_tx>>1;
  RB0 =1;
 }
  RB0 =0;
 }



unsigned char time_read_1()
 {
 int j;
 TRISB4=1;
 for(j=0;j<8;j++)
 {
  RB0 =0;
 time_rx=time_rx>>1;
 time_rx7= RB4 ;
  RB0 =1;
 }
 TRISB4=0;
  RB0 =0;
 return(time_rx);
 }



void port_init()
 {
 TRISA=0x00;
 TRISD=0X00;
 ADCON1=0X06;
 TRISB=0X02;
 OPTION=0X00;
 PORTA=0XFF;
 PORTD=0XFF;
 }
[/i][/i]
