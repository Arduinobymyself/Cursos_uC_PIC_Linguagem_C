// --- Cabe�alho --- //
/*
  Projeto: Estudo do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  Titulo / Descri��o: Testes com sa�das digitais
  
  
  
*/
// --- observa��es e coment�rios gerais --- //
/*
    para setar um bit do port D, poe exemplo o ED0 pode se usar pord.rd0 = 1
    ou ent�o RD0_bit = 1
    ou ainda diretamente portd = 0b00000001 | 0x01 | 1
*/


// --- bibliotecas --- //

// --- defini��es do sistema ---//

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais

// --- programa principal --- //
void main() {
    cmcon = 0x07;  // desliga os comparadores internos
    trisD = 0x00;  // RD0 a RD7 como sa�da digital
    portA = 0x00;  // RD0 a RD7 iniciam em n�vel baixo

    while(1){ // liga alternadamente os leds no port D
		portd = 0b10101010; // 0xAA, 170
		delay_ms(500);
		portd = 0b01010101; // 0x55, 85
		delay_ms(500);
    }
}

// --- defini��o das fun��es --- //
