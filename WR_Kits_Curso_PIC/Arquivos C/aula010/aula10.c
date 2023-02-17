// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
            Aula 010 - Curso PIC WRKits
            Controle de servomotores
*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições do sistema ---
#define S1 RA1_bit
#define S2 RA0_bit
#define L1 RA3_bit
#define L2 RA2_bit
#define servo1 RB0_bit // controle do servo-motor

// --- protótipo das funçãoes ---
void servo1_horario();
void servo1_centro();
void servo1_antihorario();

// --- variáveis globais

// --- programa principal ---
void main() {
        cmcon = 0x07;  // desliga os comparadores internos
        trisA = 0x03;  // RA0 e RA1 como entrada digital, RA2 e RA3 como saída digital
        trisB = 0x00;  // portB como saída digital
        portA = 0x03;  // RA0 e RA1 iniciam em nível alto (pullup interno)
        portB = 0x00;  // port B inicia em nível baixo
        
        while(1){
            // se S1 pressionado - servo sentido horário
            if(S1 == 0x00 && S2 == 0x01) servo1_horario();
            
            // se S2 pressionado = servo sentido anti-horário
            if(S1 == 0x01 && S2 == 0x00) servo1_antihorario();
            
            // senão - servo centralizado
            if(S1 == 0x01 && S2 == 0x01) servo1_centro();
        }
}

// --- definição das funções
void servo1_centro(){
        servo1 = 0x00; // servo desacionado por 18,5 ms
        delay_us(18500);
        servo1 = 0x01; // servo acionado por 1,5 ms - posição central (90º)
        delay_us(1500);
}

void servo1_antihorario(){
        servo1 = 0x00; // servo desacionado por 19 ms
        delay_us(19000);
        servo1 = 0x01;
        delay_us(1000); // servo acionado por 1,5 ms - anti-horário (-90º)
}

void servo1_horario(){
        servo1 = 0x00; // servo desacionado por 18 ms
        delay_us(18000);
        servo1 = 0x01;
        delay_us(2000); // servo acionado por 1,5 ms - horário (+90º)
}