#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/PWM_FAN_Control_4_Speed_Display/PWM_FAN_Control.c"
#line 24 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/PWM_FAN_Control_4_Speed_Display/PWM_FAN_Control.c"
int valorPWM = 0, porcentagem = 0;
int contador = 0, tempo = 1;
bit flagB0, flagB1;
int numero[10] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
int display[5] = {0, 4, 8, 16, 32};


void bip();
void setPWM(int porcentagem);
void displaySpeed(int contador);


void main() {
 CMCON = 7;

 ADCON0 = 0;
 ADCON1 = 7;
 TRISB = 0b00000011;
 TRISC.RC1 = 0;
 PORTC.RC1 = 0;
 TRISD = 0;
 PORTD = 0;
 TRISA = 0;
 PORTA = 0;

 PWM1_Init(5000);
 PWM1_Start();
 PWM1_Set_Duty(valorPWM);

 while(1){

 if( PORTB.RB0  && flagB0 == 0){
 flagB0 = 1;
 }
 if(! PORTB.RB0  && flagB0 == 1){
 flagB0 = 0;
 porcentagem -= 25;
 if(porcentagem < 0){
 porcentagem = 0;
 bip();
 }
 contador--;
 if(contador <= 0){
 contador = 0;
 }
 setPWM(porcentagem);
 }

 if( PORTB.RB1  && flagB1 == 0){
 flagB1 = 1;
 }
 if(! PORTB.RB1  && flagB1 == 1){
 flagB1 = 0;
 porcentagem += 25;
 if(porcentagem > 100){
 porcentagem = 100;
 bip();
 }
 contador++;
 if(contador >= 4){
 contador = 4;
 }
 setPWM(porcentagem);
 }






 displaySpeed(porcentagem);

 }

}


void displaySpeed(int valorNumerico){
 int valor, resto;

 valor = valorNumerico/1000;
 PORTD = numero[valor];
 PORTA = display[1];
 Vdelay_ms(tempo);


 valor = valorNumerico/100;
 resto = valor % 10;
 PORTD = numero[resto];
 PORTA = display[2];
 Vdelay_ms(tempo);


 valor = valorNumerico/10;
 resto = valor % 10;
 PORTD = numero[resto];
 PORTA = display[3];
 Vdelay_ms(tempo);


 valor = valorNumerico/1;
 resto = valor % 10;
 PORTD = numero[resto];
 PORTA = display[4];
 Vdelay_ms(tempo);

}

void setPWM(int porcentagem){

 valorPWM = (porcentagem*255)/100;
 PWM1_Set_Duty(valorPWM);
}

void bip(){
 PORTC.RC1 = 1;
 delay_ms(250);
 PORTC.RC1 = 0;
 delay_ms(250);
}
