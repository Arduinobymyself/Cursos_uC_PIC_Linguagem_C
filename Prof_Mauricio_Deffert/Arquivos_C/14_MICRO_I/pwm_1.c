#define PWM1 RC2_bit

// demonstração de uso do PWM sem uso de bibliotecas e ou configuração do módulo CCP
// controle de motor DC no pino RC2(PWM1) ou outra saída digital
// variando o duty podemos controlar a velocidade
// e usando o CI L293, conseguimos controlar também  a direção
int duty = 1;

void main() {
  TRISC = 0;
  PORTC = 0;
  while(1){
    PWM1 = 1;
    Vdelay_ms(duty);
    PWM1 = 0;
    Vdelay_ms(10-duty);
  }

}