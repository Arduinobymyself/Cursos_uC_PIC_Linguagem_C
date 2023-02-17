/*******************************************************************************
Biblioteca para acionamento de um Motor de Passo Unipolar
Autor: Vitor Santos
www.youtube.com/profvitorsantos
*******************************************************************************/
//Modo de acionamento
unsigned char _Stepper_WaveStep[5] = {4, 0b0001, 0b0010, 0b0100, 0b1000};
unsigned char _Stepper_FullStep[5] = {4, 0b0011, 0b0110, 0b1100, 0b1001};
unsigned char _Stepper_HalfStep[9] = {8, 0b0001, 0b0011, 0b0010, 0b0110, 0b00100, 0b1100, 0b1000, 0b1001};

//Configura os pinos de saida
extern sfr sbit Stepper_PinB1;
extern sfr sbit Stepper_PinB2;
extern sfr sbit Stepper_PinB3;
extern sfr sbit Stepper_PinB4;

//Configura a direção dos pinos
extern sfr sbit Stepper_PinB1_Direction;
extern sfr sbit Stepper_PinB2_Direction;
extern sfr sbit Stepper_PinB3_Direction;
extern sfr sbit Stepper_PinB4_Direction;

unsigned int _delay_Stepper = 100;
unsigned char *_pStepper;


void Stepper_Init(unsigned char _pStepper_, unsigned char _nSteps, unsigned char _rpm){
 _delay_Stepper = 60000 / _nSteps / _rpm;
 Stepper_PinB1_Direction = 0;
 Stepper_PinB2_Direction = 0;
 Stepper_PinB3_Direction = 0;
 Stepper_PinB4_Direction = 0;
 Stepper_PinB1 = 0;
 Stepper_PinB2 = 0;
 Stepper_PinB3 = 0;
 Stepper_PinB4 = 0;
 _pStepper = _pStepper_;
}

void Stepper_One_Step(unsigned char direcao_Stepper){

unsigned char stepCount = 0;
unsigned char tamanho = _pStepper[0];
unsigned char Stepper_Step = _pStepper[(stepCount % tamanho) + 1];

    if(direcao_Stepper == 0)
     stepCount++;
    else
     stepCount--;

    Stepper_PinB1 = Stepper_Step.f0;
    Stepper_PinB2 = Stepper_Step.f1;
    Stepper_PinB3 = Stepper_Step.f2;
    Stepper_PinB4 = Stepper_Step.f3;

    VDelay_ms(_delay_Stepper);
}

void Stepper_Step(int _Step_Stepper){
  unsigned int _i_cont = 0;

  if(_Step_Stepper > 0){
    _i_cont = _Step_Stepper;
    while(_i_cont--) {
     Stepper_One_Step(0);
    }
  }else{
    _i_cont = (_Step_Stepper*-1);
    while(_i_cont--) {
     Stepper_One_Step(1);
    }
  }
}