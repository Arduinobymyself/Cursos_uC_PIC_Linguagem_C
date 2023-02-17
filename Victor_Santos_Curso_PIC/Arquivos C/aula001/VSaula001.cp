#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula001.c"
#line 29 "C:/Users/ABMS-Telecom/Documents/PROTEUS/VSaula001.c"
void main() {
 cmcon = 0x07;
 trisD = 0x00;
 portA = 0x00;

 while(1){
 portd = 0b10101010;
 delay_ms(500);
 portd = 0b01010101;
 delay_ms(500);
 }
}
