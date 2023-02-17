#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Teste_CanalAnalogico.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/Teste_CanalAnalogico.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


char texto[16];
int temp_res1 = 0;
int temp_res2 = 0;


void main() {

 TRISB = 0;
 TRISD = 0;
 ADCON1 = 0x06;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Canal AN0: ");
 delay_ms (10);
 Lcd_Out(2, 1, "Canal AN1: ");
 delay_ms (10);
 ADCON1 = 0b00000100;
 TRISA = 0b00001111;

 do {
 temp_res1 = Adc_Read(0);
 temp_res2 = Adc_Read(1);
 delay_us(10);
 WordToStr(temp_res1, texto);
 Lcd_Out(1, 11, texto);
 delay_us(10);
 WordToStr(temp_res2, texto);
 Lcd_Out(2, 11, texto);
 } while (1);

}
