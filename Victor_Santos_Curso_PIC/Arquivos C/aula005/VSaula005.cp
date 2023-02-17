#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula005.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula005.c"
void main() {
 cmcon = 0x07;
 trisD = 0x00;
 trisB = 0x03;

 portD = 0x00;

 while(1){
 if(rb0_bit == 1) rd6_bit = 1;
 else rd6_bit = 0;

 if(rb1_bit == 0) rd7_bit =1;
 else rd7_bit = 0;

 }
}
