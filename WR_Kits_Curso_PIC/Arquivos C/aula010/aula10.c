// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:
            Aula 010 - Curso PIC WRKits
            Controle de servomotores
*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es do sistema ---
#define S1 RA1_bit
#define S2 RA0_bit
#define L1 RA3_bit
#define L2 RA2_bit
#define servo1 RB0_bit // controle do servo-motor

// --- prot�tipo das fun��oes ---
void servo1_horario();
void servo1_centro();
void servo1_antihorario();

// --- vari�veis globais

// --- programa principal ---
void main() {
        cmcon = 0x07;  // desliga os comparadores internos
        trisA = 0x03;  // RA0 e RA1 como entrada digital, RA2 e RA3 como sa�da digital
        trisB = 0x00;  // portB como sa�da digital
        portA = 0x03;  // RA0 e RA1 iniciam em n�vel alto (pullup interno)
        portB = 0x00;  // port B inicia em n�vel baixo
        
        while(1){
            // se S1 pressionado - servo sentido hor�rio
            if(S1 == 0x00 && S2 == 0x01) servo1_horario();
            
            // se S2 pressionado = servo sentido anti-hor�rio
            if(S1 == 0x01 && S2 == 0x00) servo1_antihorario();
            
            // sen�o - servo centralizado
            if(S1 == 0x01 && S2 == 0x01) servo1_centro();
        }
}

// --- defini��o das fun��es
void servo1_centro(){
        servo1 = 0x00; // servo desacionado por 18,5 ms
        delay_us(18500);
        servo1 = 0x01; // servo acionado por 1,5 ms - posi��o central (90�)
        delay_us(1500);
}

void servo1_antihorario(){
        servo1 = 0x00; // servo desacionado por 19 ms
        delay_us(19000);
        servo1 = 0x01;
        delay_us(1000); // servo acionado por 1,5 ms - anti-hor�rio (-90�)
}

void servo1_horario(){
        servo1 = 0x00; // servo desacionado por 18 ms
        delay_us(18000);
        servo1 = 0x01;
        delay_us(2000); // servo acionado por 1,5 ms - hor�rio (+90�)
}