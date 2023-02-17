#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula007.c"
#line 34 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula007.c"
void main() {
 cmcon = 0x07;
 trisD = 0x00;
 trisB = 0x03;

 portD = 0x00;

 while(1){
#line 61 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula007.c"
 if (Button(&PORTB, 0, 50, 1))  rd6_bit  = 1;
 else  rd6_bit  = 0;
 if (Button(&PORTB, 1, 50, 0))  rd7_bit  = 1;
 else  rd7_bit  = 0;





 }
}
