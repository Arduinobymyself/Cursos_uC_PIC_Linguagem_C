#line 1 "C:/Users/ABMS-Telecom/Documents/GitHub/Cursos_uC_PIC_Linguagem_C/ALT - Alexsandro Lima Tutoriais/Curso-PIC-MikroC_Pro_aula048_Teclado_4/Aula047_Teclado_2.c"




sbit LCD_RS at RD3_bit;
sbit LCD_EN at RD2_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD3_bit;
sbit LCD_EN_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


char keypadPort at PORTB;

char tecla;




void main() {

 ADCON1 = 0xFF;
 TRISB = 0xF0;
 PORTB = 0xFF;
 TRISA = 0x00;
 PORTA = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Keypad_Init();



 while(1){
 tecla = Keypad_Key_Click();

 switch(tecla){
 case 1: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
 case 2: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
 case 3: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 1"); break;
 case 4: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla A"); break;
 case 5: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 4"); break;
 case 6: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 5"); break;
 case 7: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 6"); break;
 case 8: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla B"); break;
 case 9: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 7"); break;
 case 10: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 8"); break;
 case 11: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 9"); break;
 case 12: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla C"); break;
 case 13: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla *"); PORTA.RA0 = 1; break;
 case 14: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla 0"); break;
 case 15: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla #"); PORTA.RA0 = 0; break;
 case 16: Lcd_Cmd(_LCD_CLEAR); Lcd_Out_CP("    Tecla D"); break;
 }


 }

}
