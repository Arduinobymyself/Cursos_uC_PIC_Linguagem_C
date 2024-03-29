// --- Cabe�alho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  MCU: PIC16F877A
  T�tulo / descri��o:
  1. estudo das entradas
  2. bot�es
  3. debouncing por hw
  4. debouncing por sw
  5. biblioteca button



*/

// --- observa��es e coment�rios gerais --- //

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define S0 rb0_bit
#define S1 rb1_bit
#define L6 rd6_bit
#define L7 rd7_bit

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {
    cmcon = 0x07;  // desliga os comparadores internos
    trisD = 0x00;  // port D configurado como sa�da digital
    trisB = 0x03;  // port B RB1 e RB2 configurado com entrada digital

	portD = 0x00;  // port D inicia em n�vel baixo

    while(1){
		/*
		// modo usual de tratamento de debouncing via sw
		if(S0 == 1){
  		  delay_ms(50); // debouncing por sw
  		  if(S0 == 1) L6 = 1; // se e somente se depois de passado o tempo, aciona o LED
        } else{
  	      L6 = 0;
        }
  	    if(S1 == 0){
  	    delay_ms(50);  // debouncing por sw
  	    if(S1 == 0)  L7 =1;  // se e somente se depois de passado o tempo, aciona o LED
  	    }
  	    else{
  	      L7 = 0;
        }
        */

        if (Button(&PORTB, 0, 50, 1)) L6 = 1;
          else L6 = 0;
        if (Button(&PORTB, 1, 50, 0)) L7 = 1;
          else L7 = 0;
          




        
    }
}

// --- defini��o das fun��es auxiliares --- //
