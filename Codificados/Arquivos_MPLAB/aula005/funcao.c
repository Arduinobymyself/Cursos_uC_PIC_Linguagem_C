
void piscaLed(){
	if(!S0){
		output_high(L0);
		delay_ms(500);
		output_low(L0);
		delay_ms(300);
	}
}