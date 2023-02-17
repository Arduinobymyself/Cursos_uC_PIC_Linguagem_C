void main() {
   ADCON1 = 7;
   TRISB = 0xFF;
   PORTB = 0xFF;
   TRISD = 0x00;
   PORTD = 0b11000000; // LED7 e LED6 ligados
   
   OPTION_REG = 0b10001101; // PSA<3> = 1 para WDT - PS<2:0> prescaler 1:32 = 101
                             // 18ms * 32 = 576ms
                             
   while(1){
     PORTD.RD0 = ~PORTD.RD0;
     asm clrwdt; // chama interrup��o do Assembly, limpando a flag de estouro do WDT
     delay_ms(500); // na simula��o, podemos variar esse tempo, se for maior que 576ms
                    // ocorrer� o estouro do WDT e ocorrer� o reset do uC
                    // outra forma de simular � modificando o prescaller do WDT
                    // exemplo 1:16  PS<2:0> = 100
   }
}