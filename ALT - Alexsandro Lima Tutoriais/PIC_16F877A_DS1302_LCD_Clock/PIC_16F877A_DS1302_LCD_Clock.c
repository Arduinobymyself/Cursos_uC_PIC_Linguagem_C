#include<pic.h>                        //include MCU head file
__CONFIG(0x1832);
//__CONFIG _DEBUG_OFF&_CP_ALL&_WRT_HALF&_CPD_ON&_LVP_OFF&_BODEN_OFF&_PWRTE_ON&_WDT_OFF&_HS_OSC

#define i_o   RB4                      //1302I_O
#define sclk  RB0                      //1302 clock
#define rst   RB5                      //1302 enable bit

// unsigned char time_rx;
  unsigned char time_rx @ 0x30;        //define receive reg.
  static volatile bit time_rx7   @ (unsigned)&time_rx*8+7;   //receive reg highest.
//static volatile bit temp0     @ (unsigned)&temp*8+0;

void port_init();                      //port initilize subroutine.
void ds1302_init();                    //DS1302 initilize subroutine.
void set_time();                       //set time subroutine.
void get_time();                       //get time subroutine.
void display();                        //display subroutine.
void time_write_1(unsigned char time_tx);    //write one byte subroutine.
unsigned char  time_read_1();          //read one byte subroutine.
void delay();                          //delay subroutine.
//define the time: sec,min,hour,day,month,week,year,control word.
const char table[]={0x00,0x58,0x12,0x8,0x3,0x06,0x06,0x00};
//define the read time and date save table.
char table1[7];
//define the display code for display 0-9
const char table2[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};

//----------------------------------------------
//main routine.
void main()
  {
     port_init();                     //port initilize.
     ds1302_init();                   //DS1302 initilize.
     set_time();                      //set time
     while(1)
        {
          get_time();
          display();
        }
  }

//---------------------------------------------
//DS1302 initilize.
void ds1302_init()
  {
   sclk=0;                            //pull low clock
   rst =0;                            //reset DS1302
   rst=1;                             //enable DS1302
   time_write_1(0x8e);                //send control command
   time_write_1(0);                   //enable write DS1302
   rst=0;                             //reset
  }

//---------------------------------------------
//set time.
void set_time()
  {
   int i;                             //define the loop counter.
   rst=1;                             //enable DS1302
   time_write_1(0xbe);                //
   for(i=0;i<8;i++)                   //continue to write 8 bytes.
     {
       time_write_1(table[i]);        //write one byte
     }
   rst=0;                             //reset
   }

//---------------------------------------------
//get time.
void get_time()
 {
   int i;                             //set loop counter.
   rst=1;                             //enable DS1302
   time_write_1(0xbf);                //
   for(i=0;i<7;i++)                   //continue to read 7 bytes.
     {
        table1[i]=time_read_1();      //
     }
    rst=0;                            //reset DS1302
 }

//--------------------------------------------
//write one byte
void time_write_1(unsigned char time_tx)
 {
    int j;                            //set the loop counter.
    for(j=0;j<8;j++)                  //continue to write 8bit
      {
        i_o=0;                        //
        sclk=0;                       //pull low clk
        if(time_tx&0x01)              //judge the send bit is 0 or 1.
          {
            i_o=1;                    //is 1
          }
        time_tx=time_tx>>1;           //rotate right 1 bit.
        sclk=1;                       //pull high clk
       }
      sclk=0;                         //finished 1 byte,pull low clk
  }

//---------------------------------------------
//read one byte.
unsigned char time_read_1()
 {
   int j;                            //set the loop counter.
   TRISB4=1;                         //continue to write 8bit
   for(j=0;j<8;j++)
      {
        sclk=0;                       //pull low clk
        time_rx=time_rx>>1;           //judge the send bit is 0 or 1.
        time_rx7=i_o;                //put the received bit into the reg's highest.
       sclk=1;                       //pull high clk
      }
    TRISB4=0;                        //finished 1 byte,pull low clk
    sclk=0;
    return(time_rx);
  }

//--------------------------------------------
//pin define func
void port_init()
  {
    TRISA=0x00;                     //a port all output
    TRISD=0X00;                     //d port all output
    ADCON1=0X06;                    //a port all i/o
    TRISB=0X02;                     //rb1 input, others output
    OPTION=0X00;                    //open b port internal pull high.
    PORTA=0XFF;
    PORTD=0XFF;                     //clear all display
   }
[/i][/i]